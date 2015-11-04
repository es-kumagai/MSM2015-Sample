//
//  Book+Sort.swift
//  MSM2015-Sample
//
//  Created by Tomohiro Kumagai on H27/11/04.
//  Copyright © 平成27年 EasyStyle G.K. All rights reserved.
//

import Foundation

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
