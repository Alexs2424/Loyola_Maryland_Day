//
//  TimelineTableViewController.swift
//  Loyola Maryland Day
//
//  Created by Grant Versfeld on 1/21/18.
//  Copyright © 2018 iInnovate LLC. All rights reserved.
//

import UIKit

class TimelineTableViewController: UITableViewController {
    
    //MARK: - Properties
    let requestURL = "http://hjfranceschi.cs.loyola.edu/videos/getVideos.php"
    //NEW URL https://jesuitmobileapp.loyola.edu/controller/getReleasedVideos.php
    //OLD URL "http://hjfranceschi.cs.loyola.edu/videos/getVideos.php"
    let reuseIdentifier: String = "timelineCell"
    var tempTableArray: [String] = []
    let data = TestData.getTestData()
    
    var mDayData = [MDay] ()
    
    // Helper varible that tells which TestData object is passed to the detail view
    var indexToPass = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if #available(iOS 11.0, *) {
            self.navigationController?.navigationBar.prefersLargeTitles = true
        }
        
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.rowHeight = 143

        getJSONData()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Passes selected TestData to Detail controller
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "timelineDetailSegue" {
            // get a reference to the detail view controller
            let destination = segue.destination as! TimelineDetailViewController
            
            // passes the TestData from the selected cell to the detail view controller
            //destination.recievedData = data[indexToPass] testdata
            destination.recievedData = mDayData[indexToPass]
        }
    }
    
    //Quick for testing for different default photos
    func photoForIdNumber(Id: Int) -> UIImage {
        switch Id {
        case 1:
            return UIImage(named: "Test Picture 1")!
        case 2:
            return UIImage(named: "Test Picture 2")!
        case 3:
            return UIImage(named: "Test Picture 3")!
        default:
            return UIImage(named: "Test Picture 1")!
        }
    }

    /* JSON PARSE FUNCTION */
    func getJSONData() {
        let requestURL: URL = URL(string: self.requestURL)!
        let urlRequest: URLRequest = URLRequest(url: requestURL)
        let session = URLSession.shared
        
        let task = session.dataTask(with: urlRequest, completionHandler: {
            (data, response, error) -> Void in
            
            let httpResponse = response as! HTTPURLResponse
            let statusCode = httpResponse.statusCode
            
            if (statusCode == 200) {
                print("Everyone is fine, file downloaded successfully.")
                
                do {
                    let jsonResponse: NSArray = (try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments) as? NSArray)!
                    
                    print("Response: \(jsonResponse)")
                    var count = 0
                    for obj in jsonResponse {
                        
                        print("Object at Index \(count) --- \(obj)")
                        count += 1
                        
                        if let objDetails = obj as? [String : AnyObject] {
                            
                            let mDayEvent = MDay(json: objDetails)
                            self.mDayData.append(mDayEvent!)
                            
                        }
                    }
                    
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                    
                } catch {
                    print("Error with JSON: \(error)")
                }
            }
        })
        task.resume()
    }
    
    /* END JSON PARSE */
}
    
    /* EXTENDING TIMELINE TABLE VIEW */
    //This always goes at the bottom of the file
    //and allows the dynamically load the tableview
    
    extension TimelineTableViewController {
        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let timelineCell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as? TimelineCell
            
            //Test Setup for TimelineCell Test data
//            timelineCell?.title.text = data[indexPath.row].title
//            timelineCell?.date.text = data[indexPath.row].date
//            timelineCell?.marylandDayImageView.image = photoForIdNumber(Id: data[indexPath.row].photoId)
//            timelineCell?.marylandDayImageView.contentMode = .scaleAspectFill
//            timelineCell?.marylandDayImageView.layer.masksToBounds = true
//            timelineCell?.marylandDayImageView.layer.cornerRadius = 12
            
            
            //JSON DATA
            timelineCell?.title.text = mDayData[indexPath.row].title
            timelineCell?.date.text = "\(mDayData[indexPath.row].year)"
            timelineCell?.marylandDayImageView.image = photoForIdNumber(Id: mDayData[indexPath.row].photoId)
            timelineCell?.marylandDayImageView.contentMode = .scaleAspectFill
            timelineCell?.marylandDayImageView.layer.masksToBounds = true
            timelineCell?.marylandDayImageView.layer.cornerRadius = 12
            
            
            //Applying shadow so everything appears readable
            timelineCell?.title.textColor = UIColor.white
            timelineCell?.title.layer.shadowColor = UIColor.black.cgColor
            timelineCell?.title.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
            timelineCell?.title.layer.shadowRadius = 2.5 //5.0 was pretty good
            timelineCell?.title.layer.shadowOpacity = 0.9
            timelineCell?.title.layer.masksToBounds = false
            timelineCell?.title.layer.shouldRasterize = true

            
            return timelineCell!
        }
        
        // MARK: - Table view data source
        
        override func numberOfSections(in tableView: UITableView) -> Int {
            // return the number of sections
            return 1
        }
        
        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            // return the number of rows
            return mDayData.count
        }
        
        override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            tableView.deselectRow(at: indexPath, animated: true)
            
            indexToPass = indexPath.row
            
            performSegue(withIdentifier: "timelineDetailSegue", sender: nil)
        }
        
}



