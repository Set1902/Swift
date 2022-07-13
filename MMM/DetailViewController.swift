//
//  DetailViewController.swift
//  list1
//
//  Created by Sergei Kovalev on 13.02.2022.
//

import UIKit

class DetailViewController: UIViewController, UITextFieldDelegate, UITextViewDelegate {

    
    var todo: Menu?
    

    @IBOutlet weak var numbetOfPizzas: UILabel!
    
    
    @IBOutlet weak var Incordec: UIStepper!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        Incordec.wraps = true
          Incordec.autorepeat = true
          Incordec.maximumValue = 10
        
        
        
        if let todo1 = todo {
            print(todo1.name)
            //Title1 = todo1.name
            self.title = todo1.name
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
    
    
    
    @IBAction func addPressed(_ sender: UIStepper) {
        
        
        
        numbetOfPizzas.text =  Int(sender.value).description
        
        
    }
    
    
    @IBAction func buttonTapped(_ sender: Any) {
        if let todo1 = todo {
        let request = NSMutableURLRequest(url: NSURL(string: "http://localhost:8888/VKRB/Add.php")! as URL)
        request.httpMethod = "POST"
            let postString = "pizzaName=\(todo1.name!)&numberOfPizzas=\(numbetOfPizzas.text!)&Price=\(todo1.price!)"
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
        
    }
    
    

}
