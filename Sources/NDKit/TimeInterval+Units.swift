//
//  TimeInterval+Units.swift
//  NDKit
//
//  Created by Nicolas Degen on 18.04.19.
//  Copyright © 2019 Nicolas Degen. All rights reserved.
//

import Foundation

public extension TimeInterval {
  static var second: TimeInterval = 1
  static var minute: TimeInterval = 60
  static var hour: TimeInterval = 60 * 60
  static var day: TimeInterval = 60 * 60 * 24
  static var week: TimeInterval = 60 * 60 * 24 * 7
  static var year: TimeInterval = 60 * 60 * 24 * 365
}
