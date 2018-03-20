//
//  FirstViewController.swift
//  Loyola Maryland Day
//
//  Created by Alex on 1/17/18.
//  Copyright © 2018 iInnovate LLC. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UIWebViewDelegate {
    
    //This is a test view controller until we know what we are getting from
    //the design team
    @IBOutlet weak var videoView: UIWebView!
    @IBOutlet weak var activity: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if #available(iOS 11.0, *) {
            self.navigationController?.navigationBar.prefersLargeTitles = true
        }
        
        self.videoView.delegate = self
        self.webViewForVideo(path: "https://vimeo.com/122659929")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func webViewForVideo(path: String) {
        //do not hide webview
        let url = URL(string: "\(path)")
        let request = URLRequest(url: url!)
        self.videoView.loadRequest(request)
        self.activity.isHidden = false
        self.activity.hidesWhenStopped = true
        self.activity.startAnimating()
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        self.activity.stopAnimating()
    }
}

