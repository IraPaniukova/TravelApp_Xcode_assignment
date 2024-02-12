//
//  Site.swift
//  TravelApp_Paniukova
//
//  Created by user196194 on 9/20/23.
//

import Foundation
import UIKit

class Site: NSObject, NSCoding // NSObject, NSCoding compressing and decompressing data
{
    func encode(with coder: NSCoder) {
        coder.encode(sImg, forKey: "SImg")
        coder.encode(sName, forKey: "SName")
        coder.encode(sAdrs, forKey: "SAdrs")
        coder.encode(sDscrptn, forKey: "SDscrptn")
        coder.encode(sDate, forKey: "SDate")
        
    }
    
    required init?(coder: NSCoder){
        self.sImg = coder.decodeObject(forKey: "SImg") as! UIImage
        self.sName = coder.decodeObject(forKey: "SName") as! String
        self.sAdrs = coder.decodeObject(forKey: "SAdrs") as! String
        self.sDscrptn = coder.decodeObject(forKey: "SDscrptn") as! String
        self.sDate = coder.decodeObject(forKey: "SDate") as! Date
    }
    

    var sImg : UIImage
    var sName : String
    var sAdrs : String
    var sDscrptn : String
    var sDate : Date
    
    //Creating a constructor:
    init(sImg : UIImage, sName : String, sAdrs : String, sDscrptn : String, sDate : Date) {
        self.sImg = sImg
        self.sName = sName
        self.sAdrs = sAdrs
        self.sDscrptn = sDscrptn
        self.sDate = sDate
    }
}


