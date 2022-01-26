//
//  NovelReaderApp.swift
//  NovelReader
//
//  Created by FanRende on 2022/1/5.
//

import SwiftUI
import Swifter

@main
struct NovelReaderApp: App {
    let persistenceController = PersistenceController.shared
    
    let server: HttpServer = {
        let server = HttpServer()
        server["/getWebList"] = { _ in
                .ok(.data(NSDataAsset(name: "getWebList")!.data, contentType: "application/json"))
        }
        server["/getClassList"] = { _ in
                .ok(.data(NSDataAsset(name: "getClassList")!.data, contentType: "application/json"))
        }
        server["/getBookList"] = { _ in
                .ok(.data(NSDataAsset(name: "getBookList")!.data, contentType: "application/json"))
        }
        server["/getBook"] = { _ in
                .ok(.data(NSDataAsset(name: "getBook")!.data, contentType: "application/json"))
        }
        server["/getChapterList"] = { _ in
                .ok(.data(NSDataAsset(name: "getChapterList")!.data, contentType: "application/json"))
        }
        server["/getChapterContent"] = { _ in
                .ok(.data(NSDataAsset(name: "getChapterContent")!.data, contentType: "application/json"))
        }
        try? server.start()
        return server
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
