//
//  ParentViewController.swift
//  CustomTabBar
//
//  Created by William on 29/06/20.
//  Copyright © 2020 william. All rights reserved.
//

import UIKit

class ParentViewController: UIViewController {
  var selectedIndex: TabItemIndex

  init(selectedIndex: TabItemIndex) {
    self.selectedIndex = selectedIndex
    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    switch selectedIndex {
    case .first:
      self.add(FirstViewController(), frame: self.view.bounds)
    case .second:
      self.add(SecondViewController(), frame: self.view.bounds)
    case .third:
      self.add(ThirdViewController(), frame: self.view.bounds)
    case .fourth:
      self.add(FourthViewController(), frame: self.view.bounds)
    }
  }

  public func hideTabBar() {
    let parent = self.parent as! TabBarController
    parent.hideTabBar()
  }
  
  public func showTabBar() {
    let parent = self.parent as! TabBarController
    parent.showTabBar()
  }
}
