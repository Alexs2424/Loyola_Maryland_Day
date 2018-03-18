//
//  TimelineDetailViewController.swift
//  Loyola Maryland Day
//
//  Created by Grant Versfeld on 1/21/18.
//  Copyright © 2018 iInnovate LLC. All rights reserved.
//

import UIKit

class TimelineDetailViewController: UIViewController, UIWebViewDelegate {
    
    var recievedData: MDay?

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UITextView!
    @IBOutlet weak var vimeoView: UIWebView!
    
    @IBOutlet weak var activity: UIActivityIndicatorView!
    
    var is1952_2 = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.vimeoView.delegate = self
        self.activity.hidesWhenStopped = true
        
        if #available(iOS 11.0, *) {
            self.navigationController?.navigationBar.prefersLargeTitles = true
        }
        
        //Setting the UINavigation bar tint
        self.navigationController?.navigationBar.tintColor = UIColor(red: 0.0, green: 0.35, blue: 0.29, alpha: 1.0)
        
        self.title = "\(recievedData!.year)"
        
        self.titleLabel.text = recievedData?.title
        
        self.descriptionLabel.text = recievedData?.description
        
        //self.description =
        //provide random photo id
        if let year = recievedData?.year {
            imageView.image = self.photoForYear(year: "\(year)")
        } else {
            imageView.image = UIImage(named: "Test Picture 1")!
        }
        
        self.webViewForVideo(path: (recievedData?.videoPath)!)
        
        
        self.titleLabel.minimumScaleFactor = 0.5
        self.titleLabel.adjustsFontSizeToFitWidth = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func photoForYear(year: String) -> UIImage {
        if year != "1952" {
            return UIImage(named: year)!
        } else {
            if self.is1952_2 == false {
                self.is1952_2 = true
                return UIImage(named: year)!
            } else if self.is1952_2 == true {
                self.is1952_2 = false
                let newImagePath = "\(year)_2"
                return UIImage(named: newImagePath)!
            }
        }
        return UIImage(named: "Test Picture 1")!
    }
    
    func webViewForVideo(path: String) {
        if path != "" {
            //do not hide webview
            self.vimeoView.isHidden = false
            let url = URL(string: "\(path)")
            let request = URLRequest(url: url!)
            self.vimeoView.loadRequest(request)
            self.imageView.isHidden = true
            self.activity.isHidden = false
            self.activity.startAnimating()
        } else {
            //hide webview
            self.vimeoView.isHidden = true
            self.activity.isHidden = true
            self.activity.stopAnimating()
        }
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        self.activity.stopAnimating()
    }
}
