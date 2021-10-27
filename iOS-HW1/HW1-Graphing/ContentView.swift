//
//  ContentView.swift
//  HW1-Graphing
//
//  Created by Hannn on 2021/10/14.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Image("grass2")
                .resizable()
                .scaledToFill()
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                .ignoresSafeArea()
            
            ZStack(alignment: .top) {
                Text("わためは")
                    .font(.title)
                    .foregroundColor(Color.pink)
                    .offset(x: -120)

                Text("悪く")
                    .font(.title)
                    .foregroundColor(Color.pink)
                    .offset(x: 140)
                Text("ないよね")
                    .font(.title)
                    .foregroundColor(Color.pink)
                    .offset(x: 120, y: 30)

                BackHair()
                    .fill(Color(red: 0.94, green: 0.92, blue: 0.75))
                BackHair()
                    .stroke(Color.secondary, lineWidth: 0.2)
                
                // Body
                Group {
                    CapeView()
                    SkinView()
                    BlackClothsView1()
                    WhiteClothsView()
                    BlackClothsView2()
                    BagView()
                    ShoesView()
                    PinkClothsView()
                    BowtieView()
                    HarpView()
                }

                // Head
                Group {
                    FaceView()
                    EyesView()
                    FrontHairView()
                    ShofarView()
                    HairpinView()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct FaceView: View {
    var body: some View {
        ZStack {
            // face
            Face()
                .fill(Color(red: 1, green: 0.96, blue: 0.91))
            Face()
                .stroke(Color.secondary, lineWidth: 0.5)
            // nose
            Path(ellipseIn: CGRect(x: 174.5, y: 107, width: 0.6, height: 0.6))
                .fill(Color.secondary)

            // lip
            Path { path in
                path.move(to: CGPoint(x: 168, y: 121))
                path.addQuadCurve(to: CGPoint(x: 181.5, y: 121), control: CGPoint(x: 175, y: 125))
            }
            .stroke(Color.secondary, lineWidth: 0.4)
            // ears
            Ear()
                .fill(Color(red: 1, green: 0.96, blue: 0.75))
            Ear()
                .stroke(Color.secondary, lineWidth: 0.2)
            Ear()
                .fill(Color(red: 1, green: 0.96, blue: 0.75))
                .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
                .offset(x: -11)
            Ear()
                .stroke(Color.secondary, lineWidth: 0.2)
                .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
                .offset(x: -11)
          }
    }
}

struct EyesView: View {
    var body: some View {
        ZStack {
            Group {
                EyeWhite()
                    .fill(.white)
                EyeWhite()
                    .fill(.white)
                    .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
                    .offset(x: -11)

                Iris1()
                    .fill(Color(red: 0.1, green: 0.1, blue: 0.5))
                Iris1()
                    .fill(Color(red: 0.1, green: 0.1, blue: 0.5))
                    .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
                    .offset(x: -11)

                Iris2()
                    .fill(Color(red: 0.85, green: 0.77, blue: 0.94))
                Iris2()
                    .fill(Color(red: 0.85, green: 0.77, blue: 0.94))
                    .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
                    .offset(x: -11)

                Eyelash()
                    .fill(.black)
                Eyelash()
                    .fill(.black)
                    .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
                    .offset(x: -11)
            }

            Group {
                Path(ellipseIn: CGRect(x: 147.5, y: 90, width: 3.7, height: 2.5))
                    .fill(.white)
                Path(ellipseIn: CGRect(x: 33, y: 136.5, width: 3.3, height: 1.2))
                    .rotation(.degrees(30))
                    .fill(.white)
                Path(ellipseIn: CGRect(x: 188, y: 90, width: 3.7, height: 2.5))
                    .fill(.white)
                Path(ellipseIn: CGRect(x: 69, y: 116.2, width: 3.3, height: 1.2))
                    .rotation(.degrees(30))
                    .fill(.white)
            }
        }
    }
}

struct FrontHairView: View {
    var body: some View {
        ZStack {
            Hair2()
                .fill(Color(red: 1, green: 0.98, blue: 0.78))
            Hair2()
                .stroke(Color.secondary, lineWidth: 0.2)
            Hair2()
                .fill(Color(red: 1, green: 0.98, blue: 0.78))
                .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
                .offset(x: -11)
            Hair2()
                .stroke(Color.secondary, lineWidth: 0.2)
                .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
                .offset(x: -11)

            Hair1()
                .fill(Color(red: 1, green: 0.98, blue: 0.84))
            Hair1()
                .stroke(Color.secondary, lineWidth: 0.2)

            Ahoge()
                .fill(Color(red: 1, green: 0.98, blue: 0.84))
            Ahoge() .stroke(Color.secondary, lineWidth: 0.2)

            Eyebrow()
                .stroke(Color.secondary, lineWidth: 0.4)
            Eyebrow()
                .stroke(Color.secondary, lineWidth: 0.4)
                .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
                .offset(x: -11)
        }
    }
}

struct ShofarView: View {
    var body: some View {
        ZStack {
            // left shofar
            Shofar_Back()
                .fill(Color(red: 0.43, green: 0.40, blue: 0.36))
            Shofar_Front()
                .fill(Color(red: 0.67, green: 0.65, blue: 0.57))

            // right shofar
            Shofar_Back()
                .fill(Color(red: 0.43, green: 0.40, blue: 0.36))
                .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
                .offset(x: -11.7)
            Shofar_Front()
                .fill(Color(red: 0.67, green: 0.65, blue: 0.57))
                .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
                .offset(x: -11.7)
            
            // pink ribbon
            Ribbon()
                .fill(Color(red: 1, green: 0.53, blue: 0.53))
            Ribbon()
                .stroke(Color.secondary, lineWidth: 0.3)
            Ribbon()
                .fill(Color(red: 1, green: 0.53, blue: 0.53))
                .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
                .offset(x: -11.7)
            Ribbon()
                .stroke(Color.secondary, lineWidth: 0.3)
                .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
                .offset(x: -11.7)
        }
    }
}

struct HairpinView: View {
    var body: some View {
        ZStack {
            // big hairpin
            BigHairpin()
                .fill(Color(red: 0.99, green: 0.66, blue: 0.63))
            BigHairpin()
                .stroke(Color.secondary, lineWidth: 0.3)
            Path(ellipseIn: CGRect(x: 202, y: 39.2, width: 7, height: 7))
                .fill(.white)

            // thin hairpin - stick
            ThinHairpin_Stick()
                .fill(Color(red: 1, green: 0.80, blue: 0.79))
            ThinHairpin_Stick()
                .stroke(Color.secondary, lineWidth: 0.2)
            ThinHairpin_Stick()
                .fill(Color(red: 1, green: 0.80, blue: 0.79))
                .offset(x: 2, y: 5.2)
            ThinHairpin_Stick()
                .stroke(Color.secondary, lineWidth: 0.2)
                .offset(x: 2, y: 5.2)

            // thin hairpin - ball
            Path(ellipseIn: CGRect(x: 211.5, y: 53.7, width: 3.5, height: 3.5))
                .fill(.red)
            Path(ellipseIn: CGRect(x: 211.5, y: 53.7, width: 3.5, height: 3.5))
                .fill(.red)
                .offset(x: 1, y: 5.3)
        }
    }
}

struct CapeView: View {
    var body: some View {
        CapePink()
            .fill(Color(red: 0.98, green: 0.68, blue: 0.71))
        CapePink()
            .stroke(Color.secondary, lineWidth: 0.5)
        CapeCloud()
            .fill(Color(red: 0.98, green: 0.97, blue: 0.98))
        CapeCloud()
            .stroke(Color.secondary, lineWidth: 0.5)
    }
}

struct SkinView: View {
    var body: some View {
        ZStack {
            Skin()
                .fill(Color(red: 0.98, green: 0.94, blue: 0.89))
            Skin()
                .stroke(Color.secondary, lineWidth: 0.3)
        }
    }
}

struct BlackClothsView1: View {
    var body: some View {
        ZStack {
            BlackCloths1()
                .fill(Color(red: 0.38, green: 0.35, blue: 0.33))
            BlackCloths1()
                .stroke(Color.secondary, lineWidth: 0.5)
        }
    }
}

struct BlackClothsView2: View {
    var body: some View {
        ZStack {
            BlackCloths2()
                .fill(Color(red: 0.38, green: 0.35, blue: 0.33))
            BlackCloths2()
                .stroke(Color.secondary, lineWidth: 0.5)
        }
    }
}

struct WhiteClothsView: View {
    var body: some View {
        ZStack {
            Group {
                WhiteCloths_leftup()
                    .fill(Color(red: 0.98, green: 0.97, blue: 0.97))
                WhiteCloths_leftup()
                    .stroke(Color.secondary, lineWidth: 0.5)
                WhiteCloths_leftdown()
                    .fill(Color(red: 0.95, green: 0.94, blue: 0.94))
                WhiteCloths_leftdown()
                    .stroke(Color.secondary, lineWidth: 0.5)
                WhiteCloths_rightup()
                    .fill(Color(red: 0.98, green: 0.97, blue: 0.97))
                WhiteCloths_rightup()
                    .stroke(Color.secondary, lineWidth: 0.5)
                WhiteCloths_rightdown()
                    .fill(Color(red: 1, green: 0.99, blue: 0.99))
                WhiteCloths_rightdown()
                    .stroke(Color.secondary, lineWidth: 0.5)
            }
            Group {
                WhiteCloths_center2()
                    .fill(Color(red: 0.92, green: 0.90, blue: 0.90))
                WhiteCloths_center2()
                    .stroke(Color.secondary, lineWidth: 0.5)
                WhiteCloths_center1()
                    .fill(Color(red: 0.98, green: 0.97, blue: 0.97))
                WhiteCloths_center1()
                    .stroke(Color.secondary, lineWidth: 0.5)
                WhiteCloths_center4()
                    .fill(Color(red: 0.95, green: 0.94, blue: 0.94))
                WhiteCloths_center4()
                    .stroke(Color.secondary, lineWidth: 0.5)
                WhiteCloths_center3()
                    .fill(Color(red: 0.98, green: 0.97, blue: 0.97))
                WhiteCloths_center3()
                    .stroke(Color.secondary, lineWidth: 0.5)
            }
            Group {
                WhiteCloths_center5()
                    .fill(Color(red: 0.98, green: 0.97, blue: 0.97))
                WhiteCloths_center5()
                    .stroke(Color.secondary, lineWidth: 0.5)
                WhiteCloths_center6()
                    .fill(Color(red: 0.98, green: 0.97, blue: 0.97))
                WhiteCloths_center6()
                    .stroke(Color.secondary, lineWidth: 0.5)
                Path(ellipseIn: CGRect(x: 171.5, y: 236, width: 7, height: 7))
                    .fill(Color(red: 0.99, green: 0.99, blue: 0.87))
                Path(ellipseIn: CGRect(x: 171.5, y: 236, width: 7, height: 7))
                    .stroke(Color.secondary, lineWidth: 0.3)
                Path(ellipseIn: CGRect(x: 172.8, y: 252.2, width: 4.5, height: 4.5))
                    .fill(Color(red: 0.99, green: 0.99, blue: 0.87))
                Path(ellipseIn: CGRect(x: 172.8, y: 252.2, width: 4.5, height: 4.5))
                    .stroke(Color.secondary, lineWidth: 0.3)
                Path(ellipseIn: CGRect(x: 172.8, y: 266.8, width: 4.5, height: 4.5))
                    .fill(Color(red: 0.99, green: 0.99, blue: 0.87))
                Path(ellipseIn: CGRect(x: 172.8, y: 266.8, width: 4.5, height: 4.5))
                    .stroke(Color.secondary, lineWidth: 0.3)
            }
        }
    }
}

struct BowtieView: View {
    var body: some View {
        Bowtie()
            .fill(Color(red: 0.68, green: 0.10, blue: 0.12))
        Bowtie()
            .stroke(Color.secondary, lineWidth: 0.3)
        
        Path(ellipseIn: CGRect(x: 170, y: 152, width: 10, height: 12.5))
            .stroke(Color(red: 0.89, green: 0.85, blue: 0.58), lineWidth: 1.3)
    }
}

struct BagView: View {
    var body: some View {
        Bag()
            .fill(Color(red: 0.51, green: 0.23, blue: 0.18))
        Bag()
            .stroke(Color.secondary, lineWidth: 0.5)
        Path(ellipseIn: CGRect(x: 87, y: 307, width: 6, height: 6))
            .fill(Color(red: 0.80, green: 0.80, blue: 0.66))
        Path(ellipseIn: CGRect(x: 87, y: 307, width: 6, height: 6))
            .stroke(Color.secondary, lineWidth: 0.3)
    }
}

struct ShoesView: View {
    var body: some View {
        ZStack {
            Path { path in
                path.addLines([
                    CGPoint(x: 142, y: 574),
                    CGPoint(x: 159, y: 574),
                    CGPoint(x: 159, y: 648),
                    CGPoint(x: 154, y: 648),
                    CGPoint(x: 142, y: 574)
                ])
                path.addLines([
                    CGPoint(x: 190, y: 574),
                    CGPoint(x: 208, y: 574),
                    CGPoint(x: 196, y: 648),
                    CGPoint(x: 190, y: 648),
                    CGPoint(x: 190, y: 574)
                ])
            }
            .fill(.white)
            
            Group {
                ShoesBlack()
                    .fill(Color(red: 0.24, green: 0.24, blue: 0.24))
                ShoesBlack()
                    .stroke(Color.secondary, lineWidth: 0.5)
                ShoesBlack()
                    .fill(Color(red: 0.24, green: 0.24, blue: 0.24))
                    .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
                    .offset(x: -11)
                ShoesBlack()
                    .stroke(Color.secondary, lineWidth: 0.5)
                    .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
                    .offset(x: -11)
            }
            Group {
                ShoesBowkont()
                    .fill(Color(red: 0.98, green: 0.63, blue: 0.67))
                ShoesBowkont()
                    .stroke(Color.secondary, lineWidth: 0.5)
                ShoesBowkont()
                    .fill(Color(red: 0.98, green: 0.63, blue: 0.67))
                    .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
                    .offset(x: -11)
                ShoesBowkont()
                    .stroke(Color.secondary, lineWidth: 0.5)
                    .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
                    .offset(x: -11)
            }
            Group {
                ShoesCloud()
                    .fill(Color(red: 0.98, green: 0.97, blue: 0.97))
                ShoesCloud()
                    .stroke(Color.secondary, lineWidth: 0.5)
                ShoesCloud()
                    .fill(Color(red: 0.98, green: 0.97, blue: 0.97))
                    .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
                    .offset(x: -11)
                ShoesCloud()
                    .stroke(Color.secondary, lineWidth: 0.5)
                    .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
                    .offset(x: -11)
            }
        }
    }
}

struct PinkClothsView: View {
    var body: some View {
        PinkCloths()
            .fill(Color(red: 0.98, green: 0.63, blue: 0.67))
        PinkCloths()
            .stroke(Color.secondary, lineWidth: 0.3)
    }
}

struct HarpView: View {
    var body: some View {
        Harp3()
            .fill(Color(red: 0.95, green: 0.91, blue: 0.88))
        Harp3()
            .stroke(Color.secondary, lineWidth: 0.5)
        Harp1()
            .fill(Color(red: 0.99, green: 0.96, blue: 0.93))
        Harp1()
            .stroke(Color.secondary, lineWidth: 0.5)
        Harp2()
            .fill(Color(red: 0.98, green: 0.63, blue: 0.67))
        Harp2()
            .stroke(Color.secondary, lineWidth: 0.5)
        Harp4()
            .fill(Color(red: 0.99, green: 0.96, blue: 0.93))
        Harp4()
            .stroke(Color.secondary, lineWidth: 0.5)
        RightHand()
            .fill(Color(red: 0.98, green: 0.94, blue: 0.89))
        RightHand()
            .stroke(Color.secondary, lineWidth: 0.5)
    }
}
