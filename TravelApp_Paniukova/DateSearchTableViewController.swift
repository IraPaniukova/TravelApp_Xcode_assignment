//
//  DateSearchTableViewController.swift
//  TravelApp_Paniukova
//
//  Created by user196194 on 10/1/23.
//

import UIKit

var MyList: [Site]!

//function to search all sites by its date
func searchAllSitesByDate (siteDate: Date) -> [Site]?
{
    var selectedSitesList : [Site]!
    selectedSitesList = []
    var s = readSiteData()
    for i in s{
        if FormdDate(date: i.sDate)  == FormdDate(date: siteDate)
        {
            selectedSitesList.append(i)}

    }
    return selectedSitesList
}

class DateSearchTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        MyList = searchAllSitesByDate(siteDate: selectedDate)
       
    }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return MyList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DateSearchCells", for: indexPath) as! DateSearchTableViewCell
       
        var siteDate = (MyList[indexPath.row].sDate)
        cell.dateLabel.text = "The photo was taken on " +  FormdDate( date: siteDate)
        //the function to formate date FormdDate is made inn NameSearchViewController and reused here

        
        cell.nameLabel.text = (MyList[indexPath.row].sName)
        cell.adrsLabel.text = (MyList[indexPath.row].sAdrs)
        cell.dscrptnLabel.text = (MyList[indexPath.row].sDscrptn)
        cell.imgView.image = (MyList[indexPath.row].sImg)

        return cell
    }

}

