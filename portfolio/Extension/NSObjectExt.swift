//
//  NSObjectExt.swift
//  portfolio
//
//  Created by 永井涼 on 2020/12/16.
//

import Foundation

extension NSObject {
    class var className: String {
        return String(describing: self)
    }
    
    var className: String {
        return self.className
    }
}
