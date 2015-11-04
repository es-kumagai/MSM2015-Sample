//
//  BookTableViewCell.swift
//  MSM2015-Sample
//
//  Created by Tomohiro Kumagai on H27/11/04.
//  Copyright © 平成27年 EasyStyle G.K. All rights reserved.
//

import UIKit

class BookTableViewCell: UITableViewCell {

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var authorLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!
    @IBOutlet var kindLabel: UILabel!
    @IBOutlet var publishLabel: UILabel!

    var book:Book? {
        
        didSet {
            
            if let book = self.book {

                self.titleLabel.text = book.title
                self.authorLabel.text = book.author
                self.priceLabel.text = "¥\(book.price)"
                self.kindLabel.text = "\(book.kind)"
                self.publishLabel.text = "\(book.publish)"
            }
            else {
                
                self.titleLabel.text = ""
                self.authorLabel.text = ""
                self.priceLabel.text = ""
                self.kindLabel.text = ""
                self.publishLabel.text = ""
            }
        }
    }
}
