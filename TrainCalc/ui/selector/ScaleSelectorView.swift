//
//  ScaleSelector.swift
//  TrainCalc
//
//  Created by Kornel Kaulics on 13/04/2020.
//  Copyright © 2020 Kornel Kaulics. All rights reserved.
//

import SwiftUI
import LocalAuthentication

struct ScaleSelectorView: View {

    var body: some View {
        VStack {
            VStack {
                HStack {
                    ScaleSelectorIconView(scale: scaleService.scales[0])
                    ScaleSelectorIconView(scale: scaleService.scales[1])
                    ScaleSelectorIconView(scale: scaleService.scales[2])
                    ScaleSelectorIconView(scale: scaleService.scales[3])
                }.padding(EdgeInsets.init(top: 0, leading: 0, bottom: 6, trailing: 0))
                HStack {
                    ScaleSelectorIconView(scale: scaleService.scales[4])
                    ScaleSelectorIconView(scale: scaleService.scales[5])
                    ScaleSelectorIconView(scale: scaleService.scales[6])
                }.padding(EdgeInsets.init(top: 0, leading: 0, bottom: 6, trailing: 0))
                HStack {
                    ScaleSelectorIconView(scale: scaleService.scales[7])
                    ScaleSelectorIconView(scale: scaleService.scales[8])
                }.padding(EdgeInsets.init(top: 0, leading: 0, bottom: 6, trailing: 0))
                HStack {
                    ScaleSelectorIconView(scale: scaleService.scales[9])
                }.padding(EdgeInsets.init(top: 0, leading: 0, bottom: 6, trailing: 0))
            }
            Spacer()
        }.navigationBarTitle("Scales").padding(EdgeInsets.init(top: 12, leading: 0, bottom: 0, trailing: 0))
    }
    
    
}

struct ScaleSelectorIconView: View {
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>

    let scale : Scale

    var body: some View {
        Button(action: {
            scaleService.scale = self.scale
            self.presentationMode.wrappedValue.dismiss()
        }) {
            ScaleIconView(scale: scale)
        }
    }
}
