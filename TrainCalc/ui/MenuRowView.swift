//
//  MenuRowView.swift
//  TrainCalc
//
//  Created by Kornel Kaulics on 13/04/2020.
//  Copyright © 2020 Kornel Kaulics. All rights reserved.
//


import SwiftUI

struct MenuRowView: View {

    @State var image : String
    var titles : [String] = []

    var body: some View {
        HStack(alignment: .center) {
            Image(image).resizable().clipShape(Circle()).frame(width: 80, height: 80).cornerRadius(40).scaledToFit()
            VStack(alignment: .leading) {
                Text(titles[0]).font(.system(size: 20))
                if titles.count > 1 {
                    Text(titles[1]).font(.system(size: 20))
                }
                if titles.count > 2 {
                    Text(titles[2]).font(.system(size: 20))
                }
            }
        }
    }
}
