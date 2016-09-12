 
//  GoogleItems.swift
//  GrabTaxi
//
//  Created by Saroj on 5/25/15.
//  Copyright (c) 2015 Saroj. All rights reserved.
//

import UIKit

class Items: NSObject{

    var name:String?
    var address:String?
    var distance : String?
    var Location: CLLocation?
    
    
    override init(){}
    
    required init(coder aDecoder: NSCoder) {
        self.name = aDecoder.decodeObjectForKey("name") as? String
        self.address = aDecoder.decodeObjectForKey("address") as? String
        self.distance = aDecoder.decodeObjectForKey("distance") as? String
        self.Location = aDecoder.decodeObjectForKey("Location") as? CLLocation
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        if name != nil{  aCoder.encodeObject(name, forKey: "name")}
        if address != nil{ aCoder.encodeObject(address, forKey: "address")}
        if distance != nil { aCoder.encodeObject(distance, forKey: "distance")}
        if Location != nil { aCoder.encodeObject(Location, forKey: "Location")}
    }
}


