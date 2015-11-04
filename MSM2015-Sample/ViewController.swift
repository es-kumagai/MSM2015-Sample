//
//  ViewController.swift
//  MSM2015-Sample
//
//  Created by Tomohiro Kumagai on H27/11/03.
//  Copyright © 平成27年 EasyStyle G.K. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    typealias BooksFilter = ([Book]) -> [Book]
    
    var books:[Book] = []
    var booksFilter:BooksFilter?
    
    var filteredBooks:[Book] {
    
        get {
            
            if let filter = self.booksFilter {
                
                return filter(self.books)
            }
            else {
                
                return self.books
            }
        }
    }
    
    @IBOutlet var booksTableView:UITableView!
    
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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func sortSelectorSegmentedControlDidChange(sender:UISegmentedControl) {
        
        switch sender.selectedSegmentIndex {
            
        case 0:
            self.booksFilter = { $0.sortByTitle() }
            
        case 1:
            self.booksFilter = { $0.sortByPrice() }
            
        case 2:
            self.booksFilter = { $0.sortByPublish() }
            
        default:
            self.booksFilter = nil
        }
        
        self.booksTableView.reloadData()
    }

}

extension ViewController : UITableViewDataSource, UITableViewDelegate {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.filteredBooks.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("BookCell") as! BookTableViewCell
        
        cell.book = self.filteredBooks[indexPath.row]
        
        return cell
    }
}

