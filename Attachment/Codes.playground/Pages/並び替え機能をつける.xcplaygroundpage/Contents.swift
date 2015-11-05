//: [Previous](@previous)
//: # 並び替え機能をつける
//:
//: では、これに並び替えの機能をつけてみましょう。タイトル名、値段、発売日で並び替えられるようにしてみます。そのために、並び替えの処理を書くわけですけど、今回は Book を扱う配列が「並び替え」という振る舞いをできるようにしてみます。

import UIKit

//: ## Book 配列に並び替えの機能をつける
//:
//: プロトコル拡張を使って Book 配列に並び替えの機能を搭載します。

//: ### SortBooks.swift

extension CollectionType where Generator.Element == Book {
    
    func sortByTitle() -> [Book] {
        
        return self.sort { $0.title < $1.title }
    }
    
    func sortByPrice() -> [Book] {
        
        return self.sort { $0.price < $1.price }
    }
    
    func sortByPublish() -> [Book] {
        
        return self.sort { $0.publish.compare($1.publish) == .OrderedAscending }
    }
}

//: ### ViewController

//: ソート方法を保存するプロパティを追加します。

var booksSorter: ([Book]) -> [Book]

//: ただ、ソートしない場合も考えられるので、オプショナルで表現します。

var booksSorter: (([Book]) -> [Book])?

//: これだと読みにくいので、タイプエイリアスを使うと分かりやすくなります。

typealias BooksSorter = ([Book]) -> [Book]

var booksSorter:BooksSorter?


//: セグメントコントロールが選ばれたときに、ソート方法を記録するクロージャー変数に適切な値を設定します。このとき、設定しただけでは更新されないので、テーブルビューを再更新するようにします。

@IBAction func sortSelectorSegmentedControlValueChanged(sender:UISegmentedControl) {
    
    switch sender.selectedSegmentIndex {
        
    case 1:
        self.booksSorter = { $0.sortByTitle() }
        
    case 2:
        self.booksSorter = { $0.sortByPrice() }
        
    case 3:
        self.booksSorter = { $0.sortByPublish() }
        
    default:
        self.booksSorter = nil
    }
    
    self.booksTableView.reloadData()
}

//: このままだと、テーブルに表示する情報はソートをしていないものが常に使われるので、ソート状況を反映した本情報を取得できるプロパティを実装しておきます。

var filteredBooks:[Book] {

    if let filter = self.booksFilter {
        
        return filter(self.books)
    }
    else {
        
        return self.books
    }
}

//: このプロパティを使って、データソースをやりくりしてあげれば、ソート情報が反映された本のリストを表示できます。

func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
    return self.filteredBooks.count
}

func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCellWithIdentifier("BookCell") as! BookTableViewCell
    
    cell.book = self.filteredBooks[indexPath.row]
    
    return cell
}

//: [Next](@next)
