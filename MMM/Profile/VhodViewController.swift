//
//  VhodViewController.swift
//  MMM
//
//  Created by Sergei Kovalev on 04.03.2022.
//

import UIKit
import FirebaseAuth

    
    //properties of a stock

var Cust_id: String = ""
    var customer_name: String = ""
    var customer_lastname: String = ""
    var customer_middlename: String = ""
    var nickname: String = ""
    var phone: String = ""
    var address: String = "" //= "Малый Тишинксий переулок, 14-16 Москва Росиия 123056"
    var customer_card: String = ""
var numberP: Int = 0

var sss = 0


class VhodViewController: UIViewController{

    
    @IBOutlet weak var Dobro: UILabel!
    
    
    
    @IBOutlet weak var net: UILabel!
    
    var phoneNumber: String?

    var dd: Int = 0
    
    @IBOutlet weak var nomerLable: UILabel!
    
    
    @IBOutlet weak var newAcc: UIButton!
    
    
    @IBOutlet weak var phoneNum: UITextField!
    
    
    @IBOutlet weak var Button: UIButton!
    
    private func showCodeValidVC (verificatonID: String) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let dvc = storyboard.instantiateViewController(withIdentifier: "CodeValidVC") as! CodeValidVC
        dvc .verificationID = verificatonID
        self.present(dvc, animated: true)
    }
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        if phone != "" {
            phoneNum.isHidden = true
            Button.setTitle("Выйти", for: .normal)
            newAcc.isHidden = true
            nomerLable.isHidden = true
            Dobro.isHidden = true
            net.isHidden = true
        } else {
            
            Button.setTitle("Войти", for: .normal)
        }
        
        
        
        // Do any additional setup after loading the view.
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    
    
    @IBAction func buttonTapped(_ sender: Any) {
        
        
        
        
        
        if phone != "" {
            
            customer_name = ""
            customer_lastname = ""
            customer_middlename = ""
            nickname = ""
            phone = ""
            address = "" //= "Малый Тишинксий переулок, 14-16 Москва Росиия 123056"
            customer_card = ""
            do {
                try Auth.auth().signOut()
                performSegue(withIdentifier: "unwindToMenuUU", sender: self)
            } catch {
                
            }
        } else {
            
            let urlPath = "http://Sergei.local:8888/VKRB/GetProfile.php?phone=\(phoneNum.text!)" //Change to the web address of your stock_service.php file
            

                
                let url: URL = URL(string: urlPath)!
                let defaultSession = Foundation.URLSession(configuration: URLSessionConfiguration.default)
                
                let task = defaultSession.dataTask(with: url) { (data, response, error) in
                    
                    if error != nil {
                        print("Error")
                    }else {
                        print("stocks downloaded")
                        self.parseJSON1(data!)
                        if sss == 1 {
                            
                            
                            
                            DispatchQueue.main.async(){
                                
                               self.performSegue(withIdentifier: "unwindToMenuu", sender: self)
                            }
                            
                        }

                        
                    }
                    
                }
                
                            task.resume()
             
            let phoneNum1 = phoneNum.text!
            let wsc: Int = phoneNum1.count
            if wsc == 11 {
                var phoneNum2: String = "+\(phoneNum1)"
                phoneNum2.insert(" ",at: phoneNum2.index(phoneNum2.startIndex, offsetBy: 2))
                phoneNum2.insert(" ",at: phoneNum2.index(phoneNum2.startIndex, offsetBy: 6))
                phoneNum2.insert("-",at: phoneNum2.index(phoneNum2.startIndex, offsetBy: 10))
                phoneNum2.insert("-",at: phoneNum2.index(phoneNum2.startIndex, offsetBy: 13))
                print(phoneNum2)
                guard phoneNum != nil else {return}
                
                PhoneAuthProvider.provider().verifyPhoneNumber(phoneNum2, uiDelegate: nil) {
                    (verificationID, error) in
                    if error != nil {
                        print(error?.localizedDescription ?? "is empty")
                    } else {
                        self.showCodeValidVC(verificatonID: verificationID!)
                    }
                }
                
            }
            
        
            //let request = NSMutableURLRequest(url: NSURL(string: "http://localhost:8888/VKRB/GetProfile.php?phone=\(phoneNum.text!)")! as URL)
       // request.httpMethod = "POST"
        //let postString = "phone=\(phoneNum.text!)"
       //request.httpBody = postString.data(using: String.Encoding.utf8)

       // let task = URLSession.shared.dataTask(with: request as URLRequest) {
            //data, response, error in

           // if error != nil {
            //   print("error=\(error)")
           //     return
            //}

            //print("response = \(response)")
           // self.parseJSON1(data!)

            //let responseString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
            //print("responseString = \(responseString)")
        //}
       // task.resume()
            
            
        }
        
    }
    
    
    func parseJSON1(_ data:Data) {
            
            var jsonResult = NSArray()
        
         do{
             jsonResult = try JSONSerialization.jsonObject(with: data, options:JSONSerialization.ReadingOptions.allowFragments) as! NSArray
                print(jsonResult)
             
             let array: NSArray = jsonResult
             
             
             var objCArray = NSMutableArray(array: jsonResult)

             if let swiftArray = objCArray as NSArray as? [String] {

                 // Use swiftArray here
                 
                 if swiftArray.isEmpty == true {
                     print("pop\(swiftArray)")
                     sss = 1
                 } else {
                     sss = 0
                 }
                 
                 
             }
             
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

    
    @IBAction func unwindToEnter(unwindSegue: UIStoryboardSegue) {

        
        
    }
    
    
}
