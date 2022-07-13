//
//  FeedModel1.swift
//  list1
//
//  Created by Sergei Kovalev on 13.02.2022.
//

import Foundation

protocol FeedModelProtocol2: class {
    func itemsDownloaded1(items: NSArray)
}


class FeedModel2: NSObject, URLSessionDataDelegate {
    
    var username1 = 0
    var email1 = 0
    
    
    weak var delegate: FeedModelProtocol2!
    // Нужно сдклать еще один php для получения инфы
    let urlPath = "http://Sergei.local:8888/VKRB/GetProfile.php" //Change to the web address of your stock_service.php file
    
    func downloadItems() {
        



            
        let url: URL = URL(string: urlPath)!
        let defaultSession = Foundation.URLSession(configuration: URLSessionConfiguration.default)
        
        let task = defaultSession.dataTask(with: url) { (data, response, error) in
            
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
                
               /* let stock1 = Profile()
                
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
                    
                    
                }
                
                stocks1.add(stock1)
                */
            }
            
            DispatchQueue.main.async(execute: { () -> Void in
                
                self.delegate.itemsDownloaded1(items: stocks1)
                
            })
        }
    }
