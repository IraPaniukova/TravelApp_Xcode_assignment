//
//  SearchButtonsViewController.swift
//  TravelApp_Paniukova
//
//  Created by user196194 on 10/1/23.
//

import UIKit


//function to search a site by its date
func searchSiteByDate (siteDate: Date) -> Site?
{
    var found : Site? = nil
    var s = readSiteData()
    for i in s{
        if FormdDate(date: i.sDate)  == FormdDate(date: siteDate)
        {
            found = i
            break
        }
    }
    return found
}

var selectedDate: Date!  //to use the date in the DateSearchRableViewController

class SearchButtonsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBAction func searchByDateButton(_ sender: UIButton) {
        selectedDate = datePicker.date
        if searchSiteByDate(siteDate: selectedDate) != nil
        {
            performSegue(withIdentifier: "OpenDateSearch", sender: self)
        }
        else {
            showMessage(msg: "You didn't take any photo on this date", controller: self)
        }
        
    }
   
    
}
