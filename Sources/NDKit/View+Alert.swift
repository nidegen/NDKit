//
//  View+Alert.swift
//  NDKit
//
//  Created by Nicolas Degen on 20.04.20.
//  Copyright © 2019 Nicolas Degen. All rights reserved.
//

import SwiftUI


public struct AlertData {
  public init(title: String, message: String, destructiveText: String, destructiveAction: @escaping () -> ()) {
    self.title = title
    self.message = message
    self.destructiveText = destructiveText
    self.destructiveAction = destructiveAction
  }
  
  public let title: String
  public let message: String
  public let destructiveText: String
  public let destructiveAction: ()->()
  
  public var alert: Alert {
    Alert(title: Text(title),
          message: Text(message),
          primaryButton: .destructive(Text(destructiveText), action: destructiveAction),
          secondaryButton: .cancel())
  }
}

extension AlertData: Identifiable {
  public var id: String { title + message }
}

public extension View {
  func alert(_ data: Binding<AlertData?>, content: (AlertData) -> Alert) -> some View {
    self.alert(item: data) { data in
      data.alert
    }
  }
}
