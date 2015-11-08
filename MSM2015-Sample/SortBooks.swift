import Foundation

extension CollectionType where Generator.Element == Book {
    
    func sortByTitle() -> [Book] {
        
        return self.sort { $0.title < $1.title }
    }
    
    func sortByPrice() -> [Book] {
        
        return self.sort { $0.price < $1.price }
    }
    
    func sortByPublishDate() -> [Book] {
        
        return self.sort { $0.publishDate
            .compare($1.publishDate) == .OrderedAscending }
    }
}
