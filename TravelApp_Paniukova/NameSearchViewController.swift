//
//  NameSearchViewController.swift
//  TravelApp_Paniukova
//
//  Created by Ira Paniukova on 9/30/23.
//

import UIKit

func  FormdDate( date: Date) -> String
{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        var formateddate = dateFormatter.string(from: date)
    
    return formateddate
}



class NameSearchViewController: UIViewController {
    
    

    func SucsesfulRslt(findSite: Site?, Adrs: String,Dscrptn: String, Name: String, aDate: Date, img: UIImage)
    {
        
            adrsLabel.isHidden = false
            dscrptnLabel.isHidden = false
            dateLabel.isHidden = false
            nameLabel.isHidden = false
            adrsLabel.text = Adrs
            dscrptnLabel.text = Dscrptn
            nameLabel.text = Name
            var date = FormdDate( date: aDate)
            
            dateLabel.text = "The photo was taken on " +  date
            imgLabel.image = img
            nameTextField.text = ""
            adrsTextField.text = ""
            dscrptnTextField.text = ""
            
        
    }


    override func viewDidLoad() {
        adrsLabel.isHidden = true
        dscrptnLabel.isHidden = true
        dateLabel.isHidden = true
        nameLabel.isHidden = true
        self.nameTextField.layer.borderColor = UIColor.systemTeal.cgColor
        self.nameTextField.layer.borderWidth = 1
        self.adrsTextField.layer.borderColor = UIColor.systemTeal.cgColor
        self.adrsTextField.layer.borderWidth = 1
        self.dscrptnTextField.layer.borderColor = UIColor.systemTeal.cgColor
        self.dscrptnTextField.layer.borderWidth = 1
        super.viewDidLoad()}
 
    
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var adrsTextField: UITextField!
    
    @IBOutlet weak var dscrptnTextField: UITextField!
    
    
    @IBAction func nameSearchButton(_ sender: UIButton) {
        if nameTextField.hasText{
            let name = nameTextField.text!
            var fSite = searchSiteByName(name: name)  //the function dearchSiteByName is made in AddSitesControllerView and reused here
            if fSite != nil{
                SucsesfulRslt(findSite: fSite, Adrs: fSite!.sAdrs, Dscrptn: fSite!.sDscrptn, Name: fSite!.sName, aDate: fSite!.sDate, img: fSite!.sImg)
            }
            else{showMessage(msg: "There is no site with such name", controller: self)}
        }
        else{showMessage(msg: "Enter the site name you are searching for", controller: self)}
    }
    
    
    @IBAction func adrsSearchButton(_ sender: UIButton) {
        if adrsTextField.hasText{
            let adrs = adrsTextField.text!
            var fSite = searchSiteByAdrs(address: adrs)  //the function dearchSiteByNameAdrs is made in AddSitesControllerView and reused here
            if fSite != nil{
            SucsesfulRslt(findSite: fSite, Adrs: fSite!.sAdrs, Dscrptn: fSite!.sDscrptn, Name: fSite!.sName, aDate: fSite!.sDate, img: fSite!.sImg)
                
            }
        
        else{showMessage(msg: "There is no site with such address", controller: self)}
    }
    else{showMessage(msg: "Enter the address you are searching for", controller: self)}
    }
    
    
    @IBAction func dscrptnSearchButton(_ sender: UIButton) {
        if dscrptnTextField.hasText{
            let dscr = dscrptnTextField.text!
            var fSite = searchSiteByDscrptn(description: dscr)  //the function dearchSiteByDscrptn is made in AddSitesControllerView and reused here
            if fSite != nil{
                SucsesfulRslt(findSite: fSite, Adrs: fSite!.sAdrs, Dscrptn: fSite!.sDscrptn, Name: fSite!.sName, aDate: fSite!.sDate, img: fSite!.sImg)
            }
            else{showMessage(msg: "There is no site with such description", controller: self)}
        }
       
        else {showMessage(msg: "Enter the description you are searching for", controller: self)}
    }
    
    
   
    
    
    
    @IBOutlet weak var imgLabel: UIImageView!
    
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var adrsLabel: UILabel!
    
    @IBOutlet weak var dscrptnLabel: UILabel!
    
    
    @IBOutlet weak var nameLabel: UILabel!
    
}
