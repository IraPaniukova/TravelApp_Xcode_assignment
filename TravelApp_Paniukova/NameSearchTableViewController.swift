//
//  NameSearchTableViewController.swift
//  TravelApp_Paniukova
//
//  Created by Ira Paniukova on 9/27/23.
//

import UIKit



class NameSearchTableViewController: UITableViewController {
    var siteList : [Site]!

    override func viewDidLoad() {
        super.viewDidLoad()

        siteList = readSiteData()
        
    }


    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    //Count number of raws to display:
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return siteList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NameSearchCells", for: indexPath) as! NameSearchTableViewCell
        cell.nameLabel.text = (siteList[indexPath.row].sName)
        cell.adrsLabel.text = (siteList[indexPath.row].sAdrs)
        cell.dscrptnLabel.text = (siteList[indexPath.row].sDscrptn)
        cell.imgView.image = (siteList[indexPath.row].sImg)
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            s = siteList[indexPath.row]
            performSegue(withIdentifier: "SearchByName", sender: self)
            
        }

}
