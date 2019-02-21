//
//  NDWelcomeViewController.swift
//  NDKit
//
//  Created by Nicolas Degen on 15.02.19.
//  Copyright © 2019 Nicolas Degen. All rights reserved.
//

import UIKit

public class NDWelcomeViewController: UIViewController {
  public var mainColor = UIColor.blue
  public var backgroundColor: UIColor = UIColor.white
  public var textColor = UIColor.black
  public var buttonTextColor = UIColor.white
  public let welcomeLabel = UILabel(frame: .zero)
  public let nameLabel = UILabel(frame: .zero)
    
  public var details = [(UIImage, String, String)]()
  
  override public func loadView() {
    super.loadView()
    
    view.backgroundColor = backgroundColor
    
    let safeArea = view.safeAreaLayoutGuide
    
    let mainLayoutGuide = UILayoutGuide()
    view.addLayoutGuide(mainLayoutGuide)
    mainLayoutGuide.widthAnchor.constraint(equalTo: safeArea.widthAnchor, multiplier: 0.8).isActive = true
    mainLayoutGuide.heightAnchor.constraint(equalTo: safeArea.heightAnchor, multiplier: 0.9).isActive = true
    mainLayoutGuide.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor).isActive = true
    mainLayoutGuide.centerYAnchor.constraint(equalTo: safeArea.centerYAnchor).isActive = true
    
    let titleLayoutGuide = UILayoutGuide()
    view.addLayoutGuide(titleLayoutGuide)
    titleLayoutGuide.heightAnchor.constraint(equalToConstant: 100).isActive = true
    titleLayoutGuide.widthAnchor.constraint(equalTo: mainLayoutGuide.widthAnchor).isActive = true
    titleLayoutGuide.topAnchor.constraint(equalTo: mainLayoutGuide.topAnchor).isActive = true
    titleLayoutGuide.centerXAnchor.constraint(equalTo: mainLayoutGuide.centerXAnchor).isActive = true
    
    welcomeLabel.text = "Welcome to"
    welcomeLabel.font = UIFont.systemFont(ofSize: 44, weight: .black)
    welcomeLabel.textColor = textColor
    welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(welcomeLabel)
    welcomeLabel.leftAnchor.constraint(equalTo: titleLayoutGuide.leftAnchor).isActive = true
    welcomeLabel.topAnchor.constraint(equalTo: titleLayoutGuide.topAnchor).isActive = true
    
    nameLabel.text = Bundle.main.name!
    nameLabel.font = UIFont.systemFont(ofSize: 44, weight: .black)
    nameLabel.textColor = mainColor
    nameLabel.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(nameLabel)
    nameLabel.leftAnchor.constraint(equalTo: titleLayoutGuide.leftAnchor).isActive = true
    nameLabel.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor).isActive = true
    nameLabel.bottomAnchor.constraint(equalTo: titleLayoutGuide.bottomAnchor).isActive = true
    
    let continueButton = UIButton(frame: .zero)
    continueButton.setTitle("Continue", for: .normal)
    continueButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
    continueButton.setTitleColor(buttonTextColor, for: .normal)
    continueButton.backgroundColor = mainColor
    continueButton.layer.cornerRadius = 10

    view.addSubview(continueButton)
    
    continueButton.translatesAutoresizingMaskIntoConstraints = false
    continueButton.centerXAnchor.constraint(equalTo: mainLayoutGuide.centerXAnchor).isActive = true
    continueButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
    continueButton.widthAnchor.constraint(equalTo: mainLayoutGuide.widthAnchor).isActive = true
    continueButton.bottomAnchor.constraint(equalTo: mainLayoutGuide.bottomAnchor).isActive = true
    continueButton.addTarget(self, action: #selector(dismissAnimated), for: .touchDown)
    
    let detailsLayoutGuide = UILayoutGuide()
    view.addLayoutGuide(detailsLayoutGuide)
    detailsLayoutGuide.widthAnchor.constraint(equalTo: mainLayoutGuide.widthAnchor).isActive = true
    detailsLayoutGuide.centerXAnchor.constraint(equalTo: mainLayoutGuide.centerXAnchor).isActive = true
    detailsLayoutGuide.topAnchor.constraint(equalTo: titleLayoutGuide.bottomAnchor, constant: 60).isActive = true
    detailsLayoutGuide.bottomAnchor.constraint(equalTo: continueButton.topAnchor, constant: -10).isActive = true
    
    var bottomAnchor = detailsLayoutGuide.topAnchor
    var generalHeightAnchor: NSLayoutDimension?
    
    for (image, title, text) in details {
      let detailView = UIView()
      detailView.translatesAutoresizingMaskIntoConstraints = false
      view.addSubview(detailView)
      detailView.topAnchor.constraint(equalTo: bottomAnchor).isActive = true
      if let heightAnchor = generalHeightAnchor {
        detailView.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
      } else {
        generalHeightAnchor = detailView.heightAnchor
      }
      detailView.widthAnchor.constraint(equalTo: detailsLayoutGuide.widthAnchor).isActive = true
      detailView.centerXAnchor.constraint(equalTo: detailsLayoutGuide.centerXAnchor).isActive = true
      
      let spacing = UILayoutGuide()
      view.addLayoutGuide(spacing)
      spacing.widthAnchor.constraint(equalTo: detailsLayoutGuide.widthAnchor).isActive = true
      spacing.centerXAnchor.constraint(equalTo: detailsLayoutGuide.centerXAnchor).isActive = true
      spacing.topAnchor.constraint(equalTo: detailView.bottomAnchor, constant: 60).isActive = true
      let spacingHeight = spacing.heightAnchor.constraint(equalToConstant: 10)
      spacingHeight.isActive = true
      spacingHeight.priority = .defaultLow
      bottomAnchor = spacing.bottomAnchor
      
      let imageView = UIImageView(image: image)
      detailView.addSubview(imageView)
      imageView.translatesAutoresizingMaskIntoConstraints = false
      imageView.leftAnchor.constraint(equalTo: detailView.leftAnchor, constant: 10).isActive = true
      imageView.heightAnchor.constraint(equalToConstant: 60).isActive = true
      imageView.widthAnchor.constraint(equalToConstant: 60).isActive = true
      imageView.centerYAnchor.constraint(equalTo: detailView.centerYAnchor).isActive = true
      imageView.contentMode = .scaleAspectFit
      
      let titleLabel = UILabel(frame: .zero)
      detailView.addSubview(titleLabel)
      titleLabel.translatesAutoresizingMaskIntoConstraints = false
      titleLabel.topAnchor.constraint(equalTo: detailView.topAnchor).isActive = true
      titleLabel.rightAnchor.constraint(equalTo: detailView.rightAnchor).isActive = true
      titleLabel.leftAnchor.constraint(equalTo: imageView.rightAnchor, constant: 10).isActive = true
      titleLabel.text = title
      titleLabel.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
      titleLabel.textColor = textColor
      
      let detailsLabel = UILabel(frame: .zero)
      detailView.addSubview(detailsLabel)
      detailsLabel.translatesAutoresizingMaskIntoConstraints = false
      detailsLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor).isActive = true
      detailsLabel.bottomAnchor.constraint(equalTo: detailView.bottomAnchor).isActive = true
      detailsLabel.rightAnchor.constraint(equalTo: detailView.rightAnchor).isActive = true
      detailsLabel.leftAnchor.constraint(equalTo: imageView.rightAnchor, constant: 10).isActive = true
      detailsLabel.text = text
      detailsLabel.font = UIFont.systemFont(ofSize: 14)
      detailsLabel.textColor = textColor
      detailsLabel.lineBreakMode = .byWordWrapping
      detailsLabel.numberOfLines = 6
    }
    if details.count != 0 {
      bottomAnchor.constraint(lessThanOrEqualTo: detailsLayoutGuide.bottomAnchor).isActive = true;
    }
  }
  
  public func presentIfNotSeen() {
    if !UserDefaults.standard.bool(forKey: "WelomeScreenShown") {
      let topWindow: UIWindow = UIWindow(frame: UIScreen.main.bounds)
      topWindow.rootViewController = UIViewController()
      topWindow.windowLevel = UIWindow.Level.alert + 1
      topWindow.makeKeyAndVisible()
      topWindow.rootViewController?.present(self, animated: true, completion: {
        UserDefaults.standard.set(true, forKey: "WelomeScreenShown")
      })
    }
  }
}
