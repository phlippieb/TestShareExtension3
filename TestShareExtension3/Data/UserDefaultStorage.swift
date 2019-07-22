//
//  UserDefaultStorage.swift
//  TestShareExtension3
//
//  Created by Phlippie Bosman on 2019/07/22.
//  Copyright © 2019 Phlippie Bosman. All rights reserved.
//

import Foundation

final class UserDefaultStorage {
    private lazy var userDefaults = UserDefaults.standard
    private lazy var notesKey = "Notes"
    private lazy var encoder = JSONEncoder()
    private lazy var decoder = JSONDecoder()
}

extension UserDefaultStorage: StorageProtocol {
    func store(note: Note) {
        var currentNotes = self.fetch()
        currentNotes.append(note)
        let data = try! self.encoder.encode(currentNotes)
        self.userDefaults.set(data, forKey: self.notesKey)
    }
    
    func fetch() -> [Note] {
        guard let value = self.userDefaults.value(forKey: self.notesKey),
        let data = value as? Data,
        let decoded = try? self.decoder.decode(Array<Note>.self, from: data)
            else { return [] }
        
        return decoded
    }
}
