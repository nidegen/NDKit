//
//  OptionalDatePicker.swift
//  NDKit
//
//  Created by Nicolas Degen on 09.04.20.
//  Copyright © 2020 Nicolas Degen. All rights reserved.
//

import SwiftUI

public struct OptionalDatePicker: UIViewRepresentable {
  @Binding var date: Date?
  
  var unsetText: String?
  
  public func makeUIView(context: Context) -> DatePickerLabel {
    return DatePickerLabel { date in
      self.date = date
    }
  }
  
  public func updateUIView(_ uiView: DatePickerLabel, context: Context) {
    if let date = date {
      uiView.text = DateFormatter.localizedString(from: date, dateStyle: .medium, timeStyle: .medium)
    } else {
      uiView.text = unsetText ?? "Date not set"
    }
  }
}

public class DatePickerLabel: UILabel {
  
  private let _inputAccessoryToolbar: UIToolbar = {
    let toolBar = UIToolbar()
    toolBar.barStyle = UIBarStyle.default
    toolBar.isTranslucent = true
    
    toolBar.sizeToFit()
    
    return toolBar
  }()
  
  var datePicker = UIDatePicker()
  
  var updateCallback: (Date)->()
  
  public override var inputView: UIView? {
    return datePicker
  }
  
  public override var inputAccessoryView: UIView? {
    return _inputAccessoryToolbar
  }
  
  required init(update: @escaping (Date)->()) {
    updateCallback = update
    super.init(frame: .zero)
    
    let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.plain, target: self, action: #selector(doneClick))
    let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
    
    let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target:self, action: #selector(cancelClick));
    
    _inputAccessoryToolbar.setItems([cancelButton, spaceButton, doneButton], animated: false)
    
    let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(launchPicker))
    self.addGestureRecognizer(tapRecognizer)
    isUserInteractionEnabled = true
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  public override var canBecomeFirstResponder: Bool {
    return true
  }
  
  @objc private func launchPicker() {
    datePicker.maximumDate = Date()
    becomeFirstResponder()
  }
  
  @objc private func doneClick() {
    updateCallback(datePicker.date)
    resignFirstResponder()
  }
  
  @objc private func cancelClick() {
    resignFirstResponder()
  }
}
