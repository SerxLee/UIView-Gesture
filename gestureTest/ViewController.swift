//
//  ViewController.swift
//  gestureTest
//
//  Created by Serx on 16/5/9.
//  Copyright © 2016年 Serx.Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
    
        super.viewDidLoad()
        
        let gestureView = UIView()
        gestureView.frame = CGRectMake(100, 100, 100, 100)
        gestureView.backgroundColor = UIColor.blueColor()
        
        gestureView.setTapActionWithBlock { 
            NSLog("set tap gesture successfully")
        }
        self.view.addSubview(gestureView)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
}

