//
//  DetailViewController.swift
//  Strings
//
//  Created by Colin Caufield on 2017-01-09.
//  Copyright © 2017 Secret Geometry, Inc. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UIGestureRecognizerDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var stringsView: StringsView!
    @IBOutlet weak var widthConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.pincher = UIPinchGestureRecognizer(target: self, action: #selector(handlePinch))
        self.pincher.delegate = self
        self.scrollView.addGestureRecognizer(self.pincher)
        
        self.configureView()
    }

    var patterns: [Pattern] = [] {
        didSet {
            self.configureView()
        }
    }
    
    func configureView() {
        
        let _ = self.view // Force view hierarchy to load.
        
        self.stringsView.patterns = self.patterns
        
        //self.scrollView.contentSize = CGSize(width: 500, height: 500)
    }
    
    //func viewForZooming(in scrollView: UIScrollView) -> UIView? {
    //    return self.stringsView
    //}
    
    var pincher: UIPinchGestureRecognizer!
    
    var lastPinchScale: CGFloat = 1
    
    @objc func handlePinch(sender: UIPinchGestureRecognizer) {
        
        let pinchScale = sender.scale
        
        switch sender.state {
        
        case .changed:
            
            let newScale = (pinchScale / self.lastPinchScale)
            
            let width = self.widthConstraint.constant
            var newWidth = width * newScale
            
            let MIN_WIDTH: CGFloat = self.view.bounds.width
            let MAX_WIDTH: CGFloat = 5000
            
            newWidth = max(newWidth, MIN_WIDTH)
            newWidth = min(newWidth, MAX_WIDTH)
            
            self.widthConstraint.constant = newWidth
            
            self.lastPinchScale = pinchScale
            
            //print("pinchScale: \(pinchScale)")
            //print("newScale: \(newScale)")
            //print("width: \(newWidth)")
            
        default:
            break
        }
    }
}
