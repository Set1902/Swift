//
//  ZakazDetailViewController.swift
//  MMM
//
//  Created by Sergei Kovalev on 07.04.2022.
//

import UIKit

class ZakazDetailViewController: UIViewController, UITextFieldDelegate, UITextViewDelegate, UITableViewDataSource, UITableViewDelegate, FeedModelProtocol5  {

    
    var todo: Menu?
    
    var feedItems: NSArray = NSArray()
    var selectedStock : SSostav = SSostav()
    
    
    @IBOutlet weak var sostav: UITableView!
    
    
    override func viewDidAppear(_ animated: Bool) {
        up2()
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

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

}
