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

struct ContentView : View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Text("Brand Names")
                    .padding(10)
            }
                .frame(width: UIScreen.main.bounds.width, height: 44, alignment: Alignment.leading)
                .background(Color.gray)
            
            ScrollView {
                HStack {
                    ForEach(brandNames.identified(by: \.self)) {
                        Text("\($0)")
                            .padding(10)
                            .border(Color.black, width: 1, cornerRadius: 22)
                    }
                }
            }.padding(10)
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
