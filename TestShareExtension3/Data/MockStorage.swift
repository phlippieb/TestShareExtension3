//
//  MockStorage.swift
//  TestShareExtension3
//
//  Created by Phlippie Bosman on 2019/07/22.
//  Copyright © 2019 Phlippie Bosman. All rights reserved.
//

final class MockStorage {
    let notes = [
        Note(text: "This is a mock note")
    ]
}

extension MockStorage: StorageProtocol {
    func store(note: Note) {
        // Do nothing
    }
    
    func fetch() -> [Note] {
        return self.notes
    }
}
