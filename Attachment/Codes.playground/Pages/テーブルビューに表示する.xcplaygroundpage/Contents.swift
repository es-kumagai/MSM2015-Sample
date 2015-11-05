//: [Previous](@previous)

//: [Previous](@previous)
//: # テーブルビューに表示する
//:

import UIKit

//: ## BookTableViewCell
//:
//: 今回はあらかじめ、本の情報をテーブルに表示するのに使うセルを用意しておきました。クラスには 5 つのラベルが用意されていて、ここに情報を設定すると、画面上にその情報が反映されます。

//: ### Book を持てるようにし、設定されたらラベルに内容を反映する

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

//: ## UITableViewDataSource

//: ここまで出来たら、あとは UITableViewDataSource でセルの数とセルを返す機能を実装します。

extension ViewController : UITableViewDataSource, UITableViewDelegate {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.books.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("BookCell") as! BookTableViewCell
        
        cell.book = self.books[indexPath.row]
        
        return cell
    }
}

//: ## Book.Kind を CustomStringConvertible に対応させる
//:
//: 対応させると、意図した通りに文字列化されるようになります。これで Book.Kind にどういう文字列に変換できるかという振る舞いを持たせられたことになります。

//: ### Book.swift

extension Book.Kind : CustomStringConvertible {
    
    var description:String {
        
        switch self {
            
        case .PaperBook:
            return "単行本"
            
        case .DigitalBook:
            return "電子書籍"
        }
    }
}

//: [Next](@next)
