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
    let reuseIdentifier: String = "timelineCell"
    var tempTableArray: [String] = []
    let data = TestData.getTestData()
    
    // Helper varible that tells which TestData object is passed to the detail view
    var indexToPass = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.rowHeight = 143

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // return the number of rows
        return data.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let timelineCell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as? TimelineCell
        
        //Test Setup for TimelineCell
        timelineCell?.title.text = data[indexPath.row].title
        timelineCell?.date.text = data[indexPath.row].date
        timelineCell?.marylandDayImageView.image = photoForIdNumber(Id: data[indexPath.row].photoId)
        timelineCell?.marylandDayImageView.contentMode = .scaleAspectFill
        timelineCell?.marylandDayImageView.layer.masksToBounds = true
        timelineCell?.marylandDayImageView.layer.cornerRadius = 12

        // Add transparant effect
//        cell.imageView?.isOpaque = true
//        cell.imageView?.alpha = 0.7

        return timelineCell! 
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        indexToPass = indexPath.row
        
        performSegue(withIdentifier: "timelineDetailSegue", sender: nil)
    }
    
    // Passes selected TestData to Detail controller
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "timelineDetailSegue" {
            // get a reference to the detail view controller
            let destination = segue.destination as! TimelineDetailViewController
            
            // passes the TestData from the selected cell to the detail view controller
            destination.recievedData = data[indexToPass]
        }
    }
    
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

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
