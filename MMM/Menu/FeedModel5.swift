//
//  FeedModel5.swift
//  MMM
//
//  Created by Sergei Kovalev on 22.03.2022.
//

//
//  FeedModel.swift
//  list1
//
//  Created by Sergei Kovalev on 13.02.2022.
//

import Foundation

protocol FeedModelProtocol5: class {
    func itemsDownloaded(items: NSArray)
}


class FeedModel5: NSObject, URLSessionDataDelegate {
    
    
    
    weak var delegate: FeedModelProtocol5!
    
    
    let urlPath = "http://Sergei.local:8888/VKRB/GetRes.php?Pizza_id=\(pp_id)" //Change to the web address of your stock_service.php file
    
    
    
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
                
                let stock = Recept()
                
                //the following insures none of the JsonElement values are nil through optional binding
                if let Recept_id = jsonElement["Recept_id"] as? String,
                    let Pizza_id = jsonElement["Pizza_id"] as? String,
                    let Sostav_id = jsonElement["Sostav_id"] as? String,
                   let Count = jsonElement["Count"] as? String,
                   let Ed = jsonElement["Ed"] as? String,
                   let name_produkt = jsonElement["name_produkt"] as? String
            
                {
                    
                    stock.Recept_id = Recept_id
                    stock.Pizza_id = Pizza_id
                    stock.Sostav_id = Sostav_id
                    stock.Count = Count
                    stock.Ed = Ed
                    stock.name_produkt = name_produkt
                   
                    
                }
                
                stocks.add(stock)
                
            }
            
            DispatchQueue.main.async(execute: { () -> Void in
                
                self.delegate.itemsDownloaded(items: stocks)
                
            })
        }
    }
