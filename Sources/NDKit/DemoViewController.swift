//
//  DemoViewController.swift
//  NDKit
//
//  Created by Nicolas Degen on 15.02.19.
//  Copyright © 2019 Nicolas Degen. All rights reserved.
//

import UIKit

import NDKit

class DemoViewController: UIViewController {

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
    AppStoreReviewManager.minimumReviewWorthyActionCount = 2
    AppStoreReviewManager.askToWriteReview(forAppId: "id958625272")
    
//    let scrollView = UIScrollView(frame: .zero)
//    view.addSubview(scrollView)
//    scrollView.pinToSuperviewEdges()
//
//    let largeView = UIView(frame: .zero)
//    largeView.backgroundColor = .blue
//    scrollView.addSubview(largeView)
//    largeView.translatesAutoresizingMaskIntoConstraints = false
//    largeView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 30).isActive = true
//    largeView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
//    largeView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 2).isActive = true
//    largeView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5).isActive = true
//    largeView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
  }
}
