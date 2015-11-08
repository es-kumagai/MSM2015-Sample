import Foundation

struct Book {
    
    enum Kind {
        
        case PaperBook
        case DigitalBook
    }
    
    var title: String
    var author: String
    var price: Int
    var kind: Kind
    var publishDate: NSDate
}

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

extension Book.Kind : CustomStringConvertible {
    
    var description: String {
        
        switch self {
            
        case .PaperBook:
            return "単行本"
            
        case .DigitalBook:
            return "電子書籍"
        }
    }
}
