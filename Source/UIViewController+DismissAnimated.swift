//
//  UIViewController+DismissAnimated.swift
//  NDKit
//
//  Created by Nicolas Degen on 17.02.19.
//  Copyright © 2019 Nicolas Degen. All rights reserved.
//

import UIKit

extension UIViewController {
  @objc func dismissAnimated() {
    self.dismiss(animated: true, completion: nil)
  }
}
