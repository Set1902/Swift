//
//  FeedModel1.swift
//  list1
//
//  Created by Sergei Kovalev on 13.02.2022.
//




import Foundation

protocol FeedModelProtocol1: class {
    func itemsDownloaded1(items: NSArray)
}

var ssr: Int = 0
class FeedModel1: NSObject, URLSessionDataDelegate {
    
    
    
    weak var delegate: FeedModelProtocol1!
    // Нужно сдклать еще один php для получения инфы
    let urlPath = "http://Sergei.local:8888/VKRB/Getzakaz.php?Cust_id=\(Cust_id)" //Change to the web address of your stock_service.php file
    
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
                
                var objCArray = NSMutableArray(array: jsonResult)

                if let swiftArray = objCArray as NSArray as? [String] {

                    // Use swiftArray here
                    
                    if swiftArray.isEmpty == true {
                        print("pop\(swiftArray)")
                        ssr = 1
                    } else {
                        ssr = 0
                    }
                    
                    
                }
                
                
            } catch let error as NSError {
                print(error)
                
            }
            
            var jsonElement1 = NSDictionary()
            let stocks1 = NSMutableArray()
            
            for i in 0 ..< jsonResult.count
            {
                
                jsonElement1 = jsonResult[i] as! NSDictionary
                
                let stock1 = Zakaz()
                
                //the following insures none of the JsonElement values are nil through optional binding
                if let pizzaName = jsonElement1["pizzaName"] as? String,
                    let numberOfPizzas = jsonElement1["numberOfPizzas"] as? String,
                    let Price = jsonElement1["Price"] as? String,
                   let Zakaz_id = jsonElement1["Zakaz_id"] as? String
            
                {
                    print(pizzaName)
                    print(numberOfPizzas)
                    
                    stock1.Zakaz_id = Zakaz_id
                    stock1.pizzaName = pizzaName
                    stock1.numberOfPizzas = numberOfPizzas
                    //numberP = Int(numberOfPizzas)!
                    stock1.Price = Price
                    
                }
                
                stocks1.add(stock1)
                
            }
            
            DispatchQueue.main.async(execute: { () -> Void in
                
                self.delegate.itemsDownloaded1(items: stocks1)
                
            })
        }
    }
