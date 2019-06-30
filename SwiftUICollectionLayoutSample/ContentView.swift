//
//  ContentView.swift
//  SwiftUICollectionLayoutSample
//
//  Created by Yuichi Fujiki on 28/6/19.
//  Copyright © 2019 Yuichi Fujiki. All rights reserved.
//

import SwiftUI

// MARK: Data
private let brandNames = [
    "Purina",
    "Fancy Feast",
    "Royal Feline",
    "Wilderness",
    "KM",
    "Instinct"
]

private let catFoods: [String] = {
    var imageNames = [String]()
    for i in 1...10 {
        let imageName = String(format: "catfood_%03d", i)
        imageNames.append(imageName)
    }
    return imageNames
}()

private let cats: [String] = {
    var imageNames = [String]()
    for i in 1...10 {
        let imageName = "\(i).cat"
        imageNames.append(imageName)
    }
    return imageNames
}()

// MARK: - Header View
struct HeaderView: View {
    @State var headerText: String

    var body: some View {
        HStack {
            Text(headerText)
                .color(.white)
                .padding(10)
            }
            .frame(width: UIScreen.main.bounds.width, height: 44, alignment: Alignment.leading)
            .background(Color.gray)
    }
}

struct ContentView : View {
    var body: some View {
        ScrollView{
            VStack(alignment: .leading, spacing: 16) {
                // MARK: - Brand Names Section
                HeaderView(headerText: "Brand Names")
                
                ScrollView(showsHorizontalIndicator: false) {
                    HStack {
                        ForEach(brandNames.identified(by: \.self)) {
                            Text("\($0)")
                                .frame(width: UIScreen.main.bounds.width / 3 - 30)
                                .padding(10)
                                .border(Color.black, width: 1, cornerRadius: 22)
                        }
                    }
                    .padding(10)
                }
                    .frame(height: 64)
                
            
                // MARK: - Cat Foods Section
                HeaderView(headerText: "Cat Foods")
                ScrollView(showsHorizontalIndicator: false) {
                    HStack {
                        ForEach(catFoods.identified(by: \.self)) {
                            Image($0)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: UIScreen.main.bounds.width / 2 - 40, height: 100)
                                .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
                        }
                    }.padding(10)
                }
                    .frame(height: 120)
                
                // MARK: - Cats Section
                HeaderView(headerText: "Cats")
                ForEach(cats.identified(by: \.self)) {
                    Image($0)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: UIScreen.main.bounds.width - 20, height: (UIScreen.main.bounds.width - 20) * 0.67)
                        .cornerRadius(10)
                        .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
                }
            }
        }
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
