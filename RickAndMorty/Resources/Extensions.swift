//
//  Extensions.swift
//  RickAndMorty
//
//  Created by Sean Lee on 6/9/24.
//

import UIKit


extension UIView {
  func addSubviews(_ views: UIView...) {
    views.forEach {
      addSubview($0)
    }
  }
}
