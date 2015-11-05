//: [Previous](@previous)

//: [Previous](@previous)
//: # 書籍の種類を適切に表示する
//:
//: セルに表示される PaperBook とか DigitalBook とかが分かりにくいので調整しておきましょうか。これは BookTableViewCell で book.kind をそのまま文字列に埋め込んだ影響でこう表示されてるのですけれど、この振る舞いを調整してみます。

import UIKit

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
