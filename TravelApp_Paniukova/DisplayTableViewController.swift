//
//  DisplayTableViewController.swift
//  TravelApp_Paniukova
//
//  Created by Ira Paniukova on 9/27/23.
//

import UIKit

var s : Site!



class DisplayTableViewController: UITableViewController {
    
    var siteList : [Site]!
    override func viewDidLoad() {
            
        super.viewDidLoad()

        siteList = readSiteData()
    }

   //Count number of raws to display:

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return siteList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AllCells", for: indexPath) as! DisplayTableViewCell
       
        var siteDate = (siteList[indexPath.row].sDate)
        cell.DateLabel.text = "The photo was taken on " +  FormdDate( date: siteDate)
        //the function to formate date FormdDate is made inn NameSearchViewController and reused here
        
        cell.NameLabel.text = (siteList[indexPath.row].sName)
        cell.AdrsLabel.text = (siteList[indexPath.row].sAdrs)
        cell.DcrptnLabel.text = (siteList[indexPath.row].sDscrptn)
        cell.ImgView.image = (siteList[indexPath.row].sImg)
        return cell
    }
 /*
     //I might need this code if I decide to see details of each record, but I do not plan to use it according to our assigment part 1, so it os greyed out for the moment
     override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            s = siteList[indexPath.row]
            performSegue(withIdentifier: "SegueName", sender: self)
        }
*/

}
