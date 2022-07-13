//
//  DetailViewController.swift
//  list1
//
//  Created by Sergei Kovalev on 13.02.2022.
//

import UIKit

var qq: String = "" // Name of the pizza
var w = 0
var nnp: String = ""

class DetailViewController: UIViewController, UITextFieldDelegate, UITextViewDelegate, UITableViewDataSource, UITableViewDelegate, FeedModelProtocol5, FeedModelProtocol6 {

    var yourArray = [String]()
    
    var todo: Menu?
    
    var feedItems: NSArray = NSArray()
    var feedItems1: NSArray = NSArray()
    var selectedStock : SSostav = SSostav()
    
    @IBOutlet weak var image101: UIImageView!
    
    @IBOutlet weak var Addd: UIButton!
    
    @IBOutlet weak var sostav: UITableView!
    
    /*
     
     let alert2 = UIAlertController(title: "Корзина пуста", message: "Вам неообходимо что-нибудь добавить в корзину", preferredStyle: UIAlertController.Style.alert)
     alert2.addAction(UIAlertAction(title: "Готово", style: UIAlertAction.Style.cancel, handler: nil))
     alert2.addAction(UIAlertAction(title: "Меню", style: UIAlertAction.Style.default, handler: { action in
         
         
         self.performSegue(withIdentifier: "unwindToEnter", sender: self)
         print("awesome")
     }))
     self.present(alert2, animated: true, completion: nil)
     
     */
    
    
    override func viewDidAppear(_ animated: Bool) {
        
        
        Incordec.wraps = true
          Incordec.autorepeat = true
          Incordec.maximumValue = 10
        

        numbetOfPizzas.text = numberP.description
        
        w = numberP
   
        
        if let todo1 = todo {
            print(todo1.name)
            //Title1 = todo1.name
            self.title = todo1.name
            pp_id = todo1.Pizza_id!
            qq = todo1.name!
            if todo1.Nalichue == "0" {
                Addd.isHidden = true
            } else {
                Addd.isHidden = false
            }
            if phone == "" {
                qq = ""
            }
            if qq == "" {
                numbetOfPizzas.text = 0.description
            }
            
            print(todo1.image)
            
            setImage(from: todo1.image!)
            
            up2()
            
        }

    }

    @IBOutlet weak var numbetOfPizzas: UILabel!
    
    
    @IBOutlet weak var Incordec: UIStepper!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Do any additional setup after loading the view.
    }
    
    func itemsDownloaded(items: NSArray) {
        
        feedItems = items
        self.sostav.reloadData()
    }
    func itemsDownloaded1(items: NSArray) {
        
        feedItems1 = items
        self.sostav.reloadData()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of feed items
        return feedItems.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var ioi: String = ""
        // Retrieve cell
        let cellIdentifier: String = "stockCell1"
        let myCell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)!
        // Get the stock to be shown
        let item: Recept = feedItems[indexPath.row] as! Recept
        //let item1: SSostav = feedItems1[indexPath.row] as! SSostav
        // getting pizza name
        
       // uup228(string1: item.Sostav_id!)
        
        
       
        

        
        print("popopopoopopo\(yourArray)")
        
        
        let request = NSMutableURLRequest(url: NSURL(string: "http://Sergei.local:8888/VKRB/UpdSos.php")! as URL)
        request.httpMethod = "POST"
        let postString = "name_produkt=\(item.name_produkt!)&kolichestvo=\(item.Count!)"
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
        
        // Configure our cell title made up of name and price
        let titleStr: String = " " + item.name_produkt! + " " + item.Count! + " " + item.Ed!
        print(titleStr)
        
        // Get references to labels of cell
        myCell.textLabel!.text = titleStr
        
        return myCell
    }
    
    
    
    
    @IBAction func addPressed(_ sender: UIStepper) {
        
        
        numbetOfPizzas.text = Int(sender.value).description
        Addd.isHidden = false
        
        
        
    }
    
    
    @IBAction func buttonTapped(_ sender: Any) {
        var r: Int = 0
        
        r = Int(numbetOfPizzas.text!)!
        
                
    
        
       
        print(r)
        print("w\(w)")
        if r > 0 /*&& w == 0*/ && phone != "" {
            let cust_idd: Int = Int(Cust_id)!
             print("uuu\(cust_idd)")
            if let todo1 = todo {
                numberP = Int(numbetOfPizzas.text!)!
            let request = NSMutableURLRequest(url: NSURL(string: "http://Sergei.local:8888/VKRB/Add.php")! as URL)
            request.httpMethod = "POST"
                let postString = "pizzaName=\(todo1.name!)&numberOfPizzas=\(numbetOfPizzas.text!)&Price=\(todo1.price!)&Cust_id=\(cust_idd)&Pizza_id=\(pp_id)&Order_id=\(ord_id)"
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
            }
            performSegue(withIdentifier: "Mmenu", sender: self)
        } else if /*w > 0 && */phone != "" {
            // update order
            let cust_idd: Int = Int(Cust_id)!
             print("uuu\(cust_idd)")
            if let todo1 = todo {
                numberP = Int(numbetOfPizzas.text!)!
            let request = NSMutableURLRequest(url: NSURL(string: "http://Sergei.local:8888/VKRB/UpdZakaz.php")! as URL)
            request.httpMethod = "POST"
                let postString = "pizzaName=\(todo1.name!)&numberOfPizzas=\(numbetOfPizzas.text!)&Price=\(todo1.price!)&Cust_id=\(cust_idd)&Pizza_id=\(pp_id)"
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
            }
            performSegue(withIdentifier: "Mmenu", sender: self)
        } else if r == 0 && phone != "" {
            let alert2 = UIAlertController(title: "Предупреждение", message: "Для добавления пиццы в заказ необходимо выбрать ее количество", preferredStyle: UIAlertController.Style.alert)
            alert2.addAction(UIAlertAction(title: "Готово", style: UIAlertAction.Style.cancel, handler: nil))
            
            self.present(alert2, animated: true, completion: nil)
        } else if phone == "" {
            let alert3 = UIAlertController(title: "Предупреждение", message: "Для добавления пиццы в заказ необходима регистрация в приложении", preferredStyle: UIAlertController.Style.alert)
            alert3.addAction(UIAlertAction(title: "Готово", style: UIAlertAction.Style.cancel, handler: nil))
            alert3.addAction(UIAlertAction(title: "Регистрация", style: UIAlertAction.Style.default, handler: { action in
                
                
                self.performSegue(withIdentifier: "Eenter", sender: self)
                print("awesome")
            }))
            self.present(alert3, animated: true, completion: nil)
        }
        
        
    }
    
    
    func up3 () {
        let feedModel = FeedModel6()
        //feedModel.delegate = self
        feedModel.downloadItems()
    }
    
    
    
    func up2 () {
        self.sostav.delegate = self
        self.sostav.dataSource = self
        
        let feedModel = FeedModel5()
        feedModel.delegate = self
        feedModel.downloadItems()
    }
    
    
    func setImage(from url: String) {
        guard let imageURL = URL(string: url) else { return }

            // just not to cause a deadlock in UI!
        DispatchQueue.global().async {
            guard let imageData = try? Data(contentsOf: imageURL) else { return }

            let image = UIImage(data: imageData)
            DispatchQueue.main.async {
                self.image101.image = image
            }
        }
    }
    
    
    

    
    

}
