//
//  FirstViewController.swift
//  Loyola Maryland Day
//
//  Created by Alex on 1/17/18.
//  Copyright © 2018 iInnovate LLC. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    //This is a test view controller until we know what we are getting from
    //the design team
    @IBOutlet weak var videoExample: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.videoExample.contentMode = .scaleAspectFill
        self.videoExample.layer.masksToBounds = true
        
        if #available(iOS 11.0, *) {
            self.navigationController?.navigationBar.prefersLargeTitles = true
        }
        
//        navigationController?.navigationBar.barTintColor = UIColor(red: 34/255.0, green: 85/255.0, blue: 75/255.0, alpha: 1.0)
//        navigationController?.navigationBar.titleTextAttributes = [UITextAttributeTextColor: UIColor.white]
//        UINavigationBar.appearance().titleTextAttributes = [UITextAttributeTextColor: UIColor.blueColor()]
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

