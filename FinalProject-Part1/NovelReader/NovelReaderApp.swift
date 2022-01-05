//
//  NovelReaderApp.swift
//  NovelReader
//
//  Created by FanRende on 2022/1/5.
//

import SwiftUI

@main
struct NovelReaderApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
