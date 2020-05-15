//
//  View+Alert.swift
//  NDKit
//
//  Created by Nicolas Degen on 20.04.20.
//  Copyright © 2020 Nicolas Degen. All rights reserved.
//

import SwiftUI


public class BasicAlert: Identifiable  {
  public init(title: String, message: String) {
    self.title = title
    self.message = message
  }
  
  public let title: String
  public let message: String
  public var id: String { title + message }
  
  public var alert: Alert {
    return Alert(title: Text(title),
                 message: Text(message))
  }
}

public class OptionAlert: BasicAlert {
  public init(title: String, message: String,
              textA: String, actionA: @escaping () -> (),
              textB: String, actionB: @escaping () -> ()) {
    self.textA = textA
    self.actionA = actionA
    self.textB = textB
    self.actionB = actionB
    super.init(title: title, message: message)
  }
  
  public var textA: String
  public var actionA: (()->())?
  public var textB: String
  public var actionB: (()->())?
  
  public override var alert: Alert {
    return Alert(title: Text(title),
                 message: Text(message),
                 primaryButton: .default(Text(textA), action: actionA),
                 secondaryButton: .default(Text(textB), action: actionB))
  }
}

public class DestructiveAlert: BasicAlert {
  public init(title: String, message: String, text: String, action: @escaping () -> ()) {
    self.text = text
    self.action = action
    super.init(title: title, message: message)
  }
  
  public var text: String
  public var action: (()->())?
  
  public override var alert: Alert {
    return Alert(title: Text(title),
                 message: Text(message),
                 primaryButton: .destructive(Text(text), action: action),
                 secondaryButton: .cancel())
  }
}

public class DefaultAlert: BasicAlert {
  public init(title: String, message: String, text: String, action: @escaping () -> ()) {
    self.text = text
    self.action = action
    super.init(title: title, message: message)
  }
  
  public var text: String
  public var action: (()->())?
  
  public override var alert: Alert {
    return Alert(title: Text(title),
                 message: Text(message),
                 primaryButton: .default(Text(text), action: action),
                 secondaryButton: .cancel())
  }
}

@available(*, deprecated, message: "Use DefaultAlert or DestructiveAlert instead")
public class AlertData: BasicAlert {
  public init(title: String, message: String, destructiveText: String, destructiveAction: @escaping () -> ()) {
    self.destructiveText = destructiveText
    self.destructiveAction = destructiveAction
    super.init(title: title, message: message)
  }
  
  public init(title: String, message: String, normalText: String, normalAction: @escaping () -> ()) {
    self.normalText = normalText
    self.normalAction = normalAction
    super.init(title: title, message: message)
  }
  
  var destructiveText: String?
  var destructiveAction: (()->())?
  
  var normalText: String?
  var normalAction: (()->())?
  
  public override var alert: Alert {
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
  func alert<T: BasicAlert>(_ data: Binding<T?>) -> some View {
    self.alert(item: data) { data in
      data.alert
    }
  }
}
