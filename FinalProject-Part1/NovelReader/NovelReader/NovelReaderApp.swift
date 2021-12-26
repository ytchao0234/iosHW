//
//  NovelReaderApp.swift
//  NovelReader
//
//  Created by User08 on 2021/12/25.
//

import SwiftUI

@available(iOS 15.0, *)
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
