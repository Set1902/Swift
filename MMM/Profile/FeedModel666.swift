//
//  FeedModel666.swift
//  MMM
//
//  Created by Sergei Kovalev on 29.04.2022.
//
//
//  FeedModel.swift
//  list1
//
//  Created by Sergei Kovalev on 13.02.2022.
//

import Foundation

protocol FeedModelProtocol666: class {
    func itemsDownloaded(items: NSArray)
}


class FeedModel666: NSObject, URLSessionDataDelegate {
    
    
    
    weak var delegate: FeedModelProtocol666!
    
    let urlPath = "http://Sergei.local:8888/VKRB/Menu.php" //Change to the web address of your stock_service.php file
    
    func downloadItems() {
        
        let url: URL = URL(string: urlPath)!
        let defaultSession = Foundation.URLSession(configuration: URLSessionConfiguration.default)
        
        let task = defaultSession.dataTask(with: url) { (data, response, error) in
            
            if error != nil {
                print("Error")
            }else {
                print("stocks downloaded")
                self.parseJSON(data!)
            }
            
        }
        
        task.resume()
    }

    func parseJSON(_ data:Data) {
            
            var jsonResult = NSArray()
            
            do{
                jsonResult = try JSONSerialization.jsonObject(with: data, options:JSONSerialization.ReadingOptions.allowFragments) as! NSArray
                
            } catch let error as NSError {
                print(error)
                
            }
            
            var jsonElement = NSDictionary()
            let stocks = NSMutableArray()
            
            for i in 0 ..< jsonResult.count
            {
                
                jsonElement = jsonResult[i] as! NSDictionary
                
                let stock = Menu()
                
                //the following insures none of the JsonElement values are nil through optional binding
                if  let Pizza_id = jsonElement["Pizza_id"] as? String,
                    let name = jsonElement["name"] as? String,
                    let price = jsonElement["price"] as? String,
                    let image = jsonElement["image"] as? String,
                   let Nalichue = jsonElement["Nalichue"] as? String
            
                {
                    print(name)
                    print(price)
                    stock.Pizza_id = Pizza_id
                    stock.name = name
                    stock.price = price
                    stock.image = image
                    stock.Nalichue = Nalichue
                   
                    
                }
                
                stocks.add(stock)
                
            }
            
            DispatchQueue.main.async(execute: { () -> Void in
                
                self.delegate.itemsDownloaded(items: stocks)
                
            })
        }
    }
