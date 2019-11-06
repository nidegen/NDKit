//
//  UIViewController+PresentInOverlayWindow.swift
//  NDKit
//
//  Created by Nicolas Degen on 12.01.19.
//  Copyright © 2019 Nicolas Degen. All rights reserved.
//

import UIKit

extension UIViewController {
  @discardableResult public func presentInOverlayWindow(animated: Bool = true, completion: (() -> ())? = nil) -> UIWindow {
    let topWindow: UIWindow = UIWindow(frame: UIScreen.main.bounds)
    topWindow.rootViewController = UIViewController()
    topWindow.windowLevel = UIWindow.Level.alert + 1
    topWindow.makeKeyAndVisible()
    topWindow.rootViewController?.present(self, animated: animated, completion: completion)
    return topWindow
  }
}
