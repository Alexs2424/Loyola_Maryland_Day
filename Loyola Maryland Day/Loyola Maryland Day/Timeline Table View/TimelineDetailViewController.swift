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
        
        //self.description =
        //provide random photo id
        imageView.image = TimelineTableViewController().photoForIdNumber(Id: (recievedData?.photoId)!)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
