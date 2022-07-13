//
//  MenuViewController.swift
//  list1
//
//  Created by Sergei Kovalev on 13.02.2022.
//

import UIKit

class MenuViewController1: UIViewController, UITableViewDataSource, UITableViewDelegate, FeedModelProtocol {

    
    var feedItems: NSArray = NSArray()
    var selectedStock : Menu = Menu()
    
    
    @IBOutlet weak var stockResultsFeed: UITableView!
    
    
    override func viewDidAppear(_ animated: Bool) {
        up1()
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //set delegates and initialize FeedModel
        //up1()
        
        
    }
    
    func itemsDownloaded(items: NSArray) {
        
        feedItems = items
        self.stockResultsFeed.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of feed items
        return feedItems.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Retrieve cell
        let cellIdentifier: String = "stockCell"
        let myCell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)!
        // Get the stock to be shown
        let item: Menu = feedItems[indexPath.row] as! Menu
        // Configure our cell title made up of name and price
        let titleStr: String = item.name! + " стоимостью от " + item.price! + " Руб."
        print(titleStr)
        // Get references to labels of cell
        myCell.textLabel!.text = titleStr
        
        return myCell
    }
    
    
    /*override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         guard segue.identifier == "Show" else {return}
         
         let navController = segue.destination as! UINavigationController
         
         let todoViewController = navController.topViewController as! DetailTableViewController
        guard let newIndexPath = tableView.indexPathForSelectedRow else {return}
         let selectedToDo = feedItems[newIndexPath.row]
         todoViewController.todo = selectedToDo
     }*/
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "Show" else {return}
        
        let navController = segue.destination as! UINavigationController
        
        let todoViewController = navController.topViewController as! DetailViewController
        guard let newIndexPath = stockResultsFeed.indexPathForSelectedRow else {return}
        let selectedToDo: Menu = feedItems[newIndexPath.row] as! Menu
        todoViewController.todo = selectedToDo
    }
    

    
    func up1 () {
        self.stockResultsFeed.delegate = self
        self.stockResultsFeed.dataSource = self
        
        let feedModel = FeedModel()
        feedModel.delegate = self
        feedModel.downloadItems()
    }
    
    
}
