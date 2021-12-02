//
//  Journal.swift
//  MoodJournal
//
//  Created by FanRende on 2021/11/23.
//

import SwiftUI
import Foundation

struct Journal: Identifiable, Codable, Comparable {
    var id = UUID()
    
    var title = String()
    var content = String()
    var time = Date()
    var fontSize: CGFloat = 20
    var fontFamily = Int()
    var moodTag = Int()
    
    static func < (lhs: Journal, rhs: Journal) -> Bool {
        return lhs.time < rhs.time
    }
    
    func isEmpty() -> Bool {
        if self.title == "" && self.content == "" {
            return true
        } else {
            return false
        }
    }
}

extension Journal {
    static let emptyJournal = Journal(title: "", content: "", time: Date(), fontSize: 20, fontFamily: 0, moodTag: 0)
    static let test1 = Journal(
        title: "天使、上帝、魔鬼",
        content:
            """
            在朋友家聊天。

            『我太太早上是天使，中午是上帝，晚上是魔鬼。』男主人對我說。看我不懂，笑起來，放小聲：『她早上要醒還沒醒的時候最有情調了。這時候，我摟她，她會哼哼咿咿地，讓我摟、讓我親，好像剛結婚的時候那麼有情調，所以是天使。』

            換個表情：『可是起床之後就不一樣了，她是女強人，一想到她的辦公室，眼睛就亮起來，我每次白天打電話給她，她都忙得要死，好像什麼事都等她決定，她不動，公司就會垮似的。
            你說，這是不是上帝？』

            嘆了口氣：『可是等她下班，就全變了，情緒一下子由山頭掉到谷底，身體累，脾氣就壞，看誰都不順眼，別說摟了，連摸她一下都嫌我煩，那眼睛裡冒著凶光，十足像個魔鬼。』

            這話居然被裡面的女主人聽到。砰砰砰，衝出來：『好哇！偷偷講我壞話，你怎不說你自己呢？你早上神氣得要死，好像一切都沒問題，等中午打電話給你，就怨這個、罵那個，好像全世界都欠你的。

            下班之後，好！人又不見了，打牌、喝酒、唱卡拉OK，作樂作到深更半夜。你呀！早上是上帝，中午是魔鬼，晚上是天使。』沒好氣地呸了一聲：『可是那天使是作給別人看的，還不如我呢！』

            兩個人正頂嘴，兒子放學回來了。

            『又一個魔鬼、天使、上帝回來了。』男主人說。

            『孩子又怎麼了？』我問。

            『他啊！早上有起床氣，先叫不起來，起來之後又拉著一張臭臉，活像魔鬼。但是一出門，到學校就不一樣了，跟同學有說有笑，又打又鬧，活像個天使。至於晚上，大概因為功課重，我們又都寵他，真是在家稱王了，我看電視聲音大一點，他就狠狠把門摔上。處處得一家人捧著，不是上帝是什麼？』

            這時候，在旁邊坐著一直沒吭氣的老太太笑了：『你們都甭怨了，要怨應該由我來怨。』

            朝裡屋瞧瞧，確定老先生不在，小聲說：『那個老傢伙啊，年輕的時候，甜得要死，帶著我看電影、旅行、吃館子，現在想想，真是個天使。』

            搖搖頭：『可是後來發了，事業愈順，愈沒情調，一天到晚忙，在家好像作客似的，他是大老闆，誰都得聽他使喚，他十足是主子，是個上帝。』

            『那又怎麼變成魔鬼呢？』我問。

            『等下你見到他就知道了，老了，變成個老怪物，退休了，管不了別人，就管我，成天找我麻煩，不是魔鬼是什麼？』

            上帝、天使、魔鬼，這是三個相差多遠的角色！

            誰能想到我們在一天當中，甚至一生之中，竟然隨時可能扮演其中的一樣。

            有愛心的時候是天使；有信心的時候是上帝；有怨恨的時候是魔鬼。

            精神抖擻的時候是上帝；精神輕鬆的時候是天使；精神委靡的時候是魔鬼。

            少年飛揚時是天使；中午跋扈時是上帝；晚年頑固時是魔鬼。
            於是我想，我們是不是應該隨時檢討一下：

            我是在扮演什麼角色？
            我白天太專橫了，現在是不是該溫柔一點？
            我白天太忙碌了，忙得沒情趣，現在是不是該輕鬆一下，露出一點笑容。

            我也想：大概每個人與生俱來，就是天使、上帝與魔鬼的混合，在『神』裡有『魔』性，在『魔鬼』中又見『天使』。

            於是當我們看到某人魔鬼的表現時，總能偷偷想：不知道他扮演上帝和天使時會是怎樣的面貌？

            如此說來，這三種角色的變換，不也就如同天氣嗎？

            幾番風雨幾番晴，幾番和煦幾番涼。
            幾番歡樂幾番悲，幾番優裕幾番傷。

            且不論冥冥中是不是真有上帝、魔鬼與天使，你我不是都穿梭在這三者之間嗎？
            """,
        time: Date(), fontSize: 20, fontFamily: 0, moodTag: 0)
    static let test2 = Journal(
        title: "兔子的論文",
        content:
            """
            在一個充滿陽光的午後，一隻兔子從她的洞裡出來享受大好天氣。

            天氣好得讓她失去警覺，一隻狐狸危隨其後，抓住了她。

            「我要把妳當午餐吃掉！」狐狸說。

            「慢著！」兔子答道。「你應該至少等個幾天。」

            「喔？是嗎？為什麼我要等？」

            「嗯，我正在完成我的博士論文。」

            「哈，那是個很蠢的理由。妳的論文題目是什麼？」

            「我正在寫『兔子比狐狸與狼的優越性』。」

            「妳瘋了嗎？我應該現在就把妳吃了！大家都知道狐狸總是比免子強的。」

            「根據我的研究，並不盡然。如果你想的話，你可以來我洞裡，自己讀它。如果你不能被說服，你可以把我當午餐吃了。」

            「妳真的瘋了！」但狐狸很好奇，而且讀讀論文也不會損失什麼，就跟兔子進去了。狐狸再也沒有出來。

            幾天以後兔子又出來休息。一隻隻狼從樹叢中出來並準備吃她。

            「慢著！」兔子叫道。「你現在不能吃我。」

            「為什麼呢？我毛絨絨的開胃菜。」

            「我的論文『兔子比狐狸與狼的優越性』幾乎要完成了。」狼笑得太厲害，以致於鬆開抓住兔子的手。

            「也許我不應該吃妳。妳的腦子真的有病，妳可能有某種傳染病。」

            「你可以自己來讀它。如果你不同意我的結論，你可以把我吃掉。」

            於是狼跟兔子進洞裡去，再也沒有出來。

            兔子終於完成她的論文，並出來在萵苣叢中慶祝。

            另一隻免子過來問她，「什麼事？妳看起來很快樂。」

            「是啊，我剛剛完成我的論文。」

            「恭喜！主題是？」

            「『兔子比狐狸與狼的優越性』。」

            「妳確定嗎？聽起來不太對。」

            「喔！進來自己讀。」

            他們一起進洞裡去。

            當他們進去時，朋友看到的是一個典型的研究生的窩，一團亂，在完成論文後。

            存放這部具爭議性的論文的電腦在一個角落，在右邊有一疊狐狸骨頭，在左邊有一疊狼的骨頭，而在中間，有一隻巨大的、正在舔嘴唇的獅子。

            這個故事告訴我們：你論文的題目並不重要。重要的是......... 誰是你的指導教授。

            引申至上班族為：你做了什麼不重要，重要的是「你的老闆罩不罩你」。
            """,
        time: Date(), fontSize: 20, fontFamily: 0, moodTag: 0)
    static let test3 = Journal(
        title: "What is the metaverse?",
        content:
            """
            The metaverse is a virtual universe that blends aspects of digital technologies including video-conferencing, games like Minecraft or Roblox, cryptocurrencies, email, virtual reality, social media and live-streaming. Quite how these pieces will fit together is a work in progress, but some tech giants already see it as the future of human communication and interaction. It’s “the next frontier,” Mark Zuckerberg said when he changed his company’s name from Facebook Inc. to Meta Platforms Inc.
            
            What will it look like? It may be easier to grasp the concept by first saying what it isn’t: It’s not a single product, it’s not a game, and it’s not being created by one company. Rather, it’s akin to a 3D World Wide Web, where businesses, information and communication tools are immersive and interoperable.

            In a way it’s a digital facsimile of how we live in the physical world. Just as you might create a document in Microsoft Word and send it via Gmail to a colleague to read on an iPad, items in the metaverse should be able to move across an ecosystem of competing products, holding their value and function. An original piece of digital art bought as a non-fungible token, or NFT, from Company A, say, should be displayable on the virtual wall of a house in a game made by Company B.

            The metaverse won’t reach its full potential — millions of people accessing and living in the virtual world anywhere, at any time — without ultrafast Internet. That’s why mobile carriers around the world are spending billions of dollars to build 5G networks.

            The rise of the metaverse also presents a tangle of legal and regulatory issues to be resolved. Some of the thorniest issues around the metaverse revolve around users’ personal data and privacy rights.
            """,
        time: Date(), fontSize: 20, fontFamily: 0, moodTag: 0)
    static let test4 = Journal(
        title: "日本での生活で一番めんどうくさいことってなに？",
        content:
            """
            『郷に入れば郷に従え』ということわざが日本にはありますが、今までの環境とは違う郷に入ると、面倒なことが意外とあるものです。私はフランスで１００人くらい集まる家族の集まりの際に、会った人一人一人にキスのあいさつをするのがめんどくさいなぁと思うこともあります。それでは、日本に住む外国人たちは日本生活で何がめんどくさいと感じるのでしょうか？そこで今回は、日本好き外国人の集まる掲示板JAPANREFERENCEより、「日本での生活で一番めんどうくさいことってなに？」に寄せられた外国人の意見をお送りします。納得できることも多いのでは？
            
            ベルギー、ブリュッセル出身男性——同じような形容詞を連発するところ
            「おいしい！あぁ、キレイ！寒い！暑い！すごーい！…。これらの意味が分かるなら、日本人の会話の４分の１は理解できるぞ。」
            
            イギリス、スコットランド出身女性
            日本語がうまいと褒められること、コンビニでお客さんが出入りするときに鳴るピンポンの音、スーパーやデパートで流れるうるさい音楽、選挙前の演説
            
            アメリカ、中西部出身男性——暴走族
            「バイクの音がうるさすぎ。昼間はうるさくても何とかなるが、夜中の２～３時くる馬鹿どもは本当に迷惑。」
            
            カナダ人男性——夏の朝日
            「朝の４時半に日が昇るのは、朝８時に起きるお年寄りを除いて、誰も必要としてない。もっと日の光を有効活用する方法があると思う。」
            
            オランダ人男性——電車の中の変態おっさん
            
            アメリカ人女性
            「私はまだ日本に行ってないけど（これから行く予定）、日本人に無視されるのが怖いし、面倒になると思う。」
            
            ベトナム在住欧米人——箸を使って食べた時に褒められること
            """,
        time: Date(), fontSize: 20, fontFamily: 0, moodTag: 0)
    
    static let defaultDict = ["無標籤": [test1.id: test1, test2.id: test2],
                              "Aaa": [test3.id: test3],
                              "あああ": [test4.id: test4]]
    
    static let fontFamilyList = ["PingFang TC", "YuMincho", "Yuanti TC", "Klee", "Hannotate TC", "Hanzipen TC", "Xingkai TC"]
    static let moodTagList = ["開心", "難過", "生氣", "尷尬"]
}
