//
//  UserDefaults+Codable.swift
//  NDKit
//
//  Created by Nicolas Degen on 26.04.20.
//  Copyright © 2020 Nicolas Degen. All rights reserved.
//

import Foundation

public extension UserDefaults {
  func setCodable<Element: Codable>(value: Element, forKey key: String) {
    let data = try? JSONEncoder().encode(value)
    UserDefaults.standard.setValue(data, forKey: key)
  }
  
  func getCodable<Element: Codable>(forKey key: String) -> Element? {
    guard let data = UserDefaults.standard.data(forKey: key) else { return nil }
    let element = try? JSONDecoder().decode(Element.self, from: data)
    return element
  }
}
