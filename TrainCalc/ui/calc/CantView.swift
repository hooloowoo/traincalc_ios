//
//  CantView.swift
//  TrainCalc
//
//  Created by Kornel Kaulics on 11/09/2020.
//  Copyright © 2020 Kornel Kaulics. All rights reserved.
//

import SwiftUI

struct CantView: View {
    
    @State var scale : Scale = scaleService.scale

    var body: some View {

        return VStack {
            VStack(alignment: .leading) {
                TitleRowView()
                HStack {
                    Text(translationService.trans("CANT_MAX")+" (c)").frame(width: 200,alignment: .leading)
                    Text(String(scale.cant)).frame(width: 80,alignment: .trailing).textFieldStyle(RoundedBorderTextFieldStyle())
                    Text("mm")
                }.padding(EdgeInsets.init(top: 12, leading: 0, bottom: 0, trailing: 0))
            }
            ZStack {
                Image("cant").resizable().cornerRadius(12).scaledToFit().padding()
            }.frame(width:300)
            Spacer()
        }.navigationBarTitle(Text(translationService.trans("CANT")), displayMode: .inline).onAppear() {
            self.scale = scaleService.scale
        }
    }
    
}

struct CantView_Previews: PreviewProvider {
    static var previews: some View {
        CantView()
    }
}

