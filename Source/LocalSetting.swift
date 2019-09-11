//
//  LocalSetting.swift
//  NDKit
//
//  Created by Nicolas Degen on 19.05.19.
//  Copyright © 2019 Nicolas Degen. All rights reserved.
//

import Foundation


protocol SettingType {}
extension String: SettingType {}
extension Bool: SettingType {}
extension Int: SettingType {}


class LocalSetting<T: SettingType> {
  let key: String
  let defaultValue: T
  
  init(key: String, defaultValue: T) {
    self.key = key
    self.defaultValue = defaultValue
  }
  
  // MARK: - Set / Get value
  
  var value: T {
    set {
      UserDefaults.standard.set(newValue, forKey: key)
    }
    get {
      switch T.self {
      case is String.Type:
        return keyValueStore.string(forKey: key) as? T ?? defaultValue
      case is Bool.Type:
        return keyValueStore.bool(forKey: key) as? T ?? defaultValue
      case is Int.Type:
        return keyValueStore.int(forKey: key) as? T ?? defaultValue
      default:
        fatalError("The swift compiler should be smart enough to realise that this switch is exaustive")
      }
    }
  }
  
  // MARK: - Manage Observers
  
  func add(changeObserver: AnyObject, selector: Selector) {
    let observer = Observer(object: changeObserver, selector: selector)
    observers.append(observer)
  }
  
  func remove(changeObserver observerToRemove: AnyObject) {
    observers = observers.filter { $0.object !== observerToRemove }
  }
  
  private func sendChangeEvent() {
    
    observers = observers.filter { $0.object != nil }
    observers.forEach {
      _ = $0.object?.perform($0.selector)
    }
  }
}

