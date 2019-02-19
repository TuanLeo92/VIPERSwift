//
//  NSObjectExtension.swift
//  VIPERSwift
//
//  Created by Le Tuan on 18/2/19.
//  Copyright © 2019 Le Tuan. All rights reserved.
//

import Foundation

extension NSObject {
    
    @objc var className: String {
        return String(describing: type(of: self))
    }
    
    @objc class var className: String {
        return String(describing: self)
    }
}
