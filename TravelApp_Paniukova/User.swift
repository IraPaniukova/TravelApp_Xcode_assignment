//
//  User.swift
//  TravelApp_Paniukova
//
//  Created by Ira Paniukova on 13/09/23.
//

import Foundation
class User: NSObject, NSCoding // NSObject, NSCoding compressing and decompressing data

{
    
    func encode(with coder: NSCoder) {
        coder.encode(name, forKey: "Name")
        coder.encode(adrs, forKey: "Adrs")
        coder.encode(email, forKey: "Email")
        coder.encode(phone, forKey: "Phone")
        coder.encode(uname, forKey: "Uname")
        coder.encode(pswd, forKey: "Pswd")
    }
    
    required init?(coder: NSCoder){
        self.name = coder.decodeObject(forKey: "Name") as! String
        self.adrs = coder.decodeObject(forKey: "Adrs") as! String
        self.email = coder.decodeObject(forKey: "Email") as! String
        self.phone = coder.decodeObject(forKey: "Phone") as! String
        self.uname = coder.decodeObject(forKey: "Uname") as! String
        self.pswd = coder.decodeObject(forKey: "Pswd") as! String
    }
    
    
    
    var name : String
    var adrs : String
    var email : String
    var phone : String
    private var uname : String
    private var pswd : String
    
    //Creating a constructor:
    init(name : String, adrs : String, email : String, phone : String, uname : String, pswd : String) {
        self.name = name
        self.adrs = adrs
        self.email = email
        self.phone = phone
        self.uname = uname
        self.pswd = pswd
    }
    //Get for private variables:
    func getUname() -> String { return uname }
    func getPswd() -> String { return pswd }
}
