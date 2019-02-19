//
//  ViewController.swift
//  NiDemo
//
//  Created by Nicolas Degen on 15.02.19.
//  Copyright © 2019 Nicolas Degen. All rights reserved.
//

import UIKit

import NDKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    let ndVC = NDWelcomeViewController()
//    ndVC.mainColor = .red
//    ndVC.backgroundColor = .lightGray
//    ndVC.textColor = .darkGray
//    ndVC.buttonTextColor = .lightGray
    
    ndVC.details.append((UIImage(named: "Star")!, "Gimme Shelter:", "Love, sister, is just a kiss away. War, children, is just a shot away, shot away, shot away"))
    ndVC.details.append((UIImage(named: "Circle")!, "Gimme Shelter:", "Love, sister, is just a kiss away. War, children, is just a shot away, shot away, shot away"))
    ndVC.details.append((UIImage(named: "Square")!, "Gimme Shelter:", "Love, sister, is just a kiss away. War, children, is just a shot away, shot away, shot away"))
    
    ndVC.presentInOverlayWindow()
  }
}

