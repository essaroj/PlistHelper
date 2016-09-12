//
//  PlistHelper.swift
//
//  Created by Saroj on 2/23/16.
//  Copyright © 2016 Saroj. All rights reserved.
//
import UIKit

public class PlistHelper: NSObject{
    
    var dataFromPlist:[Items] = [Items]()
    var singleDataFromPlist = Items()
    // Get the documents Directory
    func documentsDirectory() -> String {
        let documentsFolderPath = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)[0]
        return documentsFolderPath
    }
    
    // Get path for a file in the directory
    func fileInDocumentsDirectory(filename: String) -> String {
        
        let writePath = (documentsDirectory() as NSString).stringByAppendingPathComponent("Data")
        
        if (!NSFileManager.defaultManager().fileExistsAtPath(writePath)) {
            do {
                try NSFileManager.defaultManager().createDirectoryAtPath(writePath, withIntermediateDirectories: false, attributes: nil) }
            catch let error as NSError {
                print(error.localizedDescription);
            }
        }
        return (writePath as NSString).stringByAppendingPathComponent(filename)
    }
    //Load Data from file in document directory
    func loadData() -> [Items]{
     let path = fileInDocumentsDirectory("RecentLocation")
        print(path)
        if let dict:[Items] = NSKeyedUnarchiver.unarchiveObjectWithFile(path) as? [Items]{
            if dict.isEmpty{
                dataFromPlist = []
            }else{
                for i in 0...dict.count-1{
                    if let value:Items = dict[i]{
                        dataFromPlist.append(value)
                    }
                }
            }
        }
        
        return dataFromPlist
    }
//save data to file in document directory
    func saveData( data: [Items]) -> Bool{
     let path = fileInDocumentsDirectory("RecentLocation")
      let result =  NSKeyedArchiver.archiveRootObject(data, toFile: path)
     
        return result
    }
}
