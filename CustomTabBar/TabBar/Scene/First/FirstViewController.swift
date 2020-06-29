//
//  FirstViewController.swift
//  CustomTabBar
//
//  Created by William on 29/06/20.
//  Copyright © 2020 william. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
  var data = [String]()

  @IBOutlet weak var tableView: UITableView!
  @IBOutlet weak var tableBottomConstraint: NSLayoutConstraint!

  private var lastContentOffset: CGFloat = 0
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)

    self.navigationController?.setNavigationBarHidden(true, animated: animated)
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    
    let alphabet = String((0..<26).map({Character(UnicodeScalar("a".unicodeScalars.first!.value + $0)!)}))
    data.append(alphabet)

    tableView.estimatedRowHeight = 80
    tableView.register(UINib(nibName: ItemCell.reuseIdentifier(), bundle: nil), forCellReuseIdentifier: ItemCell.reuseIdentifier())
  }
}

extension FirstViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 20
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: ItemCell.reuseIdentifier(), for: indexPath) as! ItemCell
    cell.titleLabel.text = "SHOW DATA \(indexPath.row + 1)"
    return cell
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return UITableView.automaticDimension
  }

  func scrollViewDidScroll(_ scrollView: UIScrollView) {
    let translation = scrollView.panGestureRecognizer.translation(in: scrollView.superview)

    // Keep offset
    if translation.y == lastContentOffset { return }

    if translation.y > 0 {
      // Scroll down
      UIView.animate(withDuration: 0.3, delay: 0, options: .curveLinear, animations: {
        let parent = self.parent as! ParentViewController
        parent.showTabBar()
      }, completion: nil)
    } else {
      // Scroll up
      UIView.animate(withDuration: 0.3, delay: 0, options: .curveLinear, animations: {
        let parent = self.parent as! ParentViewController
        parent.hideTabBar()
      }, completion: nil)
    }
    
    lastContentOffset = translation.y
  }
}
