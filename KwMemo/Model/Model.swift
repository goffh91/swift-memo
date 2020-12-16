//
//  Model.swift
//  KwMemo
//
//  Created by KyunWu on 2020/12/15.
//

import Foundation

class Memo {
    var content: String
    var creatd_at: Date
    
    init (content: String) {
        self.content = content
        creatd_at = Date()
    }
    
    static var dummyMemoList = [
        Memo(content: "Java"),
        Memo(content: "PHP"),
    ]
}
