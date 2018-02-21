//
//  MDayEvent.swift
//  Loyola Maryland Day
//
//  Created by Alex Santarelli on 1/29/18.
//  Copyright © 2018 iInnovate LLC. All rights reserved.
//

import Foundation

struct MDay {
    let title:String
    let description:String
    let year: Int
    let picPath:String
    let videoPath:String
    let photoId:Int
}

extension MDay {
    init?(json: [String : Any]) {
        guard let title = json["title"] as? String,
        let description = json["description"] as? String,
        let year = json["year"] as? Int,
        let picPath = json["picture"] as? String,
        let videoPath = json["video"] as? String
        else {
            return nil
        }
        self.title = title
        self.description = description
        self.year = year
        self.picPath = picPath
        self.videoPath = videoPath
        let photoNum = arc4random_uniform(2)
        self.photoId = Int(photoNum) + 1
        print("Photo ID: \(self.photoId)")
    }
}
