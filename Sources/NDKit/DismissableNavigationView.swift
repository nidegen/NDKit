//
//  DismissableNavigationView.swift
//  NDKit
//
//  Created by Nicolas Degen on 07.05.20.
//  Copyright © 2020 Nicolas Degen. All rights reserved.
//

import SwiftUI

public struct DismissableNavigationView<Content> : View where Content : View {
  let content: () -> Content
  
  @Environment(\.presentationMode) var presentationMode
  
  public init(@ViewBuilder content: @escaping () -> Content) {
    self.content = content
  }
  
  var trailingItem: some View {
    Button("Done") {
      self.presentationMode.wrappedValue.dismiss()
    }
  }
  
  var leadingItem: some View {
    EmptyView()
  }
  
  public var body: some View {
    NavigationView {
      content()
        .navigationBarItems(leading: leadingItem, trailing: trailingItem)
    }
  }
}
