//
//  UIView+addSubviewWIthLayout.swift
//  NDKit
//
//  Created by Nicolas Degen on 12.01.19.
//  Copyright © 2019 Nicolas Degen. All rights reserved.
//

import UIKit

public enum NDViewLayout {
  case bottom;
  case top;
  case bottomLeft;
  case bottomRight;
}

extension UIView {
  public func addSubview(withLayout layout: NDViewLayout, view: UIView) {
    let margins = self.layoutMarginsGuide
    view.translatesAutoresizingMaskIntoConstraints = false
    view.frame = .zero
    self.addSubview(view)
    
    switch layout {
    case .bottom:
      let constraintX = view.centerXAnchor.constraint(equalTo: margins.centerXAnchor)
      constraintX.isActive = true
      constraintX.priority = .defaultLow
      
      let constraintY = self.bottomAnchor.constraint(equalTo: margins.bottomAnchor, constant: -30)
      constraintY.isActive = true
      constraintY.priority = .defaultLow
      
      let constraintW = view.widthAnchor.constraint(equalTo: margins.widthAnchor, multiplier: 0.7)
      constraintW.isActive = true
      constraintW.priority = .defaultLow
      
      let constraintH = view.heightAnchor.constraint(equalToConstant: 50)
      constraintH.isActive = true
      constraintH.priority = .defaultLow
      
    case .top:
      let constraintX = view.centerXAnchor.constraint(equalTo: margins.centerXAnchor)
      constraintX.isActive = true
      constraintX.priority = .defaultLow
      
      let constraintY = view.topAnchor.constraint(equalTo: margins.topAnchor, constant: 30)
      constraintY.isActive = true
      constraintY.priority = .defaultLow
      let constraintW = view.widthAnchor.constraint(equalTo: margins.widthAnchor, multiplier: 0.7)
      constraintW.isActive = true
      constraintW.priority = .defaultLow
      
      let constraintH = view.heightAnchor.constraint(equalToConstant: 50)
      constraintH.isActive = true
      constraintH.priority = .defaultLow
      
    default:
      let constraintX = self.centerXAnchor.constraint(equalTo: margins.centerXAnchor)
      constraintX.isActive = true
      constraintX.priority = .defaultLow
      
      let constraintY = self.bottomAnchor.constraint(equalTo: margins.bottomAnchor, constant: -30)
      constraintY.isActive = true
      constraintY.priority = .defaultLow
      
      let constraintW = self.widthAnchor.constraint(equalTo: margins.widthAnchor, multiplier: 0.7)
      constraintW.isActive = true
      constraintW.priority = .defaultLow
      
      let constraintH = self.heightAnchor.constraint(equalToConstant: 50)
      constraintH.isActive = true
      constraintH.priority = .defaultLow
    }
  }
}
