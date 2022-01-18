//
//  NovelReaderWidget.swift
//  NovelReaderWidget
//
//  Created by FanRende on 2022/1/18.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), novel: Book())
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), novel: Book())
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        let recommendList = getRecommendList()
        for offset in 0 ..< recommendList.count {
            let entryDate = Calendar.current.date(byAdding: .second, value: offset * 10, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, novel: recommendList[offset])
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
    
    func getRecommendList() -> [Book] {
        let decoder = JSONDecoder()
        var result = [Book]()

        if let url = URL(string: "192.168.100.187:5000/getRecommendList") {
            do {
                let data = try Data(contentsOf: url)
                result = try decoder.decode([Book].self, from: data)
                return result
            } catch {
                print("ERROR::getRecommendList::\(error)")
            }
        }
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let novel: Book
}

struct NovelReaderWidgetEntryView : View {
    var entry: Provider.Entry

    var body: some View {
//        Text(entry.novel.name)
        Text(entry.date, style: .time)
    }
}

@main
struct NovelReaderWidget: Widget {
    let kind: String = "NovelReaderWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            NovelReaderWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("Novel Reader Widget")
        .description("推薦較高評價或近期更新的小說")
    }
}

struct NovelReaderWidget_Previews: PreviewProvider {
    static var previews: some View {
        NovelReaderWidgetEntryView(entry: SimpleEntry(date: Date()))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
