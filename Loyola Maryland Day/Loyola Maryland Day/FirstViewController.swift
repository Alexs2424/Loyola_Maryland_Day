//
//  FirstViewController.swift
//  Loyola Maryland Day
//
//  Created by Alex on 1/17/18.
//  Copyright © 2018 iInnovate LLC. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.title = "History"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewDidAppear(_ animated: Bool) {
        // Disable navbar's hideOnSwipe and show it if hidden
        navigationController?.hidesBarsOnSwipe = false
        self.navigationController?.navigationBar.isHidden = false
    }
}

