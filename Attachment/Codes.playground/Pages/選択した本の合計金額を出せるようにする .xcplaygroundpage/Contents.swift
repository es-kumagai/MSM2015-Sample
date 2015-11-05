//: [Previous](@previous)
//: # 選択した本の合計金額を出せるようにする
//:
//:リストの中からいくつか本を選択して、その合計金額を出せる機能を載せてみましょう。

import UIKit

//: ## 選択済みの本の合計金額を取得するプロパティを作成する
//:
//: 現在選択中の本の合計金額を取得するプロパティを計算型プロパティで作ります。テーブル上の選択済み行を indexPathsForSelectedRows で取得して、選択済みのセルの金額を計算します。このとき一括処理を使って、インデックスから本の情報金額を取得、それを合計する、という操作を行います。

//: ### ViewController

var selectedBooksPrice:Int {
    
    guard let indexPaths = self.booksTableView.indexPathsForSelectedRows else {
        
        return 0
    }
    
    let books = indexPaths.map { $0.row } .map { self.filteredBooks[$0] }
    
    return books.reduce(0) { $0 + $1.price }
}

//: ### ViewController : UITableViewDelegate

//: そして、選択状況が変わったタイミングで、合計金額のプロパティから値を取得して、合計金額のラベルを更新します。選択状況が変わるタイミングは、新たに選択したときと、既存の選択を解除したときとがあります。

func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    
    self.totalPriceLabel.text = "\(self.selectedBooksPrice)"
}

func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
    
    self.totalPriceLabel.text = "\(self.selectedBooksPrice)"
}

//: [Next](@next)
