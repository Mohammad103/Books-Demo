//
//  UIViewControllerExtension.swift
//  BooksDemo
//
//  Created by Mohammad Shaker on 4/7/20.
//  Copyright © 2020 Mohammad Shaker. All rights reserved.
//

import UIKit

var vSpinner : UIView?
 
extension UIViewController {
    func showSpinner(onView : UIView) {
        let spinnerView = UIView.init(frame: onView.bounds)
        spinnerView.backgroundColor = UIColor.greyF6F6F6
        let ai = UIActivityIndicatorView.init(style: UIActivityIndicatorView.Style.large)
        ai.startAnimating()
        ai.center = spinnerView.center
        ai.color = UIColor.defaultAppColor
        
        DispatchQueue.main.async {
            spinnerView.addSubview(ai)
            onView.addSubview(spinnerView)
        }
        
        vSpinner = spinnerView
    }
    
    func removeSpinner() {
        DispatchQueue.main.async {
            vSpinner?.removeFromSuperview()
            vSpinner = nil
        }
    }
}
