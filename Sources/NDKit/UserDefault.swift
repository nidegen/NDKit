//
//  UserDefault.swift
//  NDKit
//
//  Created by Nicolas Degen on 19.06.20.
//  Copyright © 2020 Nicolas Degen. All rights reserved.
//

import Foundation

@propertyWrapper
public struct UserDefault<T> {
  
  let key: String
  
  init(key: String) {
    self.key = key
  }
  
  public var wrappedValue: T? {
    get {
      UserDefaults.standard.object(forKey: key) as? T
    }
    set {
      UserDefaults.standard.set(newValue, forKey: key)
    }
  }
}
