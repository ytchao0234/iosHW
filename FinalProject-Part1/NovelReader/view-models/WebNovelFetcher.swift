//
//  WebNovelFetcher.swift
//  NovelReader
//
//  Created by FanRende on 2022/1/5.
//

import SwiftUI

class WebNovelFetcher: ObservableObject {
    @Published var webList = [String]()
    @Published var classList = [String: [Class]]()
    @Published var novelList = [Class: [Novel]]()
    @Published var fetchFailed = Bool(false)
    
    enum URLString: String {
        case getWebList          = "http://192.168.100.187:5000/getWebList"
        case getClassList        = "http://192.168.100.187:5000/getClassList"
        case getBookList         = "http://192.168.100.187:5000/getBookList"
        case getChapterList      = "http://192.168.100.187:5000/getChapterList"
        case getChapterContent   = "http://192.168.100.187:5000/getChapterContent"
        case getRatingAndCommant = "http://192.168.100.187:5000/getRatingAndCommant"
        case setRatingAndCommant = "http://192.168.100.187:5000/setRatingAndCommant"
    }
    
    let encoder = JSONEncoder()
    let decoder = JSONDecoder()
    
    func getWebList() {
        if let url = URL(string: URLString.getWebList.rawValue) {
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            
            URLSession.shared.dataTask(with: request) { (data, response, error) in
                guard error == nil else {
                    self.fetchFailed = true
                    return
                }
                if let data = data {
                    do {
                        let content = try self.decoder.decode([String].self, from: data)
                        DispatchQueue.main.async {
                            self.webList = content
                            self.classList = Dictionary(uniqueKeysWithValues: content.map {($0, [])})
                        }
                    } catch {
                        print("ERROR::getWebList::\(error)")
                    }
                }
            }.resume()
        }
    }
    
    func getClassList(web: String) {
        if let url = URL(string: URLString.getClassList.rawValue) {
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            let params = web
            request.httpBody = try! self.encoder.encode(params)
            
            URLSession.shared.dataTask(with: request) { (data, response, error) in
                guard error == nil else {
                    self.fetchFailed = true
                    return
                }
                if let data = data {
                    do {
                        let content = try self.decoder.decode([Class].self, from: data)
                        DispatchQueue.main.async {
                            self.classList[web] = content
                            self.novelList = Dictionary(uniqueKeysWithValues: content.map {($0, [])})
                            print("ok")
                        }
                    } catch {
                        print("ERROR::getClassList::\(error)")
                    }
                }
            }.resume()
        }
    }
    
    func getBookList(web: String, class_: Class) {
        if let url = URL(string: URLString.getBookList.rawValue) {
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            let params = class_.id
            request.httpBody = try! self.encoder.encode(params)
            
            URLSession.shared.dataTask(with: request) { (data, response, error) in
                guard error == nil else {
                    self.fetchFailed = true
                    return
                }
                if let data = data {
                    do {
                        let content = try self.decoder.decode([Book].self, from: data)
                        DispatchQueue.main.async {
                            self.novelList[class_] = content.map { Novel(web: web, class_: class_, book: $0) }
                            print("ok")
                        }
                    } catch {
                        print("ERROR::getBookList::\(error)")
                    }
                }
            }.resume()
        }
    }
    
    func getChapterList(class_: Class, novel: Novel) {
        if let url = URL(string: URLString.getChapterList.rawValue),
           self.novelList[class_] != nil {

            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            let params = novel.id
            request.httpBody = try! self.encoder.encode(params)
            
            URLSession.shared.dataTask(with: request) { (data, response, error) in
                guard error == nil else {
                    self.fetchFailed = true
                    return
                }
                if let data = data {
                    do {
                        let content = try self.decoder.decode(Chapter.self, from: data)
                        DispatchQueue.main.async {
                            if let index = self.novelList[class_]!.firstIndex(where: {$0.id == novel.id}) {
                                self.novelList[class_]![index].chapter = content
                                print("ok")
                            }
                        }
                    } catch {
                        print("ERROR::getChapterList::\(error)")
                    }
                }
            }.resume()
        }
    }
    
    func getChapterContent(web: String, class_: Class, novel: Novel, chapterIndex: Int, chapterLink: String) {
        if let url = URL(string: URLString.getChapterContent.rawValue),
           self.novelList[class_] != nil {

            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            let params = [
                "web": web,
                "link": chapterLink,
            ]
            request.httpBody = try! self.encoder.encode(params)
            
            URLSession.shared.dataTask(with: request) { (data, response, error) in
                guard error == nil else {
                    self.fetchFailed = true
                    return
                }
                if let data = data {
                    do {
                        let content = try self.decoder.decode(String.self, from: data)
                        DispatchQueue.main.async {
                            if let index = self.novelList[class_]!.firstIndex(where: {$0.id == novel.id}) {
                                self.novelList[class_]![index].chapter.content[chapterIndex] = content
                                print(self.novelList[class_]![index].chapter.content)
                            }
                        }
                    } catch {
                        print("ERROR::getChapterContent::\(error)")
                    }
                }
            }.resume()
        }
    }
}
