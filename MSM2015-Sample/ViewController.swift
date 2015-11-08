import UIKit

class ViewController: UIViewController {

    var selectedBooksPrice:Int {
        
        guard let indexPaths = self.booksTableView.indexPathsForSelectedRows else {
                
                return 0
        }
        
        let books = indexPaths.map { $0.row } .map { self.sortedBooks[$0] }
        
        return books.reduce(0) { $0 + $1.price }
    }
    
    typealias BooksSorter = ([Book]) -> [Book]
    
    var books: [Book] = []
    var booksSorter: BooksSorter?
    
    var sortedBooks:[Book] {
        
        if let sorter = self.booksSorter {
            
            return sorter(self.books)
        }
        else {
            
            return self.books
        }
    }
    
    
    @IBOutlet var booksTableView: UITableView!
    @IBOutlet var totalPriceLabel: UILabel!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        let path = NSBundle.mainBundle().pathForResource("BookList", ofType: "plist")!
        let list = NSArray(contentsOfFile: path) as! [ [String:AnyObject] ]

        let toBook = { (item: [String : AnyObject]) -> Book in
            
            let title = item["表題"] as! String
            let author = item["著者"] as! String
            let price = item["価格"] as! Int
            let kind = item["種類"] as! String
            let publishDate = item["発売日"] as! NSDate
            
            return Book(title: title, author: author, price: price, kind: Book.Kind(kind), publishDate: publishDate)
        }
        
        self.books = list.map(toBook)
    }

    @IBAction func sortSelectorSegmentedControlValueChanged(sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex {
            
        case 1:
            self.booksSorter = { $0.sortByTitle() }
            
        case 2:
            self.booksSorter = { $0.sortByPrice() }
            
        case 3:
            self.booksSorter = { $0.sortByPublishDate() }
            
        default:
            self.booksSorter = nil
        }
        
        self.booksTableView.reloadData()
    }
}

extension ViewController : UITableViewDataSource {
        
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     
        return self.sortedBooks.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("BookCell") as! BookTableViewCell
        
        cell.book = self.sortedBooks[indexPath.row]
        
        return cell
    }
}

extension ViewController : UITableViewDelegate {
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {

        self.totalPriceLabel.text = "\(self.selectedBooksPrice)"
    }
    
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        
        self.totalPriceLabel.text = "\(self.selectedBooksPrice)"
    }
}

