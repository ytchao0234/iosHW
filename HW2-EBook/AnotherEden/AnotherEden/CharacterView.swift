//
//  CharacterView.swift
//  AnotherEden
//
//  Created by User10 on 2021/11/4.
//

import SwiftUI
import AVKit

struct CharacterView: View {
    @Binding var player: AVQueuePlayer
    let sections = ["主角", "邂逅", "外傳", "協奏", "特殊"]
    let sectionContents = [Character.main, Character.encounter, Character.anotherStory, Character.cooperate, Character.special]
    
    var body: some View {
        List {
            Text("在 Another Eden 裡，就算不用抽卡也能拿到非常多的角色。包含主角群、邂逅角、外傳角、協奏角以及一些特殊角色，都是在完成劇情任務後就會漸漸加入隊伍。其中邂逅角為特殊連續戰鬥任務獲得、外傳角為支線劇情任務獲得、協奏角為合作活動任務獲得。")
                .font(.caption)
                .padding()
                .background(Color.secondary.opacity(0.2))
                .cornerRadius(10)
            ForEach(0 ..< sections.count) { order in
                Section(header: Text(sections[order])) {
                    ForEach(sectionContents[order]) { character in
                        NavigationLink(
                            destination: CharacterDetailView(character: character, player: $player),
                            label: {
                                CharacterRow(character: character)
                            })
                    }
                }
            }
        }
        .toolbar(content: {
            ToolbarItem(placement: .principal) {
                Text("角色")
            }
        })
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct CharacterView_Previews: PreviewProvider {
    @State static var player = AVQueuePlayer()
    
    static var previews: some View {
        NavigationView {
            CharacterView(player: $player)
        }
    }
}

struct CharacterRow: View {
    var character: Character
    
    var body: some View {
        HStack {
            Image(character.name + "headshot")
                .resizable()
                .scaledToFill()
                .clipShape(Circle())
                .frame(width: 50, height: 50)
                .scaleEffect(0.9)
                .overlay(Circle().stroke(Color.gray))
                .padding(.trailing)
            Text(character.name)
            Spacer()
            
            if character.time != "" {
                Image(character.time + "icon")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 25, height: 25)
            }
        }
    }
}

struct Character: Identifiable {
    let id = UUID()
    
    let name: String
    let time: String
    let story: String
    let cv: String
    let voice: AVPlayerItem?
    let intro: String
}

extension Character {
    static let main = [Character(name: "阿爾德", time: "現代", story: "",cv: "内山 昂輝",
                                 voice: AVPlayerItem(url: Bundle.main.url(forResource: "阿爾德", withExtension: "mp3")!),
                                 intro:
                        """
                        Another Eden 主角。

                        阿爾德最初是一隻名叫索里克的貓，
                        主人是巴路奧其的一個小女孩。
                        有一天，他誤入時空裂縫，
                        最後來到了未來時空的艾路茲恩。
                        他被庫羅諾斯和圓香博士收留，並改名為奇洛斯。
                        他作為他們的寵物生活，
                        並看護著他們的孩子伊甸和塞西雅。

                        當庫羅諾斯博士啟動了回到過去阻止研發傑諾稜晶的計劃時，
                        他們全家人遭遇了猛烈的時空風暴襲擊。
                        奇洛斯和塞西雅最終一同落在AD284年的月影之森深處。
                        魔獸王基爾德那偶然發現了他們，
                        但在感覺到有人類的到來後迅速離開。
                        基爾德那離開後，
                        因奇洛斯擁有想代替主人伊甸保護賽西雅的強烈意志，
                        加上當時還是嬰兒的賽西雅新中懷有強烈的不安與恐懼，
                        而透過大地陵晶的力量將奇洛斯轉路成了伊甸的樣子。

                        隨後，巴路奧其村長發現了賽西雅和奇洛斯在一起，
                        並把他們帶回家。
                        他給他們分別取名為費恩和阿爾德。
                        之後的一段時間，阿爾德得到了魔劍巨魔怨念，
                        但他無法將其從劍鞘中拔出，只能繼續將其背在身上。
                        在經歷了一系列漫長的遭遇和不斷被傳送到古代和未來之後，
                        阿爾德最終發現了他真正的家庭成員和他的真實身份，
                        並制止了世界面臨的威脅。
                        """),
                       Character(name: "菲妮", time: "現代", story: "", cv: "茅野 愛衣",
                                 voice: AVPlayerItem(url: Bundle.main.url(forResource: "菲妮", withExtension: "mp3")!),
                                 intro:
                        """
                        菲妮的真實身份是塞西雅．庫羅諾斯，
                        是未來時空庫羅諾斯和圓香博士的女兒。
                        她的親生哥哥是伊甸，家裡有一隻寵物貓叫奇洛斯。

                        當庫羅諾斯博士啟動了回到過去阻止研發傑諾稜晶的計劃時，
                        塞西雅被傳送到過去，以防止她與未來一起被抹去。
                        奇洛斯和塞西雅最終一同落在AD284年的月影之森深處。
                        魔獸王基爾德那偶然發現了他們，但在感覺到有人類的到來後迅速離開。
                        基爾德那離開後，因奇洛斯擁有想代替主人伊甸保護賽西雅的強烈意志，
                        加上當時還是嬰兒的賽西雅新中懷有強烈的不安與恐懼，
                        而透過大地陵晶的力量將奇洛斯轉路成了伊甸的樣子。

                        隨後，巴路奧其村長發現了賽西雅和奇洛斯在一起，並把他們帶回家。
                        他給他們分別取名為菲妮和阿爾德。
                        """),
                       Character(name: "基爾德那", time: "現代", story: "", cv: "置鮎 龍太郎",
                                 voice: AVPlayerItem(url: Bundle.main.url(forResource: "基爾德那", withExtension: "mp3")!),
                                 intro:
                        """
                        年輕時的基爾德那深入月影之森時，
                        他注意到一個搖籃裡的嬰兒，並發現了來自她的力量。
                        但一個正在靠近的人類聲音迫使他離開，他決定將來會再回來。

                        16年後，基爾德那成為魔獸王，並襲擊了巴路奧其村莊，
                        打倒了村長後綁架了菲妮。
                        阿爾德試圖與基爾德那戰鬥，
                        並在過程中暫時解開了魔劍巨魔怨念的封印，
                        卻仍然被輕易擊敗。 
                        而基爾德那出於對劍的尊重，留下了他的性命。

                        基爾德那之後又對米格蘭斯城堡發動了攻擊，
                        燒毀了城堡，並將米格蘭斯國王逼到了城堡頂端。
                        然而，阿爾德來到這裡，再次與基爾德那戰鬥。
                        儘管基爾德那從人形轉換成巨大野獸的形態，卻還是被阿爾德擊敗。
                        獲得重生的基爾德那，不再選擇成為魔獸王討伐人類，
                        而是努力為魔獸人民建立安居之所。
                        """),
                       Character(name: "阿露緹娜", time: "現代", story: "", cv: "竹達 彩奈",
                                 voice: AVPlayerItem(url: Bundle.main.url(forResource: "阿露緹娜", withExtension: "mp3")!),
                                 intro:
                        """
                        魔獸族女孩，是曾經的魔獸王基爾德那的妹妹。
                        年幼時在月影之森與菲妮相識，其後成為了好朋友。
                        性格溫柔平靜擁有一顆關懷四周的心靈。
                        曾在巨魔戰役時被巨魔澤農變成了精靈大劍......
                        十分喜歡梅菇，意外地擁有相當老成的喜好。
                        """),
                       Character(name: "艾米", time: "未來", story: "", cv: "佐藤 利奈",
                                 voice: AVPlayerItem(url: Bundle.main.url(forResource: "艾米", withExtension: "mp3")!),
                                 intro:
                        """
                        艾路兹恩伽馬地區武器店「伊莎堂」的招牌女店員。
                        為了對付合成人類，每天不停地鍛鍊身體。 
                        與大咧咧的父親 2 人同居，負責家中所有家事。
                        不過，由於十分粗枝大葉，
                        下廚 3 次總會有1次將菜餚煮成焦炭。
                        """),
                       Character(name: "莉卡", time: "未來", story: "", cv: "釘宮 理惠",
                                 voice: AVPlayerItem(url: Bundle.main.url(forResource: "莉卡", withExtension: "mp3")!),
                                 intro:
                        """
                        由艾路兹恩的超大型企業KMS公司，生產的工作型人造人。
                        因為擁有接近人類的人工智慧，所以能夠愛惜各種事物。
                        但由於內部的黑箱干涉，偶爾會產生無法認路等錯誤......
                        """),
                       Character(name: "嘉里德", time: "未來", story: "", cv: "磯部 勉",
                                 voice: AVPlayerItem(url: Bundle.main.url(forResource: "嘉里德", withExtension: "mp3")!),
                                 intro:
                        """
                        合成人類為反抗人類所組成的，叛亂軍的前領袖。
                        於重裝甲機車上輕鬆揮舞，
                        稱為「創世騎槍」的巨大電子槍。

                        與海蕾娜相同，都是由庫羅諾斯博士一手創造。
                        是世界上唯二的原型機，
                        似乎也與「庫羅諾斯報告」有著某種關係。
                        """),
                       Character(name: "海蕾娜", time: "未來", story: "", cv: "田中 理恵",
                                 voice: AVPlayerItem(url: Bundle.main.url(forResource: "海蕾娜", withExtension: "mp3")!),
                                 intro:
                        """
                        合成人類，年齡設定在20歲左右，與嘉里德皆為合成人類原型機。
                        這是在著手研發合成人類時，
                        由艾路兹恩的天才科學家庫羅諾斯博士所製作的特殊樣本。
                        精神層面相當接近人類、性格十分沉著冷靜，
                        一直思考著如何能夠與人類共存。
                        """),
                       Character(name: "賽勒斯", time: "古代", story: "", cv: "前田 正治",
                                 voice: AVPlayerItem(url: Bundle.main.url(forResource: "賽勒斯", withExtension: "mp3")!),
                                 intro:
                        """
                        外貌為青蛙模樣的神秘劍士。
                        有如隱姓埋名般，默默地獨居著。
                        其過去經歷皆不為人知。

                        似乎來自東方國度，劍術相當了得。
                        十分具有男子氣概，不過頗為性急，
                        偶爾會顯得有點冒失。
                        推測年齡為 37 歲。
                        """)]

    static let encounter = [Character(name: "阿佐美", time: "現代", story: "", cv: "川澄 綾子",
                                 voice: AVPlayerItem(url: Bundle.main.url(forResource: "阿佐美", withExtension: "mp3")!),
                                 intro:
                            """
                            來自東方某國度的女武士。
                            為了成為公主的警衛，遠渡重洋來此進行武者的修行。
                            雖然平常言行總是如武士般嚴肅，
                            但其實內心也有花樣少女的一面。
                            一旦放鬆心情就會露出本性。
                            """),
                            Character(name: "伽琉", time: "古代", story: "", cv: "細谷 佳正",
                                 voice: AVPlayerItem(url: Bundle.main.url(forResource: "伽琉", withExtension: "mp3")!),
                                 intro:
                            """
                            能自由操控業火，瞬間就能將敵人燒成灰燼的火焰魔法使。 
                            對自己的火焰有絕對的自信。

                            為了證明自己是最強的人，不斷在戰場上與強者戰鬥。
                            個性驕傲自大且殘酷無情。
                            面對敵人絕不留情，會毫不猶豫地殲滅敵人。
                            """),
                            Character(name: "思琳", time: "未來", story: "", cv: "久川 綾",
                                 voice: AVPlayerItem(url: Bundle.main.url(forResource: "思琳", withExtension: "mp3")!),
                                 intro:
                            """
                            IDA學園新上任的教師。
                            負責的科目為「戰術理論」，在此領域中的研究受到了相當高的評價。 
                            原本完全不擅長實戰，
                            但最近通過揮舞教鞭表現出高超的戰鬥能力。 
                            似乎有一部分學生在看到她的變化之後，感到十分害怕......
                            """),
                            Character(name: "賈德", time: "未來", story: "絕對零度鎖鏈", cv: "中井 和哉",
                                 voice: AVPlayerItem(url: Bundle.main.url(forResource: "賈德", withExtension: "mp3")!),
                                 intro:
                            """
                            從突然出現在IDA學園的，絕對零度鎖鏈夢境意識中加入隊伍的白髮青年。
                            總是帶著銳利眼神和兇惡表情的獨行俠，
                            但其實是個溫和熱情的人。

                            可以隱約看出他非常想救出，
                            因吃下黑暗蘋果，
                            而被吞噬到絕對零度鎖鏈夢境意識裡的少女。
                            """)]
    static let anotherStory = [Character(name: "蒂亞朵拉", time: "現代", story: "雙騎士與祈禱的魔劍", cv: "内田 真禮",
                                 voice: AVPlayerItem(url: Bundle.main.url(forResource: "蒂亞朵拉", withExtension: "mp3")!),
                                 intro:
                                """
                                蒂亞朵拉與她的妹妹安娜貝爾住在聖騎士之村烏爾亞拉。
                                有一天，魔獸摧毀了村莊，使安娜貝爾受了致命的傷。
                                一個蒙面人出現了，向蒂亞朵拉提供了一把魔劍，
                                這使她有能力拯救她的妹妹。
                                蒂亞朵拉接受了拯救安娜貝爾的交易。
                                作為交換，魔劍菲亞瓦雷要奪走蒂亞朵拉最不想失去的東西，
                                也就是與安娜貝爾的情誼。

                                蒂亞朵拉與安娜貝爾都失去了與對方有關的記憶，
                                並無意識地對對方產生敵意。
                                儘管之後姐妹倆在悠尼岡重逢，
                                但都沒有彼此的記憶，而且她們經常互看不順眼。

                                這段被抹去的記憶最終被隱藏在悠尼岡下的映照真實之鏡揭示給了蒂亞朵拉，
                                但蒂亞朵拉並沒有告知安娜貝爾她們的關係。
                                最後，蒂亞朵拉決定悄悄地繼續這個輪迴，
                                打扮成蒙面人把魔劍菲亞瓦雷交給年幼的自己，
                                這樣安娜貝爾就能繼續得到拯救。
                                """),
                                Character(name: "謝拉", time: "古代", story: "千年寶盒與海神神殿", cv: "甲斐田 裕子",
                                 voice: AVPlayerItem(url: Bundle.main.url(forResource: "謝拉", withExtension: "mp3")!),
                                 intro:
                                """
                                乙姬王族後裔的少女，第25代乙姬。
                                由於她魯莽的行為和錯誤的決定，她被人民認為已經辭去了乙姬的角色，
                                在睡覺時被人偷偷藏在一個木桶裡，扔進了龍宮城裡的一個魚池。
                                不料在魚池內出現了時空隧道，將她送入了阿爾德所在的AD300年。
                                """),
                                Character(name: "波波羅", time: "現代", story: "衝天之塔與幽冥魔女", cv: "大谷 育江",
                                 voice: AVPlayerItem(url: Bundle.main.url(forResource: "波波羅", withExtension: "mp3")!),
                                 intro:
                                """
                                諾澎族的男孩子。
                                據說牠們額頭上的葉子相當於人類的頭髮，
                                而牠的葉子則與其他諾族不同，是純白色的。
                                原本諾澎族無法理解人類的語言，連交談都辦不到，
                                但牠卻能夠說人類的語言。
                                但是......牠一旦驚慌失措，就會不自覺地說出諾澎族的語言。
                                波波！
                                """),
                                Character(name: "紗希", time: "未來", story: "絕對零度鎖鏈", cv: "安濟 知佳",
                                 voice: AVPlayerItem(url: Bundle.main.url(forResource: "紗希", withExtension: "mp3")!),
                                 intro:
                                """
                                過去因為父親的實驗，被強制賦予了能將感情具體化能力的少女。
                                雖然透過黑暗蘋果事件後，封印了能力。
                                但因感情失控，而差點傷害到了朋友的記憶，
                                卻無法輕易忘卻。
                                她仍然不知該如何面對，黑暗蘋果事件後，
                                自身體內萌生出的新力量。
                                """),
                                Character(name: "瑪娜", time: "未來", story: "引導的果實與虛像之迷途羔羊", cv: "中原 麻衣",
                                 voice: AVPlayerItem(url: Bundle.main.url(forResource: "瑪娜", withExtension: "mp3")!),
                                 intro:
                                """
                                在電腦世界變成了零散的意識體，
                                一直到處徘徊的虚像之迷途羔羊。
                                在 30 年前進行的，由 AI 探索兒童教育的可能性的研究項目，
                                「母體項目」的試驗體。
                                同時是唯一成功與 AI 保持良好母子關係的珍貴存在。

                                如果問她的戶藉和年齡，會有點情緒失落。
                                """),
                                Character(name: "蘇菲婭", time: "未來", story: "失落的正典與銀色的不凋花", cv: "高橋 李依",
                                 voice: AVPlayerItem(url: Bundle.main.url(forResource: "蘇菲婭", withExtension: "mp3")!),
                                 intro:
                                """
                                為了某本書而前來參加艾路茲恩的拍賣會的女性。
                                左眼被一朵銀色的花覆蓋，
                                不擅長表達自己的感情，語氣也十分冷淡。
                                但一提到書本便會流露出她強硬的一面。 

                                聽說她流浪了相當長的時間，所以對各地的歷史和知識都十分豐富，
                                但卻沒有任何人知道她的來歷。
                                """)]

    static let cooperate = [Character(name: "JOKER", time: "", story: "雙魂之羈絆與虛無的傀儡師", cv: "福山 潤",
                                 voice: AVPlayerItem(url: Bundle.main.url(forResource: "JOKER", withExtension: "mp3")!),
                                 intro:
                            """
                            在春天時搬到東京，轉校到城市的學校的高二少年。
                            在某件事件後覺醒了使用「人格面具」的能力。
                            寄居在雙親的朋友所開，不怎麼起眼的咖啡廳內。

                            白天過著普通的學生生活，
                            而晚上則是作為在社會中引起騷動的怪盜，在暗地裡展開活動。
                            """),
                            Character(name: "摩爾加納", time: "", story: "雙魂之羈絆與虛無的傀儡師", cv: "大谷 育江",
                                 voice: AVPlayerItem(url: Bundle.main.url(forResource: "摩爾加納", withExtension: "mp3")!),
                                 intro:
                            """
                            與JOKER等人在異世界的殿堂裡認識。
                            像黑貓一般的謎之存在。
                            既能說人類的語言，亦能變身成各種形態。
                            牠的存在充滿著很多謎團。
                            雖然說話的語氣很粗魯，但總是不顧自身地支援著怪盜團的夥伴們。
                            口頭禪是「吾輩不是貓！」
                            """),
                            Character(name: "SKULL", time: "", story: "雙魂之羈絆與虛無的傀儡師-Promises, Vows, and Rings", cv: "宮野 真守",
                                 voice: AVPlayerItem(url: Bundle.main.url(forResource: "SKULL", withExtension: "mp3")!),
                                 intro:
                            """
                            秀畫學園的2年級學生。
                            雖然平常言行舉止粗暴，但富有同情心。
                            是非常男子漢的行動派。
                            因為某件事件，在學園內被標籤為問題兒童，
                            因而無法融入其他學生的圈子。
                            遇到JOKER後覺醒了人格面具的能力。
                            """),
                            Character(name: "VIOLET", time: "", story: "雙魂之羈絆與虛無的傀儡師-Promises, Vows, and Rings", cv: "雨宮 天",
                                 voice: AVPlayerItem(url: Bundle.main.url(forResource: "VIOLET", withExtension: "mp3")!),
                                 intro:
                            """
                            秀盡學園 1 年級生的美少女。
                            從中學時代起，作為新體操選手，獲得了十分優異的成積。
                            前途一片光明，連學園都對她十分期待。
                            """),
                            Character(name: "克雷斯", time: "", story: "光陰之尾、四穹群星", cv: "草尾 毅",
                                 voice: AVPlayerItem(url: Bundle.main.url(forResource: "克雷斯", withExtension: "mp3")!),
                                 intro:
                            """
                            修煉繼承自父親的，阿爾貝因流劍術的劍士。
                            性格善良、樂於助人，很會照顧別人的心情。
                            同時亦具備勇敢對抗敵人的勇氣。
                            """),
                            Character(name: "蜜樂", time: "", story: "光陰之尾、四穹群星", cv: "澤城 美雪",
                                 voice: AVPlayerItem(url: Bundle.main.url(forResource: "蜜樂", withExtension: "mp3")!),
                                 intro:
                            """
                            以精靈之主「麥斯威爾」的身分守護世界的女性。
                            性格冷靜沉著，為了守護人類和精靈的使命，
                            不會計較任何犧牲。 
                            雖然有匹配精靈之主身分的睿智，
                            但生活上的自理能力卻很薄弱。
                            對人類的文化有很強烈的好奇心。
                            只要一感興趣，就會想追根究底。
                            """),
                            Character(name: "薇爾貝特", time: "", story: "光陰之尾、四穹群星", cv: "佐藤 利奈",
                                 voice: AVPlayerItem(url: Bundle.main.url(forResource: "薇爾貝特", withExtension: "mp3")!),
                                 intro:
                            """
                            原本是在邊境村莊裡生活的平凡小姑娘，
                            因為某件事件令她變成了與世界為敵的復仇者。
                            被復仇的念頭吞噬後的她，
                            本來善良的性格，被憤怒和仇恨壓制,幾乎不展露笑容。

                            以繃帶包裹的左手，是在事件發生的那天，
                            被吞噬她的謎之力量改變成非人之姿。
                            """),
                            Character(name: "由利", time: "", story: "光陰之尾、四穹群星", cv: "鳥海 浩輔",
                                 voice: AVPlayerItem(url: Bundle.main.url(forResource: "由利", withExtension: "mp3")!),
                                 intro:
                            """
                            一直在尋找貫徹自身正義之道的青年。
                            過去曾對騎士團抱有憧憬而加入了，
                            但卻對內部腐敗的現實失望，最後選擇退出。
                            雖然說話語氣粗魯但很會照顧人。
                            就算嘴上再不情願，最後還是無法放著有困難的人不管。
                            """)]
    static let special = [Character(name: "草人小子", time: "古代", story: "", cv: "加藤 英美里",
                                 voice: nil,
                                 intro:
                            """
                            稻草人的小孩。
                            被沖到海邊國佐見附近的海岸上的，不可思議的稻草人。 
                            將他撿回來，然後全心全力培育好的話，
                            會成長成不凡的稻草人。 

                            沒有任何人知道，他們到底從何而來，
                            又將往何方而去......... 
                            但是那無垢且明亮的眼眸，
                            映照著藍天與海，充滿率直和純真。
                            """),
                            Character(name: "莉維雅", time: "古代", story: "", cv: "種﨑 敦美",
                                 voice: AVPlayerItem(url: Bundle.main.url(forResource: "莉維雅", withExtension: "mp3")!),
                                 intro:
                            """
                            從曾被玉手箱封印的災厄，利維坦身上掉落的古代魚人族少女。
                            對自己的過去毫無記憶，
                            也不清楚自己與災厄之獸的關係。
                            喜歡吃美食、睡覺、尋找美麗的貝殼飾品。
                            對於自己失去記憶絲毫不在乎。
                            """)]
}
