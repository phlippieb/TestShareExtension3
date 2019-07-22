//
//  RealmStorage.swift
//  TestShareExtension3
//
//  Created by Phlippie Bosman on 2019/07/22.
//  Copyright © 2019 Phlippie Bosman. All rights reserved.
//

import Foundation
import RealmSwift

final class RealmStorage {
    
}

final class RealmNote: Object {
    @objc dynamic var text: String = ""
}

extension RealmStorage: StorageProtocol {
    func store(note: Note) {
        let realm = try! Realm()
        let realmNote = RealmNote()
        realmNote.text = note.text
        realm.beginWrite()
        realm.add(realmNote)
        try! realm.commitWrite()
    }
    
    func fetch() -> [Note] {
        let realm = try! Realm()
        let realmNotes = realm.objects(RealmNote.self)
        let notes = realmNotes.map { Note(text: $0.text) }
        return Array(notes)
    }
}
