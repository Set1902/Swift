//
//  AddressViewController.swift
//  MMM
//
//  Created by Sergei Kovalev on 04.03.2022.
//

import UIKit
import MapKit
import CoreLocation
class AddressViewController: UIViewController {

    @IBOutlet weak var justrrrdrd: UILabel!
    

    @IBOutlet weak var justHouseNum: UILabel!
    
    
    @IBOutlet weak var justCity: UILabel!
    
    
    @IBOutlet weak var justContry: UILabel!
    
    
    @IBOutlet weak var justStreet: UILabel!
    
    
    @IBOutlet weak var justZip: UILabel!
    
    
    
    
    
    
    @IBOutlet weak var Street: UITextField!
    
    
    
    @IBOutlet weak var HouseNum: UITextField!
    
    
    @IBOutlet weak var City: UITextField!
    
    
    
    @IBOutlet weak var Contry: UITextField!
    
    
    @IBOutlet weak var Zip: UITextField!
    
    
    var geocoder = CLGeocoder()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        if address != "" {
            
            
            
            let numbers = address.components(separatedBy: [","])
            
            let pp = numbers[1].components(separatedBy: " ")
            
            print(numbers)
            print(pp)
            
            Street.text = numbers[0]
            HouseNum.text = pp[1]
            City.text = pp[2]
            Contry.text = pp[3]
            Zip.text = pp[4]

            justrrrdrd.isHidden = true
            
            
            
           //  доделать при регистрации новых пользователей
        } else if address == "" && phone != "" {
            justrrrdrd.isHidden = true
        } else  {
            Street.isHidden = true
            HouseNum.isHidden = true
            City.isHidden = true
            Contry.isHidden = true
            Zip.isHidden = true
            justZip.isHidden = true
            justCity.isHidden = true
            justContry.isHidden = true
            justStreet.isHidden = true
            justHouseNum.isHidden = true
            justrrrdrd.isEnabled = true
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

    
    
    
    
    @IBAction func safeButtontapped(_ sender: Any) {
        
        print(phone)
        
        if phone == "" {
            // perform segue
           // self.performSegue(withIdentifier: "unwindToMenucddc", sender: self)
        } else {
            
            
            if Street.text! == "" || HouseNum.text! == "" || City.text! == "" || Contry.text! == "" || Zip.text! == "" {
                //alert 2
                let alert2 = UIAlertController(title: "Предупреждение", message: "Вы ввели не все необходимые данные для их сохнанения", preferredStyle: UIAlertController.Style.alert)
                alert2.addAction(UIAlertAction(title: "Готово", style: UIAlertAction.Style.cancel, handler: nil))
                alert2.addAction(UIAlertAction(title: "Вернуться в меню", style: UIAlertAction.Style.default, handler: { action in
                    
                    
                   // self.performSegue(withIdentifier: "unwindToMenucddc", sender: self)
                    print("awesome")
                }))
                
                self.present(alert2, animated: true, completion: nil)
            } else {
                
            
                let ai: String = "\(Street.text!), \(HouseNum.text!) \(City.text!) \(Contry.text!) \(Zip.text!)"
                
                print(ai)
                
                geocoder.geocodeAddressString(ai) {
                    placemarks, error in
                    let placemark = placemarks?.first
                    let lat = placemark?.location?.coordinate.latitude
                    let lon = placemark?.location?.coordinate.longitude
                    print("Lat: \(lat), Lon: \(lon)")
                    if (lat != nil) == true && (lon != nil) == true {
                        print("ok")
                        
                        address = ai
                        
                        let request = NSMutableURLRequest(url: NSURL(string: "http://Sergei.local:8888/VKRB/EditAddrr.php")! as URL)
                        request.httpMethod = "POST"
                        let postString = "address=\(ai)&phone=\(phone)"
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
                       // self.performSegue(withIdentifier: "unwindToMenucddc", sender: self)
                        
                        
                    } else {
                        print("shit")
                        
                        let alert3 = UIAlertController(title: "Предупреждение", message: "Адрес, который вы ввели не существует", preferredStyle: UIAlertController.Style.alert)
                        alert3.addAction(UIAlertAction(title: "Готово", style: UIAlertAction.Style.cancel, handler: nil))
                        alert3.addAction(UIAlertAction(title: "Вернуться в меню", style: UIAlertAction.Style.default, handler: { action in
                            
                            
                            //self.performSegue(withIdentifier: "unwindToMenucddc", sender: self)
                            print("awesome")
                        }))
                        
                        self.present(alert3, animated: true, completion: nil)
                    }

                    
                }
                
                
                
                
                
                
            }
            
            
        }
        
        
        
        
        
        
        
    }
    
    
    
    
}
