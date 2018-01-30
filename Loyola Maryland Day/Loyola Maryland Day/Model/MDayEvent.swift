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
    let year: Int
    let picPath:String
    let videoPath:String
    let photoId:Int
}

extension MDay {
    init?(json: [String : Any]) {
        guard let title = json["title"] as? String,
        let year = json["year"] as? Int,
        let picPath = json["picture"] as? String,
        let videoPath = json["video"] as? String
        else {
            return nil
        }
        self.title = title
        self.year = year
        self.picPath = picPath
        self.videoPath = videoPath
        self.photoId = Int(arc4random_uniform(2) + 1)
    }
}
