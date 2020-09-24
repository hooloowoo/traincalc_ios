//
//  ScaleIconView.swift
//  TrainCalc
//
//  Created by Kornel Kaulics on 13/04/2020.
//  Copyright © 2020 Kornel Kaulics. All rights reserved.
//

import Foundation

import SwiftUI

struct ScaleIconView: View {
    let scale : Scale

    var body: some View {
        VStack {
            Text(scale.name).font(Font.system(size:26))
            Text("1:"+scale.scaleString()).font(Font.system(size:12))
            Text(scale.standard).font(Font.system(size:8))
        }.frame(width: 64,height:64)
//        .background(scale.bckColor)
        .foregroundColor(scale.color).cornerRadius(3)
    }
}
