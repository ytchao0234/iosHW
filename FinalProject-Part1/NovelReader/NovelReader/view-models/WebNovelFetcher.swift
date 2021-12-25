//
//  WebNovelFetcher.swift
//  NovelReader
//
//  Created by FanRende on 2021/12/25.
//

import SwiftUI

class WebNovelFetcher: ObservableObject {
    @Published var webList = [String]()
    @Published var classList = [String]()
    @Published var bookList = [[String: String]]()
    @Published var chapterList = [[String]]()
    let url_getWebList = String("http://192.168.100.187:5000/getWebList")
    let url_getClassList = String("http://192.168.100.187:5000/getClassList")
    let url_getBookList = String("http://192.168.100.187:5000/getBookList")
    let url_getChapterList = String("http://192.168.100.187:5000/getChapterList")
    let encoder = JSONEncoder()
    let decoder = JSONDecoder()
    
    func getWebList() {
        if let url = URL(string: self.url_getWebList) {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let data = data {
                    do {
                        let content = try self.decoder.decode([String].self, from: data)
                        
                        DispatchQueue.main.async {
                            self.webList = content
                        }
                    } catch {
                        print(error)
                    }
                }
            }
            .resume()
        }
    }
    
    func previewWebList() {
        self.webList = try! self.decoder.decode([String].self, from: NSDataAsset(name: "webList")!.data)
    }
    
    func getClassList(web: String = "筆趣閣") {
        if let url = URL(string: self.url_getClassList) {
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            let params = web
            request.httpBody = try! self.encoder.encode(params)
            
            URLSession.shared.dataTask(with: request) { (data, response, error) in
                if let data = data {
                    do {
                        let content = try self.decoder.decode([String].self, from: data)
                        
                        DispatchQueue.main.async {
                            self.classList = content
                            print(content)
                        }
                    } catch {
                        print(error)
                    }
                }
            }
            .resume()
        }
    }
    
    func previewClassList() {
        self.classList = try! self.decoder.decode([String].self, from: NSDataAsset(name: "classList")!.data)
    }
    
    func getBookList(web: String = "筆趣閣", class_: String = "首頁") {
        if let url = URL(string: self.url_getBookList) {
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            let params = [
                "web": web,
                "class": class_,
            ]
            request.httpBody = try! self.encoder.encode(params)
            
            URLSession.shared.dataTask(with: request) { (data, response, error) in
                if let data = data {
                    do {
                        let content = try self.decoder.decode([[String: String]].self, from: data)
                        
                        DispatchQueue.main.async {
                            self.bookList = content
                            print(content)
                        }
                    } catch {
                        print(error)
                    }
                }
            }
            .resume()
        }
    }
    
    func previewBookList() {
        self.bookList = try! self.decoder.decode([[String: String]].self, from: NSDataAsset(name: "bookList")!.data)
    }
    
    func getChapterList(web: String = "筆趣閣", class_: String = "首頁", bookId: Int = 53) {
        if let url = URL(string: self.url_getChapterList) {
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")

            let params: [String: Any] = [
                "web": web,
                "class": class_,
                "bookId": bookId
            ]
            request.httpBody = try! JSONSerialization.data(withJSONObject: params)

            URLSession.shared.dataTask(with: request) { (data, response, error) in
                if let data = data {
                    do {
                        let content = try self.decoder.decode([[String]].self, from: data)
                        
                        DispatchQueue.main.async {
                            self.chapterList = content
                        }
                    } catch {
                        print(error)
                    }
                }
            }
            .resume()
            
            print("start")
        }
    }
    
    func previewChapterList() {
        self.chapterList = try! self.decoder.decode([[String]].self, from: NSDataAsset(name: "chapterList")!.data)
        print(self.chapterList)
    }
}
