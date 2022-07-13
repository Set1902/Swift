//
//  VashZakazViewController.swift
//  list1
//
//  Created by Sergei Kovalev on 25.02.2022.
//

import UIKit
import PDFKit

class VashZakazViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, FeedModelProtocol1 {

    

    @IBOutlet weak var Order: UIButton!
    
    var feedItems1: NSArray = NSArray()
    var selectedStock : Zakaz = Zakaz()
    @IBOutlet weak var Strock: UITableView!
    
    var s = 0
    
    
    override func viewDidAppear(_ animated: Bool) {
        up()
        s = 0
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
       // up()
        
        
        
        
        // Do any additional setup after loading the view.
    }
    
    func itemsDownloaded1(items: NSArray) {
        
        feedItems1 = items
        self.Strock.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of feed items
        return feedItems1.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Retrieve cell
        let cellIdentifier: String = "show1"
        let myCell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)!
        // Get the stock to be shown
        let item: Zakaz = feedItems1[indexPath.row] as! Zakaz
        // Configure our cell title made up of name and price
        let titleStr: String = item.pizzaName! + ": " + item.numberOfPizzas!
        print(titleStr)
        let detString: String = item.Price!
        let numString: String = item.numberOfPizzas!
        numberP = Int(item.numberOfPizzas!)!
        // Get references to labels of cell
        myCell.textLabel!.text = titleStr
        myCell.detailTextLabel!.text = detString

        let a:Int? = Int(detString)
        let b:Int? = Int(numString)
        
        s += a! * b!
        print(s)
        // добавить цену и сумму
        Order.setTitle(" \(s) Рублей ", for: .normal)
       
        return myCell
    }
    
    
    
    
     func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        
        
        
        return true
    }
    
    
 
    
    
    /*override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         guard segue.identifier == "Show" else {return}
         
         let navController = segue.destination as! UINavigationController
         
         let todoViewController = navController.topViewController as! DetailTableViewController
        guard let newIndexPath = tableView.indexPathForSelectedRow else {return}
         let selectedToDo = feedItems[newIndexPath.row]
         todoViewController.todo = selectedToDo
     }*/
    
    
    /*override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "Show" else {return}
        
        let navController = segue.destination as! UINavigationController
        
        let todoViewController = navController.topViewController as! DetailViewController
        guard let newIndexPath = stockResultsFeed.indexPathForSelectedRow else {return}
        let selectedToDo: Menu = feedItems[newIndexPath.row] as! Menu
        todoViewController.todo = selectedToDo
    }
    
*/
    
    
    
    
    @IBAction func unwindToOrderList(unwindSegue: UIStoryboardSegue) {

        
        
        
    }
    
    
    
    @IBAction func orderbuttonTapped(_ sender: Any) {
        
        
        
        
    }
    
    
    
    
    func up () {
        self.Strock.delegate = self
        self.Strock.dataSource = self
        
        let feedModel = FeedModel1()
        feedModel.delegate = self
        feedModel.downloadItems()
        
    }
    
    @IBAction func unwindTocheck(unwindSegue: UIStoryboardSegue) {

        
        
    }
    

}
