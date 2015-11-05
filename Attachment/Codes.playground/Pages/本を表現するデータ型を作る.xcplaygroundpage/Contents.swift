//: [Previous](@previous)
//: # 本を表現するデータ型を作る
//:
//: まずは、本を扱うためのデータ型を作成しましょう。先ほど登録した本のデータを１冊ずつ管理するものを作ります。Swift では一般に、データ型は構造体で作成するので今回もそうします。

import UIKit

//: ## Book.swift

//: ### 構造体でデータ型を作る

struct Book {
    
    var title: String
    var author: String
    var price: Int
    var kind: String
    var publish: NSDate
}

//: ### 複数からひとつを選択するのは列挙型が適切
//:
//: 今回のデータでは、本の種類が『単行本』か『電子書籍』のどちらかしかないので、列挙型で表現します。そうすると後々、プログラムが複雑になった時に何かと楽になります。

struct Book {
    
    enum Kind {
        
        case PaperBook
        case DigitalBook
    }
    
    var title: String
    var author: String
    var price: Int
    var kind: Kind
    var publish: NSDate
}

//: ### 元データから変換する
//:
//: Book.Kind の元データは文字列です。Swift では型を揃えるのが原則なので、文字列を Book.Kind に変換できるようにします。Swift では、変換は、変換先に変換イニシャライザを持たせることが一般的です。

extension Book.Kind {
    
    init(_ value:String) {
        
        switch value {
            
        case "単行本":
            self = .PaperBook
            
        case "電子書籍":
            self = .DigitalBook
            
        default:
            fatalError()
        }
    }
}


//: [Next](@next)
