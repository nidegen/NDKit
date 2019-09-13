//
//  UIStoryboard+Init.swift
//  NDKit
//
//  Created by Nicolas Degen on 13.09.19.
//  Copyright © 2019 Nicolas Degen. All rights reserved.
//

import Foundation

extension UIStoryboard {
  public convenience init(name: String) {
    self.init(name: name, bundle: nil)
  }
}
