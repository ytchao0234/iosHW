//
//  CommantReadView.swift
//  NovelReader
//
//  Created by FanRende on 2021/12/26.
//

import SwiftUI
import Parma
import Kingfisher

struct CommantReadView: View {
    @Binding var text: String

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            Parma(text, render: MarkdownRender())
                .padding(.horizontal, 24)
        }
        .frame(width: UIScreen.main.bounds.width, alignment: .leading)
    }
}

struct CommantReadView_Previews: PreviewProvider {
    static var previews: some View {
        CommantReadView(text: .constant("# H1\n## H2\n### H3\nplain text"))
    }
}

struct MarkdownRender: ParmaRenderable {
    func heading(level: HeadingLevel?, textView: Text) -> Text {
        switch level {
        case .one:
            return textView.font(.system(.largeTitle, design: .serif)).bold()
        case .two:
            return textView.font(.system(.title, design: .serif)).bold()
        case .three:
            return textView.font(.system(.title2)).bold()
        default:
            return textView.font(.system(.title3)).bold()
        }
    }
    
    func headingBlock(level: HeadingLevel?, view: AnyView) -> AnyView {
        switch level {
        case .one, .two:
            return AnyView(
                VStack(alignment: .leading, spacing: 2) {
                    view
                        .padding(.top, 4)
                    Rectangle()
                        .foregroundColor(.pink)
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 1, alignment: .center)
                        .padding(.bottom, 8)
                }
            )
        default:
            return AnyView(view.padding(.bottom, 4))
        }
    }
    
    func paragraph(text: String) -> Text {
        Text(text)
    }
    
    func paragraphBlock(view: AnyView) -> AnyView {
        AnyView(view.padding(.bottom, 4))
    }
    
    func plainText(_ text: String) -> Text {
        Text(text)
    }
    
    func strong(textView: Text) -> Text {
        textView
    }

    func emphasis(textView: Text) -> Text {
        textView
    }

    func link(textView: Text, destination: String?) -> Text {
        textView
    }

    func code(_ text: String) -> Text {
        Text(text)
    }
    
    func listItem(view: AnyView) -> AnyView {
        let bullet = "•"
        return AnyView(
            HStack(alignment: .top, spacing: 8) {
                Text(bullet)
                view.fixedSize(horizontal: false, vertical: true)
            }
            .padding(.leading, 4)
        )
    }
    
    func imageView(with urlString: String, altTextView: AnyView?) -> AnyView {
        print(urlString)

        return AnyView(
            KFImage(URL(string: urlString))
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
                
        )
    }
}
