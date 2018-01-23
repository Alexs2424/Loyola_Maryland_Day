//
//  TestData.swift
//  Loyola Maryland Day
//
//  Created by Alex Santarelli on 1/23/18.
//  Copyright © 2018 iInnovate LLC. All rights reserved.
//

import Foundation

class TestData {
    //this is being used to fill the table with fake data
    var title:String
    var date:String
    var photoId:Int //temporary
    //TO-DO:
    //add description,
    //anything other detail elements
    
    init(title:String, date:String, photoId: Int) {
        self.title = title
        self.date = date
        self.photoId = photoId
    }
    
    
    static func getTestData() -> [TestData] {
        var data:[TestData] = []
        
        let data1 = TestData(title: "Jesuits In Maryland", date: "1839", photoId: 2)
        data.append(data1)
        let data2 = TestData(title: "Jesuits At Loyola", date: "1900", photoId: 1)
        data.append(data2)
        let data3 = TestData(title: "Maryland Day Started", date: "1956", photoId: 3)
        data.append(data3)
        let data4 = TestData(title: "Tradition Started", date: "1980", photoId: 2)
        data.append(data4)
        let data5 = TestData(title: "Continuing Today", date: "2018", photoId: 3)
        data.append(data5)
        
        return data
    }
}
