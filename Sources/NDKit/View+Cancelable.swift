//
//  View+Cancelable.swift
//  NDKit
//
//  Created by Nicolas Degen on 15.05.20.
//  Copyright © 2020 Nicolas Degen. All rights reserved.
//

import SwiftUI

public struct CancelableView<Content> : View where Content : View {
  let content: () -> Content
  
  @Environment(\.presentationMode) var presentationMode
  
  public init(@ViewBuilder content: @escaping () -> Content) {
    self.content = content
  }
  
  var leadingItem: some View {
    Button("Cancel") {
      self.presentationMode.wrappedValue.dismiss()
    }
  }
  
  public var body: some View {
    content()
      .navigationBarItems(leading: leadingItem)
  }
}

extension View {
  public func cancelable() -> some View {
    CancelableView {
      self
    }
  }
}
