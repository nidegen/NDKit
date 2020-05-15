//
//  View+ActionSheet.swift
//  NDKit
//
//  Created by Nicolas Degen on 15.05.20.
//  Copyright © 2020 Nicolas Degen. All rights reserved.
//

import SwiftUI


public class BasicActionSheet: Identifiable  {
  public init(title: String, message: String? = nil, buttons: [ActionSheet.Button]) {
    self.title = title
    self.message = message
    self.buttons = buttons
  }
  
  public let buttons: [ActionSheet.Button]
  public let title: String
  public let message: String?
  public var id: String { title + (message ?? "") }
  
  public var sheet: ActionSheet {
    return ActionSheet(title: Text(title), message: message.map { Text($0) }, buttons: buttons)
  }
}

public extension View {
  func actionSheet<T: BasicActionSheet>(_ data: Binding<T?>) -> some View {
    self.actionSheet(item: data){ data in
      data.sheet
    }
  }
}
