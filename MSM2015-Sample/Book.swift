//
//  Book.swift
//  MSM2015-Sample
//
//  Created by Tomohiro Kumagai on H27/11/03.
//  Copyright © 平成27年 EasyStyle G.K. All rights reserved.
//

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
    var publish: NSDate
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
