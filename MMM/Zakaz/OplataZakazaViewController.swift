//
//  OplataZakazaViewController.swift
//  MMM
//
//  Created by Sergei Kovalev on 07.03.2022.
//

import UIKit
import MapKit
import CoreLocation
class OplataZakazaViewController: UIViewController {
    
    
    
    @IBOutlet weak var nomerKarty: UITextField!
    
    
    @IBOutlet weak var ulitsa: UITextField!
    
    
    
    @IBOutlet weak var nomerDoma: UITextField!
    
    @IBOutlet weak var gorod: UITextField!
    
    
    
    @IBOutlet weak var strana: UITextField!
    
    
    @IBOutlet weak var index: UITextField!
    
    
    
    
    
    var geocoder = CLGeocoder()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        
        if customer_card == "" && address == "" {
            
            // вывести сообщение, что необходимо внести недостающие данные
            
        } else {
            
            
            nomerKarty.text! = customer_card
            
            let numbers = address.components(separatedBy: [","])
            
            let pp = numbers[1].components(separatedBy: " ")
            
            print(numbers)
            print(pp)
            
            ulitsa.text! = numbers[0]
            nomerDoma.text! = pp[1]
            gorod.text! = pp[2]
            strana.text! = pp[3]
            index.text! = pp[4]

            
            
            
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
    
    
    
    
    @IBAction func buttonTappde(_ sender: Any) {
        
        if ulitsa.text! == "" || nomerDoma.text! == "" || gorod.text! == "" || strana.text! == "" || index.text! == "" || nomerKarty.text! == "" {
            let alert2 = UIAlertController(title: "Предупреждение", message: "Вы ввели не все необходимые данные для их сохнанения", preferredStyle: UIAlertController.Style.alert)
            alert2.addAction(UIAlertAction(title: "Готово", style: UIAlertAction.Style.cancel, handler: nil))
            
            
            self.present(alert2, animated: true, completion: nil)
        }
        var naddress = "\(ulitsa.text!), \(nomerDoma.text!) \(gorod.text!) \(strana.text!) \(index.text!)"
        
        geocoder.geocodeAddressString(naddress) {
            placemarks, error in
            let placemark = placemarks?.first
            let lat = placemark?.location?.coordinate.latitude
            let lon = placemark?.location?.coordinate.longitude
            print("Lat: \(lat), Lon: \(lon)")
            if (lat != nil) == true && (lon != nil) == true {
                // ok
                if naddress == address && self.nomerKarty.text! == customer_card {
                    let request = NSMutableURLRequest(url: NSURL(string: "http://Sergei.local:8888/VKRB/AddPlata.php")! as URL)
                    request.httpMethod = "POST"
                        let postString = "Order_id=\(ord_id)&Oplata=\(1)"
                        print("kkkk\(Cust_id)")
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
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let dvc = storyboard.instantiateViewController(withIdentifier: "uwu")
                   
                    self.present(dvc, animated: true)
                } else {
                    
                    // Сохранить данную информацию в базу данных
                    print("salam")
                    
                    address = naddress
                    customer_card = self.nomerKarty.text!
                    
                    let request = NSMutableURLRequest(url: NSURL(string: "http://Sergei.local:8888/VKRB/AddAddr.php")! as URL)
                    request.httpMethod = "POST"
                        let postString = "phone=\(phone)&address=\(address)&customer_card=\(customer_card)"
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
                
                    
                    
                    
                    
                    
                    let request1 = NSMutableURLRequest(url: NSURL(string: "http://Sergei.local:8888/VKRB/AddPlata.php")! as URL)
                    request1.httpMethod = "POST"
                        let postString1 = "Order_id=\(ord_id)&Oplata=\(1)"
                        print("kkkk\(Cust_id)")
                    request.httpBody = postString1.data(using: String.Encoding.utf8)

                    let task1 = URLSession.shared.dataTask(with: request as URLRequest) {
                        data, response, error in

                        if error != nil {
                            print("error=\(error)")
                            return
                        }

                        print("response = \(response)")

                        let responseString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
                        print("responseString = \(responseString)")
                        
                    }
                    task1.resume()
                    
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let dvc = storyboard.instantiateViewController(withIdentifier: "uwu")
                   
                    self.present(dvc, animated: true)
                    
                }
                    
                   
            } else {
                
                let alert3 = UIAlertController(title: "Предупреждение", message: "Адрес, который вы ввели не существует", preferredStyle: UIAlertController.Style.alert)
                alert3.addAction(UIAlertAction(title: "Готово", style: UIAlertAction.Style.cancel, handler: nil))
                
                
                self.present(alert3, animated: true, completion: nil)
            }
        }
        
        
            
            
            
            
        }
        
        
        
        
        
    }
    
    
    
    
    
    


