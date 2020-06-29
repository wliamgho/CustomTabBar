//
//  TabBarController.swift
//  CustomTabBar
//
//  Created by William on 29/06/20.
//  Copyright © 2020 william. All rights reserved.
//

import UIKit

enum TabItemIndex: Int {
  case first
  case second
  case third
  case fourth
}

class TabBarController: UITabBarController {
  private var firstVC: ParentViewController!
  private var secondVC: ParentViewController!
  private var thirdVC: ParentViewController!
  private var fourthVC: ParentViewController!

  private var defaultYPosition: CGFloat = 0
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.navigationController?.setNavigationBarHidden(true, animated: true)

    firstVC = ParentViewController(selectedIndex: .first)
    secondVC = ParentViewController(selectedIndex: .second)
    thirdVC = ParentViewController(selectedIndex: .third)
    fourthVC = ParentViewController(selectedIndex: .fourth)

    firstVC.tabBarItem = configureTabItem(index: .first)
    secondVC.tabBarItem = configureTabItem(index: .second)
    thirdVC.tabBarItem = configureTabItem(index: .third)
    fourthVC.tabBarItem = configureTabItem(index: .fourth)
    
    setViewControllers([firstVC, secondVC, thirdVC, fourthVC], animated: true)

    // Remove top line
    tabBar.shadowImage = UIImage()
    tabBar.backgroundImage = UIImage()

    // Create corner layer
    let layer = CAShapeLayer()
    layer.path = UIBezierPath(roundedRect: CGRect(x: 56,
                                                  y: 0,
                                                  width: self.tabBar.bounds.width - 120,
                                                  height: self.tabBar.bounds.height),
                              cornerRadius: (self.tabBar.frame.width/2)).cgPath
    layer.shadowColor = UIColor.black.cgColor
    layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
    layer.shadowRadius = 25.0
    layer.shadowOpacity = 0.3
    layer.borderWidth = 1.0
    layer.opacity = 1.0
    layer.isHidden = false
    layer.masksToBounds = false
    layer.fillColor = UIColor.white.cgColor

    self.tabBar.layer.insertSublayer(layer, at: 0)

    // Add tab item inset
    if let items = self.tabBar.items {
      items.forEach { item in item.imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: -10, right: 0) }
    }

    self.tabBar.itemWidth = 30.0
    self.tabBar.itemPositioning = .centered
    self.tabBar.tintColor = .black
  }

  override func viewWillLayoutSubviews() {
    super.viewWillLayoutSubviews()

    tabBar.frame.origin.y = view.frame.height - 80
    defaultYPosition = view.frame.height - 80
  }

  private func configureTabItem(index: TabItemIndex) -> UITabBarItem {
    let item = UITabBarItem(title: nil, image: UIImage(named: "ic_home"), tag: index.rawValue)
    return item
  }
  
  public func showTabBar() {
    UIView.animate(withDuration: 0.3, delay: 0, options: .curveLinear, animations: {
      self.tabBar.frame.origin.y = self.defaultYPosition
    }, completion: nil)
  }
  
  public func hideTabBar() {
    UIView.animate(withDuration: 0.3, delay: 0, options: .curveLinear, animations: {
      self.tabBar.frame.origin.y = self.defaultYPosition + 100
    }, completion: nil)
  }
}
