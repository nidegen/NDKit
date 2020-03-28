//
//  UIView+attachView.swift
//  NDKit
//
//  Created by Nicolas Degen on 12.01.19.
//  Copyright © 2019 Nicolas Degen. All rights reserved.
//

import UIKit

extension UIView {
  public func attachViewBelow(_ referenceView: UIView) {
    self.translatesAutoresizingMaskIntoConstraints = false
    self.frame = .zero
    
    if(self.superview != referenceView.superview) {
      self.removeFromSuperview()
      referenceView.superview?.addSubview(self)
    }
    
    let constraintX = self.centerXAnchor.constraint(equalTo: referenceView.centerXAnchor)
    constraintX.isActive = true
    constraintX.priority = .defaultLow
    
    let constraintY = self.topAnchor.constraint(equalTo: referenceView.bottomAnchor, constant: -30)
    constraintY.isActive = true
    constraintY.priority = .defaultLow
    
    let constraintW = self.widthAnchor.constraint(equalTo: referenceView.widthAnchor)
    constraintW.isActive = true
    constraintW.priority = .defaultLow
    
    let constraintH = self.heightAnchor.constraint(equalTo: referenceView.heightAnchor)
    constraintH.isActive = true
    constraintH.priority = .defaultLow
  }
  
  public func attachViewAbove(_ referenceView: UIView) {
    self.translatesAutoresizingMaskIntoConstraints = false
    self.frame = .zero
    
    if(self.superview != referenceView.superview) {
      self.removeFromSuperview()
      referenceView.superview?.addSubview(self)
    }
    
    let constraintX = self.centerXAnchor.constraint(equalTo: referenceView.centerXAnchor)
    constraintX.isActive = true
    constraintX.priority = .defaultLow
    
    let constraintY = self.bottomAnchor.constraint(equalTo: referenceView.topAnchor, constant: 30)
    constraintY.isActive = true
    constraintY.priority = .defaultLow
    
    let constraintW = self.widthAnchor.constraint(equalTo: referenceView.widthAnchor)
    constraintW.isActive = true
    constraintW.priority = .defaultLow
    
    let constraintH = self.heightAnchor.constraint(equalTo: referenceView.heightAnchor)
    constraintH.isActive = true
    constraintH.priority = .defaultLow
  }
}
