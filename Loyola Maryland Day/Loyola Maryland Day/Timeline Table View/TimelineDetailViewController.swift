//
//  TimelineDetailViewController.swift
//  Loyola Maryland Day
//
//  Created by Grant Versfeld on 1/21/18.
//  Copyright © 2018 iInnovate LLC. All rights reserved.
//

import UIKit

class TimelineDetailViewController: UIViewController {
    
    var recievedData: MDay?

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UITextView!
    
    var is1952_2 = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
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
}
