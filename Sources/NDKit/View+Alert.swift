//
//  View+Alert.swift
//  NDKit
//
//  Created by Nicolas Degen on 20.04.20.
//  Copyright © 2019 Nicolas Degen. All rights reserved.
//

import SwiftUI


public struct AlertData: Identifiable {
  public init(title: String, message: String, destructiveText: String, destructiveAction: @escaping () -> ()) {
    self.title = title
    self.message = message
    self.destructiveText = destructiveText
    self.destructiveAction = destructiveAction
  }
  
  public init(title: String, message: String, normalText: String, normalAction: @escaping () -> ()) {
    self.title = title
    self.message = message
    self.normalText = normalText
    self.normalAction = normalAction
  }
  
  public var id: String { title + message }
  
  let title: String
  let message: String
  
  var destructiveText: String?
  var destructiveAction: (()->())?
  
  var normalText: String?
  var normalAction: (()->())?
  
  public var alert: Alert {
    if let text = destructiveText, let action = destructiveAction {
      return Alert(title: Text(title),
                   message: Text(message),
                   primaryButton: .destructive(Text(text), action: action),
                   secondaryButton: .cancel())
    } else if let text = normalText, let action = normalAction {
      return Alert(title: Text(title),
                   message: Text(message),
                   primaryButton: .default(Text(text), action: action),
                   secondaryButton: .cancel())
    } else {
      return Alert(title: Text(title),
                   message: Text(message))
    }
  }
}

public extension View {
  func alert(_ data: Binding<AlertData?>) -> some View {
    self.alert(item: data) { data in
      data.alert
    }
  }
}
