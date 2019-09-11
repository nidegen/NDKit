//
//  UserDefaults+Key.swift
//  NDKit
//
//  Created by Nicolas Degen on 03.05.19.
//  Copyright © 2019 Nicolas Degen. All rights reserved.
//

import Foundation

extension UserDefaults {
  enum Key: String {
    case reviewWorthyActionCount
    case lastRatingRequestAppVersion
    case lastLaunchedVersion
  }
  
  func integer(forKey key: Key) -> Int {
    return integer(forKey: key.rawValue)
  }
  
  func string(forKey key: Key) -> String? {
    return string(forKey: key.rawValue)
  }
  
  func set(_ integer: Int, forKey key: Key) {
    set(integer, forKey: key.rawValue)
  }
  
  func set(_ object: Any?, forKey key: Key) {
    set(object, forKey: key.rawValue)
  }
}
