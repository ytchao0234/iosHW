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
            let entryDate = Calendar.current.date(byAdding: .second, value: offset * 3, to: currentDate)!
            var uiImage: UIImage? = nil
            if let url = URL(string: recommendList[offset].imageLink) {
                if let data = try? Data(contentsOf: url) {
                    uiImage = UIImage(data: data)
                }
            }
            let entry = SimpleEntry(date: entryDate, novel: recommendList[offset], uiImage: uiImage)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
    
    func getRecommendList() -> [Book] {
        let decoder = JSONDecoder()
        var result = [Book]()

        if let url = URL(string: "http://192.168.100.187:5000/getRecommendList") {
            do {
                let data = try Data(contentsOf: url)
                result = try decoder.decode([Book].self, from: data)
            } catch {
                print("ERROR::getRecommendList::\(error)")
            }
        }

        return result
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let novel: Book
    let uiImage: UIImage?
    var url: URL {
        URL(string: "\(novel.id)")!
    }
    
    init(date: Date, novel: Book, uiImage: UIImage? = UIImage(data: try! Data(contentsOf: URL(string: "https://cdn.shucdn.com/files/article/image/39/39782/39782s.jpg")!))) {
        self.date = date
        self.novel = novel
        self.uiImage = uiImage
    }
}

struct NovelReaderWidgetEntryView : View {
    var entry: Provider.Entry
    @Environment(\.widgetFamily) var widgetFamily

    var body: some View {
        switch widgetFamily {
        case .systemSmall:
            VStack {
                entry.uiImage.map {
                    Image(uiImage: $0)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 65, height: 65)
                }
                Text(entry.novel.name)
                    .font(.caption)
                    .lineLimit(2)
                Text("-- \(entry.novel.author) --")
                    .font(.caption2)
                    .lineLimit(1)
            }
            .widgetURL(entry.url)
        case .systemMedium:
            HStack {
                VStack {
                    entry.uiImage.map {
                        Image(uiImage: $0)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 65, height: 65)
                    }
                    Text(entry.novel.name)
                        .font(.caption)
                        .lineLimit(2)
                    Text("-- \(entry.novel.author) --")
                        .font(.caption2)
                        .lineLimit(1)
                }
                .frame(width: 100)
                Divider()
                Spacer()
                Text(entry.novel.intro.replacingOccurrences(of: "\n", with: "\t"))
                    .font(.caption2)
                    .padding(5)
                Spacer()
            }
            .padding(5)
            .widgetURL(entry.url)
        case .systemLarge:
            HStack {
                VStack {
                    entry.uiImage.map {
                        Image(uiImage: $0)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 120, height: 120)
                    }
                    Text(entry.novel.name)
                        .font(.caption)
                        .lineLimit(2)
                    Text("-- \(entry.novel.author) --")
                        .font(.caption2)
                        .lineLimit(1)
                    Text("-- \(entry.novel.state) --")
                        .font(.caption2)
                        .lineLimit(1)
                }
                .frame(width: 140)
                Divider()
                Spacer()
                Text(entry.novel.intro)
                    .font(.caption2)
                    .padding(5)
                Spacer()
            }
            .widgetURL(entry.url)
        default:
            Text(entry.novel.name)
        }
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
        NovelReaderWidgetEntryView(entry: SimpleEntry(date: Date(), novel: Book()))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
