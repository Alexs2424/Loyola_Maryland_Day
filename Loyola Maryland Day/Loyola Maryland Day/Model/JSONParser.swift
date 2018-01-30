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
                    
                    for obj in jsonResponse {
                        
                    }
                } catch {
                    print("Error with JSON: \(error)")
                }
                
//                do {
//
//                    let json = try JSONSerialization.jsonObject(with: data!, options:.allowFragments) as? [String : String]
//
//                    print("JSON Data\n \(String(describing: json))")
//
//
//                    if let results = json {//as? [String : AnyObject] { //was json["results"]
//                        print("RESULTS: \n\n\(results)")
//                    }
//
//                } catch {
//                    print("Error with Json: \(error)")
//                }
            }
        })
        task.resume()
    }
}
