//
//  WebNovelFetcher.swift
//  NovelReader
//
//  Created by FanRende on 2022/1/5.
//

import SwiftUI
import CoreData

class WebNovelFetcher: ObservableObject {
    @Published var webList = [String]()
    @Published var classList = [String: [Class]]()
    @Published var novelList = [Class: [String: Novel]]()
    @Published var flattenNovelList = [String: Novel]()
    @Published var searchList = [String: [String: Novel]]()
    @Published var fetchFailed = Bool(false)
    @Published var isSearching1 = [String: Bool]()
    @Published var isSearching2 = [String: Bool]()
    var flattenClassList = [Class]()
    
    let realURL = "http://192.168.100.187:5000"
    let localTestURL = "http://localhost:8080"

    enum URLString: String {
        case getWebList          = "/getWebList"
        case getClassList        = "/getClassList"
        case getBookList         = "/getBookList"
        case getBook             = "/getBook"
        case getChapterList      = "/getChapterList"
        case getChapterContent   = "/getChapterContent"
        case setRatingAndCommant = "/setRatingAndCommant"
        case searchBook1         = "/searchBook1"
        case searchBook2         = "/searchBook2"
    }

    let encoder = JSONEncoder()
    let decoder = JSONDecoder()
    
    func getWebList() {
//        if let url = URL(string: realURL + URLString.getWebList.rawValue) {
//            var request = URLRequest(url: url)
//            request.httpMethod = "GET"
//
//            URLSession.shared.dataTask(with: request) { (data, response, error) in
        if let urlString = (localTestURL + URLString.getWebList.rawValue).addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
           let url = URL(string: urlString) {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                guard error == nil else {
                    DispatchQueue.main.async {
                        self.fetchFailed = true
                    }
                    return
                }
                if let data = data {
                    do {
                        let content = try self.decoder.decode([String].self, from: data)
                        DispatchQueue.main.async {
                            self.webList = content
                            self.classList = Dictionary(uniqueKeysWithValues: content.map {($0, [])})
                            self.isSearching1 = Dictionary(uniqueKeysWithValues: content.map {($0, false)})
                            self.isSearching2 = Dictionary(uniqueKeysWithValues: content.map {($0, false)})
                        }
                    } catch {
                        print("ERROR::getWebList::\(error)")
                    }
                }
            }.resume()
        }
    }
    
    func makeFlattenClassList(web: String) {
        guard self.classList[web] != nil else {
            return
        }

        func f(_ class_: Class) {
            if class_.child.count > 0 {
                class_.child.forEach { class_ in
                    f(class_)
                }
            }
            else {
                self.flattenClassList.append(class_)
            }
        }
        
        self.flattenClassList.removeAll()

        self.classList[web]!.forEach { class_ in
            f(class_)
        }
    }
    
    func getClassList(web: String) {
//        if let url = URL(string: realURL + URLString.getClassList.rawValue) {
//            var request = URLRequest(url: url)
//            request.httpMethod = "POST"
//            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//            let params = web
//            request.httpBody = try! self.encoder.encode(params)
//
//            URLSession.shared.dataTask(with: request) { (data, response, error) in
        if let urlString = (localTestURL + URLString.getClassList.rawValue).addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
           let url = URL(string: urlString) {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                guard error == nil else {
                    DispatchQueue.main.async {
                        self.fetchFailed = true
                    }
                    return
                }
                if let data = data {
                    do {
                        let content = try self.decoder.decode([Class].self, from: data)
                        DispatchQueue.main.async {
                            self.classList[web] = content
                            self.makeFlattenClassList(web: web)
                            let newList = Dictionary(uniqueKeysWithValues: self.flattenClassList.map {($0, [String: Novel]())})
                            self.novelList.merge(newList) { this, other in
                                return this
                            }
                        }
                    } catch {
                        print("ERROR::getClassList::\(error)")
                    }
                }
            }.resume()
        }
    }
    
    func getBookList(web: String, class_: Class) {
//        if let url = URL(string: realURL + URLString.getBookList.rawValue) {
//            var request = URLRequest(url: url)
//            request.httpMethod = "POST"
//            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//            let params: [String: Any] = [
//                "web": web,
//                "classId": class_.order
//            ]
//            request.httpBody = try! JSONSerialization.data(withJSONObject: params)
//
//            URLSession.shared.dataTask(with: request) { (data, response, error) in
        if let urlString = (localTestURL + URLString.getBookList.rawValue).addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
           let url = URL(string: urlString) {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                guard error == nil else {
                    DispatchQueue.main.async {
                        self.fetchFailed = true
                    }
                    return
                }
                if let data = data {
                    do {
                        let content = try self.decoder.decode([Web_Class_Book_Rating_Commant].self, from: data)
                        DispatchQueue.main.async {
//                            self.novelList[class_] = Dictionary(uniqueKeysWithValues: content.map {
//                                let novel = Novel(web: web, class_: class_, book: $0.book, rating: $0.rating, commants: $0.commant)
//                                return (novel.id, novel)
//                            })
                            self.flattenClassList.forEach { class_ in
                                self.novelList[class_] = Dictionary(uniqueKeysWithValues: content.map {
                                    let novel = Novel(web: web, class_: class_, book: $0.book, rating: $0.rating, commants: $0.commant)
                                    return (novel.id, novel)
                                })
                            }
//                            self.flattenNovelList.merge(self.novelList[class_]!) { this, other in
//                                return this
//                            }
                            self.flattenNovelList = Dictionary(uniqueKeysWithValues: content.map {
                                let novel = Novel(web: web, class_: class_, book: $0.book, rating: $0.rating, commants: $0.commant)
                                return (novel.id, novel)
                            })
                        }
                    } catch {
                        print("ERROR::getBookList::\(error)")
                    }
                }
            }.resume()
        }
    }
    
    func getBook(id: String, readTime: Date?, keep: Bool = false) {
        if self.flattenNovelList.isEmpty {
            self.getWebList()
            self.getClassList(web: "")
            self.getBookList(web: "", class_: Class())
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            if !self.flattenNovelList.isEmpty {
                self.flattenNovelList[id]!.keep = keep
            }
        }
//        if let url = URL(string: realURL + URLString.getBook.rawValue) {
//            var request = URLRequest(url: url)
//            request.httpMethod = "POST"
//            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//            let params = id
//            request.httpBody = try! self.encoder.encode(params)
//
//            URLSession.shared.dataTask(with: request) { (data, response, error) in
//                guard error == nil else {
//                    DispatchQueue.main.async {
//                        self.fetchFailed = true
//                    }
//                    return
//                }
//                if let data = data {
//                    do {
//                        let content = try self.decoder.decode(Web_Class_Book_Rating_Commant.self, from: data)
//                        DispatchQueue.main.async {
//                            let novel = Novel(readTime: readTime, web: content.web, class_: content.class_, book: content.book, rating: content.rating, commants: content.commant)
//                            self.flattenNovelList.merge([novel.id: novel]) { this, other in
//                                return this
//                            }
//                            if keep {
//                                self.flattenNovelList[novel.id]!.keep = true
//                            }
//                        }
//                    } catch {
//                        print("ERROR::getBook::\(error)")
//                    }
//                }
//            }.resume()
//        }
    }
    
    func getChapterList(novel: Novel) {
//        if let url = URL(string: realURL + URLString.getChapterList.rawValue) {
//            var request = URLRequest(url: url)
//            request.httpMethod = "POST"
//            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//            let params = novel.id
//            request.httpBody = try! self.encoder.encode(params)
//
//            URLSession.shared.dataTask(with: request) { (data, response, error) in
        if let urlString = (localTestURL + URLString.getChapterList.rawValue).addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
           let url = URL(string: urlString) {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                guard error == nil else {
                    DispatchQueue.main.async {
                        self.fetchFailed = true
                    }
                    return
                }
                if let data = data {
                    do {
                        let content = try self.decoder.decode(Chapter.self, from: data)
                        DispatchQueue.main.async {
                            if self.flattenNovelList[novel.id] != nil {
                                self.flattenNovelList[novel.id]!.chapter.count = content.count
                                self.flattenNovelList[novel.id]!.chapter.title = content.title
                                self.flattenNovelList[novel.id]!.chapter.link = content.link
                                self.flattenNovelList[novel.id]!.chapter.content = content.content
                            }
                        }
                    } catch {
                        print("ERROR::getChapterList::\(error)")
                    }
                }
            }.resume()
        }
    }
    
    func getChapterContent(novel: Novel) {
//        if let url = URL(string: realURL + URLString.getChapterContent.rawValue) {
//            var request = URLRequest(url: url)
//            request.httpMethod = "POST"
//            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//            let params = [
//                "web": novel.web,
//                "link": novel.chapter.link[novel.chapter.index],
//            ]
//            request.httpBody = try! self.encoder.encode(params)
//
//            URLSession.shared.dataTask(with: request) { (data, response, error) in
        if let urlString = (localTestURL + URLString.getChapterContent.rawValue).addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
           let url = URL(string: urlString) {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                guard error == nil else {
                    DispatchQueue.main.async {
                        self.fetchFailed = true
                    }
                    return
                }
                if let data = data {
                    do {
                        let content = try self.decoder.decode(String.self, from: data)
                        DispatchQueue.main.async {
                            if self.flattenNovelList[novel.id] != nil {
                                self.flattenNovelList[novel.id]!.chapter.content[novel.chapter.index] = content
                            }
                        }
                    } catch {
                        print("ERROR::getChapterContent::\(error)")
                    }
                }
            }.resume()
        }
    }
    
    func setRatingAndCommant(novel: Novel) {
//        if let url = URL(string: realURL + URLString.setRatingAndCommant.rawValue) {
//            var request = URLRequest(url: url)
//            request.httpMethod = "PUT"
//            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//            let params: [String: Any] = [
//                "book": ["web": novel.web, "name": novel.book.name, "author": novel.book.author],
//                "rating": ["amount": novel.rating.amount, "number": novel.rating.number],
//                "commant": novel.commants.map { ["rating": $0.rating, "content": $0.content] },
//            ]
//            request.httpBody = try! JSONSerialization.data(withJSONObject: params)
//
//            URLSession.shared.dataTask(with: request) { (data, response, error) in
//                guard error == nil else {
//                    DispatchQueue.main.async {
//                        self.fetchFailed = true
//                    }
//                    return
//                }
//            }.resume()
//        }
    }
    
    func searchBook(web: String, text: String) {
        if self.flattenNovelList.isEmpty {
            self.getWebList()
            self.getClassList(web: "")
            self.getBookList(web: "", class_: Class())
        }
        self.searchList["筆趣閣"] = Dictionary(self.flattenNovelList.map{($0.key, $0.value)}.prefix(200), uniquingKeysWith: { (first, _) in first })
        self.searchList["69書吧"] = Dictionary(self.flattenNovelList.map{($0.key, $0.value)}.suffix(200), uniquingKeysWith: { (first, _) in first })

//        self.isSearching1[web] = true
//        if let url = URL(string: realURL + URLString.searchBook1.rawValue) {
//            var request = URLRequest(url: url)
//            request.httpMethod = "POST"
//            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//            let params = [
//                "web": web,
//                "searchText": text,
//            ]
//            request.httpBody = try! self.encoder.encode(params)
//
//            URLSession.shared.dataTask(with: request) { (data, response, error) in
//                guard error == nil else {
//                    DispatchQueue.main.async {
//                        self.fetchFailed = true
//                    }
//                    return
//                }
//                if let data = data {
//                    do {
//                        let content = try self.decoder.decode([Web_Class_Book_Rating_Commant].self, from: data)
//                        DispatchQueue.main.async {
//                            self.searchList[web] = Dictionary(uniqueKeysWithValues: content.map {
//                                let novel = Novel(web: web, class_: $0.class_, book: $0.book, rating: $0.rating, commants: $0.commant)
//                                return (novel.id, novel)
//                            })
//                            self.flattenNovelList.merge(self.searchList[web]!) { this, other in
//                                var novel = this
//                                novel.web = novel.web.isEmpty ? other.web : novel.web
//                                return this
//                            }
//                            self.isSearching1[web] = false
//                            self.searchBook2(web: web, text: text)
//                        }
//                    } catch {
//                        print("ERROR::searchBook1::\(error)")
//                    }
//                }
//            }.resume()
//        }
    }
    
    func searchBook2(web: String, text: String) {
//        self.isSearching2[web] = true
//        if let url = URL(string: realURL + URLString.searchBook2.rawValue) {
//            var request = URLRequest(url: url)
//            request.httpMethod = "POST"
//            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//            let params = [
//                "web": web,
//                "searchText": text,
//            ]
//            request.httpBody = try! self.encoder.encode(params)
//
//            let sessionConfig = URLSessionConfiguration.default
//            sessionConfig.timeoutIntervalForRequest = 180.0
//            sessionConfig.timeoutIntervalForResource = 180.0
//
//            URLSession(configuration: sessionConfig).dataTask(with: request) { (data, response, error) in
//                guard error == nil else {
//                    DispatchQueue.main.async {
//                        self.fetchFailed = true
//                    }
//                    return
//                }
//                if let data = data, self.searchList[web] != nil {
//                    do {
//                        let content = try self.decoder.decode([Web_Class_Book_Rating_Commant].self, from: data)
//                        DispatchQueue.main.async {
//                            self.searchList[web] = Dictionary(uniqueKeysWithValues: content.map {
//                                let novel = Novel(web: web, class_: $0.class_, book: $0.book, rating: $0.rating, commants: $0.commant)
//                                return (novel.id, novel)
//                            })
//                            self.flattenNovelList.merge(self.searchList[web]!) { this, other in
//                                var novel = this
//                                novel.web = novel.web.isEmpty ? other.web : novel.web
//                                return this
//                            }
//                            self.isSearching2[web] = false
//                        }
//                    } catch {
//                        print("ERROR::searchBook2::\(error)")
//                    }
//                }
//            }.resume()
//        }
    }
}
