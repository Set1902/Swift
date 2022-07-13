//
//  ZakazViewController.swift
//  list1
//
//  Created by Sergei Kovalev on 13.02.2022.
//

import UIKit

var ord_id: Int = 0
var fullprice: Int = 0

class ZakazViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, FeedModelProtocol1 {

    var s = 0
    
    
    @IBOutlet weak var justrerrd: UILabel!
    
    
    
    @IBOutlet weak var Order: UIButton!
    
    
    var feedItems1: NSArray = NSArray()
    var selectedStock : Zakaz = Zakaz()
    //var profile: Profile = Profile()
    
    
    
    @IBOutlet weak var stockResultsFeed: UITableView!
    
    
    override func viewDidAppear(_ animated: Bool) {
        
        justrerrd.isHidden = true
        
        if phone == "" {
            stockResultsFeed.isHidden = true
            justrerrd.isEnabled = true

            let alert = UIAlertController(title: "Предупреждение", message: "Чтобы сделать заказ нужно сначала пройти простую регистрацию", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Готово", style: UIAlertAction.Style.cancel, handler: nil))
            alert.addAction(UIAlertAction(title: "Регистрация", style: UIAlertAction.Style.default, handler: { action in
                
                
                self.performSegue(withIdentifier: "EEEnter", sender: self)
                print("awesome")
            }))
            self.present(alert, animated: true, completion: nil)
        } else {
            justrerrd.isHidden = true
            stockResultsFeed.isHidden = false
            up()
            s = 0
            
        }
        
        
        if s == 0 {
            Order.isHidden = true
        
        }
        
        
        //print("Profile \(profile.customer_name)")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        
        
       // up()
        
        
        
        
        // Do any additional setup after loading the view.
    }
    
    func itemsDownloaded1(items: NSArray) {
        
        feedItems1 = items
        self.stockResultsFeed.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of feed items
        return feedItems1.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Retrieve cell
        let cellIdentifier: String = "show"
        let myCell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)!
        // Get the stock to be shown
        let item: Zakaz = feedItems1[indexPath.row] as! Zakaz
        // Configure our cell title made up of name and price
        let titleStr: String = item.pizzaName! + ": " + item.numberOfPizzas!
        print(titleStr)
        let detString: String = item.Price!
        let numString: String = item.numberOfPizzas!
        // Get references to labels of cell
        myCell.textLabel!.text = titleStr
        myCell.detailTextLabel!.text = detString

        let a:Int? = Int(detString)
        let b:Int? = Int(numString)
        
        s += a! * b!
        print(s)
        // добавить цену и сумму
        Order.isHidden = false
        Order.setTitle("Оплатить \(s) Руб.", for: .normal)
        fullprice = s
        return myCell
    }
    
    
    
    
     func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        
        
        
        return true
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            let dictData:NSMutableArray = feedItems1 as! NSMutableArray
            let item: Zakaz = feedItems1[indexPath.row] as! Zakaz
            let p: String = item.Zakaz_id!
            let p1: String = item.Price!
            let p2: String = item.numberOfPizzas!
            
            let a:Int? = Int(p1)
            let b:Int? = Int(p2)
            
            s = s - a! * b!
            
            //print(s)
            if ssr == 1 {
                let alert2 = UIAlertController(title: "Корзина пуста", message: "Вам неообходимо что-нибудь добавить в корзину", preferredStyle: UIAlertController.Style.alert)
                alert2.addAction(UIAlertAction(title: "Готово", style: UIAlertAction.Style.cancel, handler: nil))
                alert2.addAction(UIAlertAction(title: "Меню", style: UIAlertAction.Style.default, handler: { action in
                    
                    
                    self.performSegue(withIdentifier: "Menuu", sender: self)
                    print("awesome")
                }))
                self.present(alert2, animated: true, completion: nil)
                ssr = 0
            }
            
            if s == 0 {
                //Order.setTitle("Пустая корзина", for: .normal)
                Order.isHidden = true
                let alert1 = UIAlertController(title: "Корзина пуста", message: "Вам неообходимо что-нибудь добавить в корзину", preferredStyle: UIAlertController.Style.alert)
                alert1.addAction(UIAlertAction(title: "Готово", style: UIAlertAction.Style.cancel, handler: nil))
                alert1.addAction(UIAlertAction(title: "Меню", style: UIAlertAction.Style.default, handler: { action in
                    
                    
                    self.performSegue(withIdentifier: "Menuu", sender: self)
                    print("awesome")
                }))
                self.present(alert1, animated: true, completion: nil)
            } else {
                Order.isHidden = false
                Order.setTitle("Оплатить \(s) Руб.", for: .normal)
            }
            
            
            
            
            
            dictData.removeObject(at: indexPath.row)
            self.stockResultsFeed.deleteRows(at: [indexPath], with: .automatic)
            
            let request = NSMutableURLRequest(url: NSURL(string: "http://Sergei.local:8888/VKRB/RemZak.php")! as URL)
            request.httpMethod = "POST"
                let postString = "Zakaz_id=\(p)"
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
            


            numberP = 0
            //print(p)
            
            
            
            
            //stockResultsFeed.deleteRows(at: [indexPath], with: .automatic)
        }
        
    }
    
    
    /*override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         guard segue.identifier == "Show" else {return}
         
         let navController = segue.destination as! UINavigationController
         
         let todoViewController = navController.topViewController as! DetailTableViewController
        guard let newIndexPath = tableView.indexPathForSelectedRow else {return}
         let selectedToDo = feedItems[newIndexPath.row]
         todoViewController.todo = selectedToDo
     }*/
    
    
    /*override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "Show" else {return}
        
        let navController = segue.destination as! UINavigationController
        
        let todoViewController = navController.topViewController as! DetailViewController
        guard let newIndexPath = stockResultsFeed.indexPathForSelectedRow else {return}
        let selectedToDo: Menu = feedItems[newIndexPath.row] as! Menu
        todoViewController.todo = selectedToDo
    }
    
*/
    
    
    
    
    @IBAction func unwindToOrderList(unwindSegue: UIStoryboardSegue) {

        let p = 0
        let request = NSMutableURLRequest(url: NSURL(string: "http://Sergei.local:8888/VKRB/ClearZak.php")! as URL)
        request.httpMethod = "POST"
            let postString = "id=\(p)"
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
        
        print("pp")
        
        Order.setTitle("Пустая корзина", for: .normal)
        
        ord_id = 0
        
        numberP = 0
    }
    
    @IBAction func unwindToOrderListttttt(unwindSegue: UIStoryboardSegue) {

        
    }
    
    func up () {
        self.stockResultsFeed.delegate = self
        self.stockResultsFeed.dataSource = self
        
        let feedModel = FeedModel1()
        feedModel.delegate = self
        feedModel.downloadItems()
        
    }
    
    
    
    @IBAction func buttontapped(_ sender: Any) {
        
        if s == 0 {
            
        } else {
            
            
            //ord_id = Int.random(in: 1..<50)
            
            let request = NSMutableURLRequest(url: NSURL(string: "http://Sergei.local:8888/VKRB/AddOrd.php")! as URL)
            request.httpMethod = "POST"
                let postString = "Order_id=\(ord_id)&Date_and_time=\(12)&Sotr_id=\(2)&Cust_id=\(Cust_id)&Pizzeria_id=\(2)&Price=\(fullprice)&Oplata=\(0)"
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
            
            performSegue(withIdentifier: "next", sender: self)
        }
        
        
        
        
        
    }
    
    
    
    
    
}
