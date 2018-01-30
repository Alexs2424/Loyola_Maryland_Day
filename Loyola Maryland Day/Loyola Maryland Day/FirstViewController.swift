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

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //TESTING JSON LOADING
        let jsonParser = JSONParser()
        
        jsonParser.getResponse()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

