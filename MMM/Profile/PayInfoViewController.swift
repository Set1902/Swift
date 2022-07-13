//
//  PayInfoViewController.swift
//  MMM
//
//  Created by Sergei Kovalev on 04.03.2022.
//

import UIKit

class PayInfoViewController: UIViewController {

    @IBOutlet weak var wawning: UILabel!
    
    
    
    @IBOutlet weak var payInfo: UITextField!
    
    
    @IBOutlet weak var number: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        payInfo.text = customer_card
        // Do any additional setup after loading the view.
        
        
        if phone == "" {
            payInfo.isHidden = true
            number.isHidden = true
            wawning.isEnabled = true
        } else {
            payInfo.isHidden = false
            number.isHidden = false
            wawning.isHidden = true
        }
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    @IBAction func safeButtonTapped(_ sender: Any) {
        
        
        
        if phone == "" {
            //perform segue
           // self.performSegue(withIdentifier: "unwindToMenucc", sender: self)
        } else {
            
            
            if payInfo.text! == "" {
                let alert2 = UIAlertController(title: "Предупреждение", message: "Вы ввели не все необходимые данные для их сохнанения", preferredStyle: UIAlertController.Style.alert)
                alert2.addAction(UIAlertAction(title: "Готово", style: UIAlertAction.Style.cancel, handler: nil))
                alert2.addAction(UIAlertAction(title: "Вернуться в меню", style: UIAlertAction.Style.default, handler: { action in
                    
                    
                    //self.performSegue(withIdentifier: "unwindToMenucc", sender: self)
                    print("awesome")
                }))
                
                self.present(alert2, animated: true, completion: nil)

                
            } else {
                customer_card = payInfo.text!
                
                
                
                let request = NSMutableURLRequest(url: NSURL(string: "http://Sergei.local:8888/VKRB/EditPay.php")! as URL)
                request.httpMethod = "POST"
                let postString = "customer_card=\(payInfo.text!)&phone=\(phone)"
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
               // self.performSegue(withIdentifier: "unwindToMenucc", sender: self)
            }
            
            
            
        }
        
        
        
        
        
    }
    
    
    
    

}
