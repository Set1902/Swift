//
//  ReceiptViewController.swift
//  MMM
//
//  Created by Sergei Kovalev on 08.04.2022.
//

import UIKit

import PDFKit

class ReceiptViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, FeedModelProtocol1  {

    @IBOutlet weak var tt3t: UITextView!
    
    @IBOutlet weak var tt1: UITextView!
    
    @IBOutlet weak var Strock: UITableView!
    
    @IBOutlet weak var Order: UILabel!
    
   //var pdfView = PDFView()
    var feedItems1: NSArray = NSArray()
    var selectedStock : Zakaz = Zakaz()
    var s = 0
    
    
    override func viewDidAppear(_ animated: Bool) {
        
        let now = Calendar.current.dateComponents(in: .current, from: Date())

        // Create the start of the day in `DateComponents` by leaving off the time.
        let today = DateComponents(year: now.year, month: now.month, day: now.day)
        let dateToday = Calendar.current.date(from: today)!
        
        up()
        s = 0
        tt1.text = "Кассовый Чек \nИндивидуальный предпрениматель \nКовалев Сергей Александрович \n"
        
        tt3t.text = "\(dateToday)"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        /*pdfView.frame = self.view.bounds
        self.view.addSubview(pdfView)
        
        guard let url = Bundle.main.url(forResource: "Doc11", withExtension: "pdf")
        else {return}
        guard let document = PDFDocument(url: url) else {return}
        pdfView.document = document
        
        let doc = PDFDocument()
        */
       
        
    }
    
    
    
    
    
    
    func itemsDownloaded1(items: NSArray) {
        
        feedItems1 = items
        self.Strock.reloadData()
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
        return feedItems1.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Retrieve cell
        let cellIdentifier: String = "show1"
        let myCell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)!
        // Get the stock to be shown
        let item: Zakaz = feedItems1[indexPath.row] as! Zakaz
        // Configure our cell title made up of name and price
        let titleStr: String = item.pizzaName! + ": " + item.numberOfPizzas!
        print(titleStr)
        let detString: String = item.Price!
        let numString: String = item.numberOfPizzas!
        numberP = Int(item.numberOfPizzas!)!
        // Get references to labels of cell
        myCell.textLabel!.text = titleStr
        myCell.detailTextLabel!.text = detString

        let a:Int? = Int(detString)
        let b:Int? = Int(numString)
        
        s += a! * b!
        print(s)
        // добавить цену и сумму
        Order.text = " \(s) Рублей "
       
        return myCell
    }
    
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
       // Return false if you do not want the specified item to be editable.
       
       
       
       return true
   }
    
    

    
    func up () {
        self.Strock.delegate = self
        self.Strock.dataSource = self
        
        let feedModel = FeedModel1()
        feedModel.delegate = self
        feedModel.downloadItems()
        
    }

}
