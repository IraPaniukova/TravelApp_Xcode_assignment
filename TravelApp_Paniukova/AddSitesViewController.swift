//
//  AddSitesViewController.swift
//  TravelApp_Paniukova
//
//  Created by user196194 on 9/18/23.
//


import UIKit

//function to read data for sites:
func readSiteData() -> [Site]
{
    if UserDefaults.standard.data(forKey: "Sites") == nil
    {
        return[Site]()
    }
    else{
        let sdata = UserDefaults.standard.data(forKey: "Sites") as! Data
        let Sites = try! NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(sdata) as! [Site]
        return Sites
    }
}

//function to search a site by its name
func searchSiteByName (name: String) -> Site?
{
    var found : Site? = nil
    var s = readSiteData()
    for i in s{
        if i.sName.lowercased() == name.lowercased()
        {
            found = i
            break
        }
    }
    return found
}
//function to search a site by its address
func searchSiteByAdrs (address: String) -> Site?
{
    var found : Site? = nil
    var s = readSiteData()
    for i in s{
        if i.sAdrs.lowercased() == address.lowercased()
        {
            found = i
            break
        }
    }
    return found
}
//function to search a site by its description
func searchSiteByDscrptn(description: String) -> Site?
{
    var found : Site? = nil
    var s = readSiteData()
    for i in s{
        if i.sDscrptn.lowercased() == description.lowercased()
        {
            found = i
            break
        }
    }
    return found
}





class AddSitesViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    @IBOutlet weak var imgView: UIImageView!
    

    @IBAction func photoButton(_ sender: UIButton) {
        let addPic = UIImagePickerController()
        addPic.sourceType = .photoLibrary
        //FOR THE sourceType IT ACTUALLY MUST BE .camera. But the simulator  has no camera, so I chose the photoLibrary to show that the app works
        addPic.allowsEditing = false
        addPic.delegate = self
        present(addPic, animated: true,completion: nil)
    }
    func  imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[.originalImage] as! UIImage
        imgView.image = image
        dismiss(animated: true, completion: nil)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBOutlet weak var siteNameTextFiel: UITextField!
    @IBOutlet weak var siteAdrsTextFiel: UITextField!
    @IBOutlet weak var siteDscrptnTextFiel: UITextField!
    
    @IBAction func saveButton(_ sender: UIButton) {
        
        if siteNameTextFiel.hasText && siteAdrsTextFiel.hasText && siteDscrptnTextFiel.hasText && imgView.image != nil
        {
            
            self.siteNameTextFiel.layer.borderWidth = 0
            self.siteAdrsTextFiel.layer.borderWidth = 0
            self.siteDscrptnTextFiel.layer.borderWidth = 0
            let name = siteNameTextFiel.text!
            let adr = siteAdrsTextFiel.text!
            let dscrptn = siteDscrptnTextFiel.text!
            var checkName = searchSiteByName(name: name.lowercased())
            var checkAdrs = searchSiteByAdrs(address: adr.lowercased())
            var checkDscrptn = searchSiteByDscrptn(description: dscrptn.lowercased())
            if checkName != nil
            {
                
                showMessage(msg: "Such name for a site already exists.", controller: self)
                self.siteNameTextFiel.layer.borderColor = UIColor.red.cgColor
                self.siteNameTextFiel.layer.borderWidth = 1
            }
            else if checkAdrs != nil
                {
                    
                    showMessage(msg: "Such address for a site already exists.", controller: self)
                    self.siteAdrsTextFiel.layer.borderColor = UIColor.red.cgColor
                    self.siteAdrsTextFiel.layer.borderWidth = 1
                }
            else if checkDscrptn != nil
                {
                    
                    showMessage(msg: "Such description for a site already exists.", controller: self)
                    self.siteDscrptnTextFiel.layer.borderColor = UIColor.red.cgColor
                    self.siteDscrptnTextFiel.layer.borderWidth = 1
                }
            
            else {
                let adrs = siteAdrsTextFiel.text!
                let dscrptn = siteDscrptnTextFiel.text!
                let date = Date()
                var s = Site(sImg: imgView.image!, sName: name, sAdrs: adrs, sDscrptn: dscrptn, sDate: date)
                var sites = readSiteData()
                sites.append(s)
                let sdata = try! NSKeyedArchiver.archivedData(withRootObject: sites, requiringSecureCoding: false)
                UserDefaults.standard.setValue(sdata, forKey: "Sites")
                
                showMessage(msg: "The site " + name.uppercased() + " is saved", controller: self)
                siteNameTextFiel.text = ""
                siteAdrsTextFiel.text = ""
                siteDscrptnTextFiel.text = ""
                imgView.image = nil
                      }
        }
        
        else {showMessage(msg: "Some fields are empty", controller: self)}
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

}
