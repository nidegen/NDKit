//
//  UIViewController+DismissAnimated.swift
//  NDKit
//
//  Created by Nicolas Degen on 17.02.19.
//  Copyright © 2019 Nicolas Degen. All rights reserved.
//

import UIKit

extension UIViewController {
  @objc public func dismissAnimated() {
    self.dismiss(animated: true)
  }
  
  @objc public func closeAnimated() {
    if navigationController?.topViewController == self {
      self.dismiss(animated: true)
    } else {
      navigationController?.popViewController(animated: true)
    }
  }
}
