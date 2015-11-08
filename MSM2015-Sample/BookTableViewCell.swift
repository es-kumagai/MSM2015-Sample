import UIKit

class BookTableViewCell: UITableViewCell {

    var book:Book? {
        
        didSet {
            
            if let book = self.book {
                
                self.titleLabel.text = book.title
                self.authorLabel.text = book.author
                self.priceLabel.text = "¥\(book.price)"
                self.kindLabel.text = "\(book.kind)"
                self.publishDateLabel.text = "\(book.publishDate)"
            }
            else {
                
                self.titleLabel.text = ""
                self.authorLabel.text = ""
                self.priceLabel.text = ""
                self.kindLabel.text = ""
                self.publishDateLabel.text = ""
            }
        }
    }
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var authorLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!
    @IBOutlet var kindLabel: UILabel!
    @IBOutlet var publishDateLabel: UILabel!
}
