//: [Previous](@previous)
//: # データをブックに取り込む
//:

import UIKit

//: ## ViewController

//: ### 本を保存するプロパティを作る

var books:[Book] = []

//: ## ViewController.viewDidLoad
//:
//: 今回は ViewController の viewDidLoad で本の情報を取り込んで、プロパティに設定することにします。

//: ### プロパティリストから配列として読み込む。

let file = NSBundle.mainBundle().pathForResource("BookList", ofType: "plist")!
let list = NSArray(contentsOfFile: file)!

//: ### NSArray のままだと何でも入りすぎて Swift には使いにくいので、型をしっかり決めます。

let file = NSBundle.mainBundle().pathForResource("BookList", ofType: "plist")!
let list = NSArray(contentsOfFile: file) as! [ [String:AnyObject] ]

//: 読み込めたことを print(list) で確認しておきましょう。デバッグ実行すると、コンソールにそれっぽい情報が表示されることを確認できます。

//: ### Book 型に変換する関数を作る
//:
//: Swift は一括変換が得意なので、まずは本のデータひとつを Book に変換する機能をつくってしまいましょう。今回は何度も使うものでもないので、クロージャーで作っておきます。

let toBook = { (item: [String : AnyObject]) -> Book in
    
    let title = item["表題"] as! String
    let author = item["著者"] as! String
    let price = item["価格"] as! Int
    let kind = Book.Kind(item["種類"] as! String)
    let publish = item["発売日"] as! NSDate
    
    return Book(title: title, author: author, price: price, kind: kind, publish: publish)
}

//: ### リストを一括変換する
//:
//: ここまで出来たら、リストを一括変換します。map 関数を使うと一括変換ができます。

self.books = list.map(toBook)

//: このように『どうするか』を決めてから一気に組み立てるのが Swift の面白さと言えるように思います。ここまで出来たら、本当にちゃんと変換されているか print(self.books) してみてみましょう。


//: ### 書籍リストを読み込む

//: 今回はあらかじめ、本の情報をテーブルに表示するのに使うセルを用意しておきました。クラスには 5 つのラベルが用意されていて、ここに情報を設定すると、画面上にその情報が反映されます。

//: ### Book を持てるようにし、設定されたらラベルに内容を反映する


//: [Next](@next)
