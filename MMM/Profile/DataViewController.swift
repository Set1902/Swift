//
//  DataViewController.swift
//  MMM
//
//  Created by Sergei Kovalev on 04.03.2022.
//

import UIKit

class DataViewController: UIViewController {

    @IBOutlet weak var justreggg: UILabel!
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    @IBOutlet weak var justName: UILabel!
    
    
    @IBOutlet weak var justLastname: UILabel!
    
    @IBOutlet weak var justMiddlename: UILabel!
    
    
    @IBOutlet weak var justPhone: UILabel!
    
    
    @IBOutlet weak var profileMiddleName: UITextField!
    
    
    
    @IBOutlet weak var profilePhone: UITextField!
    
    
    
    
    @IBOutlet weak var profileLastName: UITextField!
    
    @IBOutlet weak var profileName: UITextField!
    
    var data: Profile = Profile()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        if phone == "" {
            profileName.isHidden = true
            profileLastName.isHidden = true
            profileMiddleName.isHidden = true
            profilePhone.isHidden = true
            justName.isHidden = true
            justPhone.isHidden = true
            justLastname.isHidden = true
            justMiddlename.isHidden = true
            justreggg.isEnabled = true
            
        } else {
            profileName.isHidden = false
            profileLastName.isHidden = false
            profileMiddleName.isHidden = false
            profilePhone.isHidden = false
            justName.isHidden = false
            justPhone.isHidden = false
            justLastname.isHidden = false
            justMiddlename.isHidden = false
            justreggg.isHidden = true
            
        }
        
        
        print(customer_name)
        
        profileName.text = customer_name
        profileLastName.text = customer_lastname
        profileMiddleName.text = customer_middlename
        profilePhone.text = phone
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
            //self.performSegue(withIdentifier: "unwindToMenupp", sender: self)
        } else {
            
            if profileName.text! == "" || profilePhone.text! == "" || profileLastName.text! == "" || profileMiddleName.text! == "" {
                
                let alert2 = UIAlertController(title: "Предупреждение", message: "Вы ввели не все необходимые данные для их сохнанения", preferredStyle: UIAlertController.Style.alert)
                alert2.addAction(UIAlertAction(title: "Готово", style: UIAlertAction.Style.cancel, handler: nil))
                alert2.addAction(UIAlertAction(title: "Вернуться в меню", style: UIAlertAction.Style.default, handler: { action in
                    
                    
                    //self.performSegue(withIdentifier: "unwindToMenupp", sender: self)
                    print("awesome")
                }))
                
                self.present(alert2, animated: true, completion: nil)
                
                //self.performSegue(withIdentifier: "unwindToMenupp", sender: self)
                
            } else {
                
                phone = profilePhone.text!
                customer_name = profileName.text!
                customer_lastname = profileLastName.text!
                customer_middlename = profileMiddleName.text!
                
                
                let request = NSMutableURLRequest(url: NSURL(string: "http://Sergei.local:8888/VKRB/EditFIO.php")! as URL)
                request.httpMethod = "POST"
                let postString = "customer_name=\(profileName.text!)&customer_lastname=\(profileLastName.text!)&customer_middlename=\(profileMiddleName.text!)&phone=\(profilePhone.text!)"
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
                //self.performSegue(withIdentifier: "unwindToMenupp", sender: self)
            }
            
            
        }
        
        
        
    }
    
    
    
    
}
