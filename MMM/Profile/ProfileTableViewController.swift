//
//  ProfileTableViewController.swift
//  list1
//
//  Created by Sergei Kovalev on 20.02.2022.
//

import UIKit

class ProfileTableViewController: UITableViewController {

    
    
    
    
    var titleString = [0 : "Ваши данные", 1 : "Информация"]
    var rowString = [0: ["Данные профиля", "Softball", "Cricket"], 1: ["Field Hockey", "Ice Hockey", "Roller Hockey"]]
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {

        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return (rowString[section]?.count)!
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cellIdentifier: String = "stockCell"
        let myCell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)!
        //cell = rowString[indexPath.section]?[indexPath.row]
        myCell.textLabel!.text = rowString[indexPath.section]?[indexPath.row]
        return myCell
    }

    // Uncomment for Default design and comment viewForHeaderInSection method
    //func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {

        //return titleString[section]
    //}


    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

        let sectionView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 25))
        sectionView.backgroundColor = UIColor.magenta

        let sectionName = UILabel(frame: CGRect(x: 5, y: 0, width: tableView.frame.size.width, height: 25))
        sectionName.text = titleString[section]
        sectionName.textColor = UIColor.white
        sectionName.font = UIFont.systemFont(ofSize: 14)
        sectionName.textAlignment = .left

        sectionView.addSubview(sectionName)
        return sectionView
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "Show" else {return}
        
        let navController = segue.destination as! UINavigationController
        
       let todoViewController = navController.topViewController as! DataViewController
       // guard let newIndexPath = stockResultsFeed.indexPathForSelectedRow else {return}
        //let selectedToDo: Menu = feedItems[newIndexPath.row] as! Menu
       //todoViewController.todo = selectedToDo
    }

}
