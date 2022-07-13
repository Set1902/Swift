//
//  FeedModel6.swift
//  MMM
//
//  Created by Sergei Kovalev on 14.04.2022.
//

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

protocol FeedModelProtocol6: class {
    func itemsDownloaded1(items: NSArray)
}


class FeedModel6: NSObject, URLSessionDataDelegate {
    
    weak var delegate: FeedModelProtocol6!
    
        let urlPath = "http://Sergei.local:8888/VKRB/GetSos.php?Sostav_id=\(1)" //Change to the web address of your stock_service.php file
     

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
             
             let array: NSArray = jsonResult
             
             
             var objCArray = NSMutableArray(array: jsonResult)

             
             
             //if jsonResult == "" {
               //  print(")))")
             //}
              
            } catch let error as NSError {
                print(error)
                
            }
            
            var jsonElement1 = NSDictionary()
            let stocks = NSMutableArray()
            
            for i in 0 ..< jsonResult.count
            {
                
                jsonElement1 = jsonResult[i] as! NSDictionary
                
                let stock = SSostav()
                
                //the following insures none of the JsonElement values are nil through optional binding
                if let name_produkt1 = jsonElement1["name_produkt"] as? String
                {
                    //print(pizzaName)
                    //print(numberOfPizzas)
                    
                    
                    
                    
                    stock.name_produkt = name_produkt1
                    //customer_name: customer_name, customer_lastname: customer_lastname, customer_middlename: customer_middlename, nickname: nickname, phone: phone, address: address, customer_card: customer_card
                    
                   
                   // profile.nickname = nickname
                    
                    
                    
                }
                
               stocks.add(stock)
                
            }
            
            //DispatchQueue.main.async(execute: { () -> Void in
                
                //self.delegate.itemsDownloaded1(items: stocks1)
                
            //})
    }
    
    
    }

