//
//  EnterViewController.swift
//  MMM
//
//  Created by Sergei Kovalev on 03.03.2022.
//

import UIKit

class EnterViewController: UIViewController, FeedModelProtocol2 {
    
    
    
    var feedItems: NSArray = NSArray()
   // var selectedStock : Profile = Profile()
    
    
    func itemsDownloaded1(items: NSArray) {
        feedItems = items
        //self.stockResultsFeed.reloadData()
    }
    
    
    
    
    

    
    
    
    
    
    @IBOutlet weak var phoneNum: UITextField!
    
    
    
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        up1()
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //set delegates and initialize FeedModel
        //up1()
        
        
    }
  
    
    @IBAction func buttonTapped(_ sender: Any) {
        
        
        //downloadItems()
        up1()
        

        
        
    }
    
    
    /*override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         guard segue.identifier == "Show" else {return}
         
         let navController = segue.destination as! UINavigationController
         
         let todoViewController = navController.topViewController as! DetailTableViewController
        guard let newIndexPath = tableView.indexPathForSelectedRow else {return}
         let selectedToDo = feedItems[newIndexPath.row]
         todoViewController.todo = selectedToDo
     }*/
    
    
    /*func downloadItems() {
        
        let request1 = NSMutableURLRequest(url: NSURL(string: "http://localhost:8888/VKRB/GetProfile.php")! as URL)
         request1.httpMethod = "POST"


        let postString = "phone=\(phoneNum.text!)"
    request1.httpBody = postString.data(using: String.Encoding.utf8)

        
        let task = URLSession.shared.dataTask(with: request1 as URLRequest) { (data, response, error) in
            
            if error != nil {
                print("Error")
            }else {
                print("stocks downloaded")
                self.parseJSON1(data!)
            }
            
        }
        
        task.resume()
    }

    func parseJSON1(_ data:Data) {
            
            var jsonResult = NSArray()
            
            do{
                jsonResult = try JSONSerialization.jsonObject(with: data, options:JSONSerialization.ReadingOptions.allowFragments) as! NSArray
                print(jsonResult)
                
            } catch let error as NSError {
                print(error)
                
            }
            
            var jsonElement1 = NSDictionary()
            let stocks1 = NSMutableArray()
            
            for i in 0 ..< jsonResult.count
            {
                
                jsonElement1 = jsonResult[i] as! NSDictionary
                
                let stock1 = Profile()
                
                //the following insures none of the JsonElement values are nil through optional binding
                if let customer_name = jsonElement1["customer_name"] as? String,
                    let customer_lastname = jsonElement1["customer_lastname"] as? String,
                    let customer_middlename = jsonElement1["customer_middlename"] as? String,
                   let nickname = jsonElement1["nickname"] as? String,
                   let phone = jsonElement1["phone"] as? String,
                   let address = jsonElement1["address"] as? String,
                   let customer_card = jsonElement1["customer_card"] as? String
            
                {
                    //print(pizzaName)
                    //print(numberOfPizzas)
                    
                    stock1.customer_name = customer_name
                    stock1.customer_lastname = customer_lastname
                    stock1.customer_middlename = customer_middlename
                    stock1.nickname = nickname
                    stock1.phone = phone
                    stock1.address = address
                    stock1.customer_card = customer_card
                    print(stock1)
                    
                }
                
                stocks1.add(stock1)
                
            }
            
            //DispatchQueue.main.async(execute: { () -> Void in
                
               // self.delegate.itemsDownloaded1(items: stocks1)
                
            //})
        }
    
   */
    
    func up1 () {
       // self.stockResultsFeed.delegate = self
       // self.stockResultsFeed.dataSource = self
        
        let feedModel = FeedModel2()
        feedModel.delegate = self
        feedModel.downloadItems()

    }
    
    
    
    
    
}
