//
//  WebNovelFetcher.swift
//  NovelReader
//
//  Created by FanRende on 2021/12/25.
//

import SwiftUI

class WebNovelFetcher: ObservableObject {
    @Published var novelList = [String: [Class: [UUID: Novel]]]()
    @Published var chapterNumber = Int()
    @Published var fetchFailed = false

    let url_getWebList = String("http://192.168.100.187:5000/getWebList")
    let url_getClassList = String("http://192.168.100.187:5000/getClassList")
    let url_getBookList = String("http://192.168.100.187:5000/getBookList")
    let url_getChapterList = String("http://192.168.100.187:5000/getChapterList")
    let url_getChapterContent = String("http://192.168.100.187:5000/getChapterContent")
    let url_getCommant = String("http://192.168.100.187:5000/getCommant")
    let url_setCommant = String("http://192.168.100.187:5000/setCommant")
    let url_setRating = String("http://192.168.100.187:5000/setRating")
    let encoder = JSONEncoder()
    let decoder = JSONDecoder()
    
    func getWebList() {
        if let url = URL(string: self.url_getWebList) {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                guard error == nil else {
                    print(error!)
                    DispatchQueue.main.async {
                        self.fetchFailed = true
                    }
                    return
                }
                if let data = data {
                    do {
                        let content = try self.decoder.decode([String].self, from: data)
                        
                        DispatchQueue.main.async {
                            for web in content {
                                self.novelList[web] = [Class: [UUID: Novel]]()
                            }
                        }
                    } catch {
                        print(error)
                    }
                }
            }
            .resume()
        }
    }
    
    func getClassList(web: String = "筆趣閣") {
        if let url = URL(string: self.url_getClassList) {
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            let params = web
            request.httpBody = try! self.encoder.encode(params)
            
            URLSession.shared.dataTask(with: request) { (data, response, error) in
                guard error == nil else {
                    print(error!)
                    DispatchQueue.main.async {
                        self.fetchFailed = true
                    }
                    return
                }
                if let data = data {
                    do {
                        let content = try self.decoder.decode([[String]].self, from: data)

                        DispatchQueue.main.async {
                            for class_ in content {
                                self.novelList[web]![Class(id: Int(class_[0])!, name: class_[1])] = [UUID: Novel]()
                            }
                        }
                    } catch {
                        print(error)
                    }
                }
            }
            .resume()
        }
    }
    
    func getBookList(web: String = "筆趣閣", class_: Class = Class(id: 0, name:"首頁")) {
        if let url = URL(string: self.url_getBookList) {
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            let params = [
                "web": web,
                "class": class_.name,
            ]
            request.httpBody = try! self.encoder.encode(params)
            
            URLSession.shared.dataTask(with: request) { (data, response, error) in
                guard error == nil else {
                    print(error!)
                    DispatchQueue.main.async {
                        self.fetchFailed = true
                    }
                    return
                }
                if let data = data {
                    do {
                        let content = try self.decoder.decode([Book].self, from: data)
                        
                        DispatchQueue.main.async {
                            for book in content {
                                let novel = Novel(book: book)
                                self.novelList[web]![class_]![novel.id] = novel
                            }
                        }
                    } catch {
                        print(error)
                    }
                }
            }
            .resume()
        }
    }
    
    func getChapterList(web: String = "筆趣閣", class_: Class = Class(id: 0, name:"首頁"), bookId: UUID = UUID()) {
        if let url = URL(string: self.url_getChapterList) {
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")

            let params: [String: Any] = [
                "web": web,
                "class": class_.name,
                "bookId": "\(bookId)".lowercased()
            ]
            request.httpBody = try! JSONSerialization.data(withJSONObject: params)

            URLSession.shared.dataTask(with: request) { (data, response, error) in
                guard error == nil else {
                    print(error!)
                    DispatchQueue.main.async {
                        self.fetchFailed = true
                    }
                    return
                }
                if let data = data {
                    do {
                        var content = try self.decoder.decode([[String]].self, from: data)
                        
                        DispatchQueue.main.async {
                            content.insert([self.novelList[web]![class_]![bookId]!.book.book, ""], at: 0)

                            self.novelList[web]![class_]![bookId]!.chapter = Chapter(chapterList: content)
                        }
                    } catch {
                        print(error)
                    }
                }
            }
            .resume()
        }
    }
    
    func getChapterContent(web: String = "筆趣閣", class_: Class = Class(id: 0, name:"首頁"), bookId: UUID = UUID(), chapterLink: String = "https://novel101.com/novels/6a85a5e2-f911-422d-aff0-c0a663d953d0/chapters/2bzr") {
        if let url = URL(string: self.url_getChapterContent) {
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")

            let params: [String: Any] = [
                "web": web,
                "link": chapterLink
            ]
            request.httpBody = try! JSONSerialization.data(withJSONObject: params)

            URLSession.shared.dataTask(with: request) { (data, response, error) in
                guard error == nil else {
                    print(error!)
                    DispatchQueue.main.async {
                        self.fetchFailed = true
                    }
                    return
                }
                if let httpResponse = response as? HTTPURLResponse,
                   httpResponse.statusCode == 500 {
                    DispatchQueue.main.async {
                        self.novelList[web]![class_]![bookId]!.chapter.chapterContents[self.chapterNumber] = "找不到文章內容（500）"
                    }
                    return
                }
                if let data = data {
                    do {
                        let content = try self.decoder.decode(String.self, from: data)
                        
                        DispatchQueue.main.async {
                            self.novelList[web]![class_]![bookId]!.chapter.chapterContents[self.chapterNumber] = content
                        }
                    } catch {
                        print(error)
                    }
                }
            }
            .resume()
        }
    }
    
    func getCommant(web: String = "筆趣閣", class_: Class = Class(id: 0, name:"首頁"), bookId: UUID = UUID()) {
        if let url = URL(string: self.url_getCommant) {
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")

            let params = "\(bookId)".lowercased()
            request.httpBody = try! self.encoder.encode(params)

            URLSession.shared.dataTask(with: request) { (data, response, error) in
                guard error == nil else {
                    print(error!)
                    DispatchQueue.main.async {
                        self.fetchFailed = true
                    }
                    return
                }
                if let data = data {
                    do {
                        let content = try self.decoder.decode([[String]].self, from: data)
                        
                        DispatchQueue.main.async {
                            self.novelList[web]![class_]![bookId]!.commants = content
                        }
                    } catch {
                        print(error)
                    }
                }
            }
            .resume()
        }
    }
    
    func setCommant(bookId: UUID = UUID(), commants: [[String]] = [[String]]()) {
        if let url = URL(string: self.url_setCommant) {
            var request = URLRequest(url: url)
            request.httpMethod = "PUT"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")

            let params: [String: Any] = [
                "bookId": "\(bookId)".lowercased(),
                "commant": commants
            ]
            request.httpBody = try! JSONSerialization.data(withJSONObject: params)

            URLSession.shared.dataTask(with: request){ (data, response, error) in
                guard error == nil else {
                    print(error!)
                    DispatchQueue.main.async {
                        self.fetchFailed = true
                    }
                    return
                }
            }
            .resume()
        }
    }
    
    func setRating(bookId: UUID = UUID(), rating: [Double] = [Double]()) {
        if let url = URL(string: self.url_setRating) {
            var request = URLRequest(url: url)
            request.httpMethod = "PUT"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")

            let params: [String: Any] = [
                "bookId": "\(bookId)".lowercased(),
                "rating": rating
            ]
            request.httpBody = try! JSONSerialization.data(withJSONObject: params)

            URLSession.shared.dataTask(with: request){ (data, response, error) in
                guard error == nil else {
                    print(error!)
                    DispatchQueue.main.async {
                        self.fetchFailed = true
                    }
                    return
                }
            }
            .resume()
        }
    }
}
