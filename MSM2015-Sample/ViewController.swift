//
//  ViewController.swift
//  MSM2015-Sample
//
//  Created by Tomohiro Kumagai on H27/11/03.
//  Copyright © 平成27年 EasyStyle G.K. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var books:[Book] = []
        
    @IBOutlet var booksTableView:UITableView!
    @IBOutlet var totalPriceLabel:UILabel!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        let file = NSBundle.mainBundle().pathForResource("BookList", ofType: "plist")!
        let list = NSArray(contentsOfFile: file) as! [ [String:AnyObject] ]

        let toBook = { (item: [String : AnyObject]) -> Book in
        
            let title = item["表題"] as! String
            let author = item["著者"] as! String
            let price = item["価格"] as! Int
            let kind = Book.Kind(item["種類"] as! String)
            let publish = item["発売日"] as! NSDate
            
            return Book(title: title, author: author, price: price, kind: kind, publish: publish)
        }

        self.books = list.map(toBook)
    }

    @IBAction func sortSelectorSegmentedControlValueChanged(sender:UISegmentedControl) {
        
    }

}

extension ViewController : UITableViewDataSource, UITableViewDelegate {
        
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        fatalError("Not Implemented yet")
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {

    }
    
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
}

