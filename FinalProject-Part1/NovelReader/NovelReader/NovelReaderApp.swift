//
//  NovelReaderApp.swift
//  NovelReader
//
//  Created by FanRende on 2021/12/25.
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
