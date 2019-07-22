//
//  StorageProtocol.swift
//  TestShareExtension3
//
//  Created by Phlippie Bosman on 2019/07/22.
//  Copyright © 2019 Phlippie Bosman. All rights reserved.
//

protocol StorageProtocol {
    /// Persist the given note to storage.
    func store(note: Note)
    
    /// Retrieve and yield all stored notes.
    func fetch() -> [Note]
}
