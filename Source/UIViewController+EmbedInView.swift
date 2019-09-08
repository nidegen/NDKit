//
//  UIViewController+EmbedInView.swift
//  NDKit
//
//  Created by Nicolas Degen on 08.09.19.
//  Copyright © 2019 Nicolas Degen. All rights reserved.
//

import UIKit

extension UIViewController {
    func embedInView(_ embeddingView: UIView, controlledBy parentVC: UIViewController) {
        embeddingView.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.widthAnchor.constraint(equalTo: embeddingView.widthAnchor).isActive = true
        view.centerXAnchor.constraint(equalTo: embeddingView.centerXAnchor).isActive = true
        view.heightAnchor.constraint(equalTo: embeddingView.heightAnchor).isActive = true
        view.centerYAnchor.constraint(equalTo: embeddingView.centerYAnchor).isActive = true
        
        parentVC.addChild(self)
        self.didMove(toParent: parentVC)
    }
}
