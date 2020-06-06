//
//  OptionalArray+Append.swift
//  NDKit
//
//  Created by Nicolas Degen on 06.06.20.
//  Copyright © 2020 Echo Labs AG. All rights reserved.
//

import Foundation

public extension Optional where Wrapped: RangeReplaceableCollection {
  mutating func append(_ newElement: Wrapped.Element) {
    self = (self ?? Wrapped()) + [newElement]
  }
  
  var count: Int {
    return self?.count ?? 0
  }
}
