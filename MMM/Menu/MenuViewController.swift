//
//  MenuViewController.swift
//  list1
//
//  Created by Sergei Kovalev on 13.02.2022.
//

import UIKit
import FirebaseAuth
class MenuViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, FeedModelProtocol {

    
    var feedItems: NSArray = NSArray()
    var selectedStock : Menu = Menu()
    
    

    @IBOutlet weak var stockResultsFeed: UITableView!
    
    override func viewDidAppear(_ animated: Bool) {
        if sss == 1 {
            do {
                try Auth.auth().signOut()
            }
            catch {
                
            }

            let alert = UIAlertController(title: "Предупреждение", message: "Введенного номера нет в базе данных <(", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Готово", style: UIAlertAction.Style.cancel, handler: nil))
            
            self.present(alert, animated: true, completion: nil)
            
        }
        sss = 0
        if ord_id == 0 {
            ord_id = Int.random(in: 1..<500000)
        }
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
        var titleStr: String = item.name! + " стоимостью от " + item.price! + " Руб."
        print(titleStr)
        if item.Nalichue == "0" {
            titleStr = "К сожалению \(item.name!) нет в наличии"
        }
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
    
    
    @IBAction func unwindToMenu(unwindSegue: UIStoryboardSegue) {

        
        
    }
    
    @IBAction func unwindToMenu12e(unwindSegue: UIStoryboardSegue) {

        let urlPath = "http://Sergei.local:8888/VKRB/GetProfile.php?phone=\(phone)" //Change to the web address of your stock_service.php file
        

            
            let url: URL = URL(string: urlPath)!
            let defaultSession = Foundation.URLSession(configuration: URLSessionConfiguration.default)
            
            let task1 = defaultSession.dataTask(with: url) { (data, response, error) in
                
                if error != nil {
                    print("Error")
                }else {
                    print("stocks downloaded")
                    self.parseJSON1(data!)
                    

                    
                }
                
            }
            
                        task1.resume()
        
    }
    

    
    func up1 () {
        self.stockResultsFeed.delegate = self
        self.stockResultsFeed.dataSource = self
        
        let feedModel = FeedModel()
        feedModel.delegate = self
        feedModel.downloadItems()
    }
    
    func parseJSON1(_ data:Data) {
            
            var jsonResult = NSArray()
        
         do{
             jsonResult = try JSONSerialization.jsonObject(with: data, options:JSONSerialization.ReadingOptions.allowFragments) as! NSArray
                print(jsonResult)
             
             let array: NSArray = jsonResult
             
             
             var objCArray = NSMutableArray(array: jsonResult)

             
             
             //if jsonResult == "" {
               //  print(")))")
             //}
              
            } catch let error as NSError {
                print(error)
                
            }
            
            var jsonElement1 = NSDictionary()
            let stocks1 = NSMutableArray()
            
            for i in 0 ..< jsonResult.count
            {
                
                jsonElement1 = jsonResult[i] as! NSDictionary
                
                
                
                //the following insures none of the JsonElement values are nil through optional binding
                if let Cust_id1 = jsonElement1["Cust_id"] as? String,
                    let customer_name1 = jsonElement1["customer_name"] as? String,
                    let customer_lastname1 = jsonElement1["customer_lastname"] as? String,
                    let customer_middlename1 = jsonElement1["customer_middlename"] as? String,
                   let phone1 = jsonElement1["phone"] as? String,
                   let address1 = jsonElement1["address"] as? String,
                   let customer_card1 = jsonElement1["customer_card"] as? String
            
                {
                    //print(pizzaName)
                    //print(numberOfPizzas)
                    
                    if phone1 == "" {
                    }
                    
                    
                    Cust_id = Cust_id1
                    customer_name = customer_name1
                    customer_lastname = customer_lastname1
                    customer_middlename = customer_middlename1
                    phone = phone1
                    address = address1
                    customer_card = customer_card1
                    //customer_name: customer_name, customer_lastname: customer_lastname, customer_middlename: customer_middlename, nickname: nickname, phone: phone, address: address, customer_card: customer_card
                    
                   
                   // profile.nickname = nickname
                    
                    print("hhhh\(customer_name)")
                    if phone != "" {
                        
                    }
                    
                }
                
               // stocks1.add(stock1)
                
            }
            
            //DispatchQueue.main.async(execute: { () -> Void in
                
                //self.delegate.itemsDownloaded1(items: stocks1)
                
            //})
        }
    
}
