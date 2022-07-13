//
//  VVodNewCustomerViewController.swift
//  MMM
//
//  Created by Sergei Kovalev on 07.03.2022.
//

import UIKit

class VVodNewCustomerViewController: UIViewController {
    
    
    
    
    
    @IBOutlet weak var imya: UITextField!
    
    
    @IBOutlet weak var familiya: UITextField!
    
    
    @IBOutlet weak var otchestvo: UITextField!
    
    
    @IBOutlet weak var zvonilka: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func bbuttonTapped(_ sender: Any) {
        customer_name = imya.text!
        customer_lastname = familiya.text!
        customer_middlename = otchestvo.text!
        phone = zvonilka.text!

        
        // Отправка данных в базу данных
        
        
        
        let request = NSMutableURLRequest(url: NSURL(string: "http://Sergei.local:8888/VKRB/AddCustomer.php")! as URL)
        request.httpMethod = "POST"
            let postString = "customer_name=\(customer_name)&customer_lastname=\(customer_lastname)&customer_middlename=\(customer_middlename)&phone=\(phone)&address=\(address)&customer_card=\(customer_card)"
        request.httpBody = postString.data(using: String.Encoding.utf8)

        let task = URLSession.shared.dataTask(with: request as URLRequest) {
            data, response, error in

            if error != nil {
                print("error=\(error)")
                return
            }

            print("response = \(response)")

            let responseString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
            print("responseString = \(responseString)")
            
        }
        task.resume()
        
        
        
        
        
    }
    
    
    

    
    
        
    
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    
  

}
