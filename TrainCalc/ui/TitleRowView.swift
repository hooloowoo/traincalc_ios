//
//  TitleRow.swift
//  TrainCalc
//
//  Created by Kornel Kaulics on 13/04/2020.
//  Copyright © 2020 Kornel Kaulics. All rights reserved.
//

import SwiftUI

struct TitleRowView: View {

    @State var scale : Scale = scaleService.scale

    var body: some View {
        HStack {
            Text(translationService.trans("SCALE")).frame(width: 200,alignment: .leading)
            NavigationLink(destination: ScaleSelectorView() , label: {
                ScaleIconView(scale: scale)
            })
        }.buttonStyle(PlainButtonStyle())
        HStack {
            Text(scale.standard + " " + translationService.trans("GAUGE")).frame(width: 200,alignment: .leading)
            Text(scale.gaugeString()).frame(width: 80,alignment: .trailing).textFieldStyle(RoundedBorderTextFieldStyle())
            Text("mm")
        }.onAppear() {
            self.scale = scaleService.scale

        }

    }
}
