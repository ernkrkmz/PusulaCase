//
//  Globals.swift
//  BuggyApp
//
//  Created by Eren Korkmaz on 2.09.2025.
//


final class Globals {
    static let shared = Globals()
    
    private init() {}
    
    var userId: Int = 1 // test etmek için user id yi buradan değiştirebiliriz
    var lastId: Int?
    
    
    // random(in: 1000...9999) kullanmak yerine bu şekilde id ataması yaptım
    func setLastId(_ lastId: Int) {
        self.lastId = lastId
    }
    
    func incrementLastId() {
        if let lastId = lastId {
            self.lastId = lastId + 1
        }else {
            lastId = 0
        }
    }
}
