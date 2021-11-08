//
//  StoryView.swift
//  AnotherEden
//
//  Created by User10 on 2021/11/4.
//

import SwiftUI

struct StoryView: View {
    @State private var selection: Story = Story.emptyStory
    
    var body: some View {
        ScrollView(.vertical) {
            Text("Another Eden 的所有劇情任務都沒有時間限制，而且都有非常精采而完整的故事內容，需要花比較多的時間觀看。完成劇情後，有些劇情中的角色還有可能直接加入隊伍，和你一起繼續冒險！")
                .font(.caption)
                .padding()
                .background(Color.secondary.opacity(0.2))
                .cornerRadius(10)
            LazyVStack(pinnedViews: [.sectionHeaders]) {
                Section(header:
                            Text("主線")
                                .padding(.vertical, 3)
                                .frame(minWidth:0, maxWidth: .infinity)
                                .background(Color.gray)
                                .cornerRadius(10)
                ) {
                    StoryBlock(selection: $selection, story: Story.defaultStory)
                        .padding(.bottom, 1)
                }
            }
            
            LazyVStack(pinnedViews: [.sectionHeaders]) {
                Section(header:
                            Text("外傳")
                                .padding(.vertical, 3)
                                .frame(minWidth:0, maxWidth: .infinity)
                                .background(Color.gray)
                                .cornerRadius(10)
                ) {
                    ForEach(Story.anthoerStory) { story in
                        StoryBlock(selection: $selection, story: story)
                            .padding(.bottom, 1)
                    }
                }
            }
            
            LazyVStack(pinnedViews: [.sectionHeaders]) {
                Section(header:
                            Text("協奏")
                                .padding(.vertical, 3)
                                .frame(minWidth:0, maxWidth: .infinity)
                                .background(Color.gray)
                                .cornerRadius(10)
                ) {
                    ForEach(Story.cooperate) { story in
                        StoryBlock(selection: $selection, story: story)
                            .padding(.bottom, 1)
                    }
                }
            }
        }
        .padding(.top, 100)
        .padding(.horizontal, 10)
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(LinearGradient(gradient: Gradient(colors: [Color("launchColor"), Color("bgColor")]), startPoint: UnitPoint(x: 0, y: 0), endPoint: UnitPoint(x: 1, y: 1)))
        .ignoresSafeArea()
        .toolbar(content: {
            ToolbarItem(placement: .principal) {
                Text("劇情")
            }
        })
    }
}

struct StoryView_Previews: PreviewProvider {
    static var previews: some View {
        StoryView()
    }
}

struct StoryBlock: View {
    @Binding var selection: Story
    var story: Story
    
    @State private var hidden: Bool = true
    
    var body: some View {
        VStack {
            Button(action: {
                print("story: \(story.name)")
                if selection.id == story.id {
                    selection = Story.emptyStory
                }
                else {
                    selection = story
                }
            }, label: {
                Image(story.name)
                    .resizable()
                    .scaledToFit()
                    .offset(y: hidden ? -50: 0)
                    .opacity(hidden ? 0: 1)
                    .animation(.easeInOut(duration: 1.5), value: hidden)
                    .cornerRadius(10)
            })
            
            VStack {
                if selection.id == story.id {
                    if story.character.count > 0 {
                        Text("可獲得角色: " + story.character.joined(separator: ", "))
                            .font(.caption)
                            .padding(.horizontal, 20)
                    
                        TabView {
                            ForEach(story.character.indices) { count in
                                Image(story.character[count])
                                    .resizable()
                                    .scaledToFit()
                            }
                        }
                        .frame(width: UIScreen.main.bounds.width*0.6)
                        .tabViewStyle(PageTabViewStyle())
                    }
                    else {
                        Text("可獲得角色: 無")
                            .font(.caption)
                            .padding(.bottom)
                    }
                    
                    Text(story.intro)
                    
                    if story.cooperater.count > 0 {
                        Text("合作對象: " + story.cooperater[0])
                            .font(.caption)
                            .padding(.top)
                        Text("合作產品: " + story.cooperater[1])
                            .font(.caption)
                    }
                }
            }
            .animation(selection.id == story.id ? .easeInOut(duration: 0.8) : .none)
        }
        .onAppear {
            self.hidden = false
        }
    }
}

struct Story: Identifiable {
    let id = UUID()
    
    let name: String
    let character: [String]
    let intro: String
    let cooperater: [String]
}

extension Story {
    static let emptyStory = Story(name: "", character: [], intro: "", cooperater: [])
    
    static let defaultStory = Story(name: "主線", character:
                                  ["阿爾德","菲妮","艾米","賽勒斯","海蕾娜","基爾德那","阿露緹娜"], intro:
                                  """
                                  從沒遇上過的人、從沒聽過的歌、從沒感受過的風。
                                  跟我所不知道的另一個我相遇。
                                  夢見我所沒有看過的夢。
                                  再一次......
                                  前往穿越時空的冒險旅途。
                                  
                                  讓我們去拯救被扼殺的未來吧，
                                  在時空的黑暗降臨之前......
                                  """, cooperater: [])
    
    static let anthoerStory = [Story(name: "雙騎士與祈禱的魔劍", character: ["蒂亞朵拉"], intro:
                                   """
                                   在米格蘭斯騎士團之間，流傳著某位僱兵的傳聞。
                                   一位紫色頭髮的女劍士。她的名字是蒂亞朵拉。
                                   勢如破竹地立下無數功勳的她，身邊總是圍繞著黑暗的傳聞。
                                   據說她染指了魔劍的邪法，做事不擇手段。
                                   迷宮之中魔劍閃耀的劍尖所指的方向。究竟存在著真相，還是虛妄。
                                   祈禱的魔劍正沉默地等待著時機的到來.....
                                   """, cooperater: []),
                               Story(name: "絕對零度鎖鏈", character: ["紗希"], intro:
                                   """
                                   艾路茲恩最頂級的學園都市IDA學園。
                                   突然被邀請前往學園的阿爾德，等待他的是在學生之間流傳的各種「傳聞」。
                                   牆壁女、奇怪的人造人、白色制服的團體、黑暗蘋果――
                                   在看似全無關連的各種傳聞背後，事態正慢慢地展開。
                                   白髮少年賈德，為了某個目的，正準備踏足深淵。
                                   他還不知道在前方等待他的，是絕對零度的真相.....
                                   """, cooperater: []),
                               Story(name: "千年寶盒與海神神殿", character: ["謝拉"], intro:
                                   """
                                   那是一段自古流傳下來的童話。傳說在海底之下，有一座珍珠宮殿。
                                   在那個由乙姬統治的樂園裡，傳承著一個禁忌。
                                   就是，千萬不要打開箱子。
                                   
                                   時間流轉，帕西法爾王朝時代。
                                   悠久平靜的日子已經結束，海底中傳來不穩的氣氛。
                                   與某隻海龜的相遇，令阿爾德被捲入動亂之中。
                                   彷如被千年寶箱引發的旋渦吞噬.......
                                   """, cooperater: []),
                               Story(name: "時之煤礦與夢想鄉", character: [], intro:
                                   """
                                   過去曾經存在過的煤礦村。
                                   有一位青年，夢想著復興這片荒廢的土地。
                                   阿爾德為青年的夢想所感動，答應助他一臂之力。
                                   一邊在村外的煤礦和村子旁邊的森林採集素材，
                                   偶爾從外面招集人手，一同邁向復興的道路。
                                   但是，隨著復興的腳步，他們終究還是開採到了。
                                   在時之煤礦最深處埋藏著的，昔日夢想的末路.......
                                   """, cooperater: []),
                               Story(name: "蝴蝶之街與天之搖籃", character: [], intro:
                                   """
                                   艾路兹恩最頂級的學園都市IDA學園。
                                   位於學園裡的IDA市流傳著各種傳聞。
                                   天的藍色蝴蝶群、突然燃燒起來的醫學樓、在天空飛舞的白色人影.......
                                   夢境和現實交織而成的螺旋中,白色制服的團體為收拾事態而到處奔走。
                                   在同一時間，絕對零度的少女正獨自尋找著將來的路。
                                   
                                   白色制服少女微笑著。
                                   來吧，在天之搖籃中安睡吧。即使那只是一抹夢幻.......
                                   """, cooperater: []),
                               Story(name: "衝天之塔與幽冥魔女", character: ["波波羅"], intro:
                                   """
                                   存在於大陸邊緣的，沙漠之島。
                                   傳說在彷佛能衝天的塔上，棲息著魔物之蛇,
                                   牠會將看到的人變成石頭，亦會令大地枯竭。
                                   
                                   時間為2萬年前，這片土地仍然被盎然的綠意覆蓋。
                                   為了尋人而流落此地的異端者們，都在那裡聚集。
                                   有人為了尋找母親、有人為了追緝賊匪、甚至有人為了尋找仇敵。
                                   被幽冥魔女，和呼喚她的聲音之主隨意玩弄的因果，
                                   將會穿越時空，在衝天之塔中了結一切.......
                                   """, cooperater: []),
                               Story(name: "封閉的庭園與蒼穹的背叛者", character: ["嘉里德"], intro:
                                   """
                                   她直到現在還在思考.......
                                   他捨棄與人類共存的道路，發起叛亂的原因。
                                   
                                   過去內戰的傷口終於癒合的曙光都市艾路茲恩.......
                                   黑暗正默默地蠶食那得來不易的平靜。
                                   
                                   在黑暗的深處靜靜地磨利獠牙，赤色的合成人類。
                                   總是隱約出現在事件背後的KMS公司。
                                   還有早已淡出人們視線的古老統治機構.......
                                   
                                   那個人一直在被封閉的庭園裡，暗中操縱著一切。
                                   一切都是為了奪取遺失的睿智之書「庫羅諾斯的報告」.......
                                   """, cooperater: []),
                               Story(name: "引導的果實與虛像隻迷途羔羊", character: ["瑪娜"], intro:
                                   """
                                   被譽為艾路兹恩最頂級的學園都市IDA學園。
                                   之前一直侵蝕著此地的夢境意識事件，正默默地潜伏起來。
                                   
                                   無法忍耐沉默的。藍色薔薇少女決定站出來。
                                   因為惡夢還未完結，而白色制服必需成為拭去黑闇的光明。
                                   同時，在0與1之間的迷途羔羊許下了願望。
                                   「我想見母親一面」。即使很清楚那是絕不可能實現的夢想。
                                   
                                   當藍色薔薇少女與虛像之迷途羔羊相遇之時，故事將往終止符的方向加速前進。
                                   到底黑暗的果實實現的是永恆的惡夢？還是.......
                                   """, cooperater: []),
                               Story(name: "起始的騎士與祈禱的魔劍", character: [], intro:
                                   """
                                   她與魔劍糾纏的故事已經告一段落。
                                   輪迴卻一直在封閉的圓環中不斷地循環。
                                   
                                   在沒有終結的永恆裡，起始亦並不存在。
                                   即使存在，也無法目視和觸摸......本應如此。
                                   
                                   世界總是那麼容易被逆轉。
                                   在萬物扭曲的世界裡，她將再一次背負起重大的宿命。
                                   這是向還沒有開始的圓環，宣告起始之人的故事。
                                   """, cooperater: []),
                               Story(name: "失落的正典與銀色的不凋花", character: ["蘇菲婭"], intro:
                                   """
                                   這是以銀色的墨水所撰寫，沒有盡頭的瘋狂故事——
                                   在艾路兹恩地底深處中巍然聳立的
                                   黃金樓閣，拍賣館。
                                   
                                   有些人的目的是一夜致富，有些人是為求得夢幻的寶物，
                                   無數追尋夢想的人。都被那光芒吸引而聚集。
                                   
                                   可疑的仲介、充滿謎團的執照、藏有隱情的寶石......
                                   阿爾德也被那妖異卻耀目的光芒所吸引，
                                   深入到地底深處。
                                   
                                   在那裡他遇見了擁有雪花般的容顏，還有烈火般的執念
                                   追尋著一本書的女性，蘇菲婭。
                                   史上最昂貴的魔導書，人聲鼎沸的永夜之城。
                                   還有在暗處躍動的黑白人影。
                                   面對被欲望籠罩的地下樓閣，她奮不顧身地拾級而上。
                                   一切都是為了替故事劃下句點......
                                   """, cooperater: [])]
    
    static let cooperate = [Story(name: "雙魂之羈絆與虛無的傀儡師", character: ["JOKER", "摩爾加納"], intro:
                                   """
                                   事情的契機......源於對著一朵花許下的，一個微小的願望。
                                   
                                   聽到在藍色光輝彼端傳來的的願望之聲後，怪盜團決定去拯救聲音的主人。
                                   同一時間，穿越時空的旅行者們，亦平等地受到命運的指引。
                                   
                                   當從沒交接的兩個靈魂相遇交錯之時，
                                   新世界的門扉即將打開。
                                   
                                   在暗影蔓延的亞空間的最深處，操控著傀儡之線的陰影，正在發出陰森的微笑......
                                   """, cooperater: ["Altus株式會社", "女神異聞錄5"]),
                            Story(name: "雙魂之羈絆與虛無的傀儡師-Promises, Vows, and Rings", character: ["VIOLET", "SKULL"], intro:
                                   """
                                   當子然而立的花朵被寄託了殷切願望，
                                   雙魂將會再次相遇。
                                   
                                   穿越時空的旅行者們正準備前往邊境之村的「婚禮場地」時，
                                   怪盜團也遇到了不可思議的「新娘」，因而再次來到了另一邊的世界。
                                   
                                   遙遠的追憶、標紗的約定,以及被塵封的心意。
                                   當所有真相都被解開時，願望終將傾訴而出......
                                   此刻，命運之鐘終於敲響。
                                   """, cooperater: ["Altus株式會社", "女神異聞錄5・皇家版"]),
                            Story(name: "光陰之尾、四穹群星", character: ["克雷斯", "蜜樂", "薇爾貝特", "由利"], intro:
                                   """
                                   某天,異世界的一行人，夢到了追逐小貓的夢境。
                                   四穹群星受到光之尾引導，
                                   與仇視黑暗並站在彼岸之人實現了夢幻般的邂逅。
                                   
                                   就在那時，自稱星球繼承者的影之尾，
                                   正靜悄悄但確切地奠定通往理想未來的基石。
                                   
                                   在現代，由貴族一意孤行所引發的暴政；
                                   在未來，突然被褫奪的身分證明；
                                   在古代，受到洗腦而被奴役的精靈........
                                   
                                   匪夷所思的神秘事件穿越時空，帶來前所未有的危機。
                                   在旅途尾聲等待著的，是沒有錯誤的世界，還是......
                                   """, cooperater: ["萬代南夢宮娛樂株式會社", "傳奇系列"])]
}
