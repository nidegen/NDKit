//
//  View+Doable.swift
//  NDKit
//
//  Created by Nicolas Degen on 07.05.20.
//  Copyright © 2020 Nicolas Degen. All rights reserved.
//

import SwiftUI

public struct DoableView<Content> : View where Content : View {
  let content: () -> Content
  
  @Environment(\.presentationMode) var presentationMode
  
  var action: (()->())?
  
  public init(action: (()->())? = nil, @ViewBuilder content: @escaping () -> Content) {
    self.content = content
    self.action = action
  }
  
  var trailingItem: some View {
    Button("Done") {
      self.action?()
      self.presentationMode.wrappedValue.dismiss()
    }
  }
  
  public var body: some View {
    content()
      .navigationBarItems(trailing: trailingItem)
  }
}

extension View {
  public func doable(action: (()->())? = nil) -> some View {
    DobleView(action: action) {
      self
    }
  }
}

public struct DoableModifier: ViewModifier {
  public func body(content: Content) -> some View {
    DoableView {
      content
    }
  }
}
