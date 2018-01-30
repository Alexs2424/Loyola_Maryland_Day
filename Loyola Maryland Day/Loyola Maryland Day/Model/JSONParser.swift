//
//  JSONParser.swift
//  Loyola Maryland Day
//
//  Created by Alex Santarelli on 1/29/18.
//  Copyright © 2018 iInnovate LLC. All rights reserved.
//

import Foundation

struct JSONParser {
    
    let requestURL = "http://hjfranceschi.cs.loyola.edu/videos/getVideos.php"
    
    func getResponse() {
        
        
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
                            
                            print("Event Name: \(mDayEvent!.title)")
                        }
                    }
                } catch {
                    print("Error with JSON: \(error)")
                }
            }
        })
        task.resume()
    }
}
