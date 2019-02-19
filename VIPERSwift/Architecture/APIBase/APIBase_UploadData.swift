//
//  APIBase_UploadData.swift
//  VIPERSwift
//
//  Created by Le Tuan on 18/2/19.
//  Copyright © 2019 Le Tuan. All rights reserved.
//

import Foundation

import Foundation

class APIBaseUploadData {
    
    var fileURL: URL?
    var data: Data?
    var name = ""
    var fileName = ""
    var mimeType = ""
    
    init(fileURL: URL, name: String, fileName: String, mimeType: String) {
        self.fileURL = fileURL
        initWith(name: name, fileName: fileName, mimeType: mimeType)
    }
    
    init(data: Data, name: String, fileName: String, mimeType: String) {
        self.data = data
        initWith(name: name, fileName: fileName, mimeType: mimeType)
    }
    
    fileprivate func initWith(name: String, fileName: String, mimeType: String) {
        self.name = name
        self.fileName = fileName
        self.mimeType = mimeType
    }
}
