//
//  CurveRadiusView.swift
//  TrainCalc
//
//  Created by Kornel Kaulics on 11/09/2020.
//  Copyright © 2020 Kornel Kaulics. All rights reserved.
//

import SwiftUI

struct CurveRadiusView: View {
    
    @State var scale : Scale = scaleService.scale
    
    var body: some View {

        return VStack {
            VStack(alignment: .leading) {
                TitleRowView()
                HStack {
                    Text(translationService.trans("CURVE_MIN_RADIUS")).frame(width: 200,alignment: .leading)
                    Text(String(scale.minRadius)).frame(width: 80,alignment: .trailing).textFieldStyle(RoundedBorderTextFieldStyle())
                    Text("mm")
                }.padding(EdgeInsets.init(top: 12, leading: 0, bottom: 0, trailing: 0))
            }
            Divider()
            VStack(alignment: .leading) {
                HStack {
                    Text(translationService.trans("CURVE_REC_RADIUS")).frame(width: 300,alignment: .leading)
                }
                HStack {
                    Text("  " + translationService.trans("CURVE_STATION")).frame(width: 200,alignment: .leading)
                    Text(String(scale.rStation)).frame(width: 80,alignment: .trailing).textFieldStyle(RoundedBorderTextFieldStyle())
                    Text("mm")
                }.padding(EdgeInsets.init(top: 12, leading: 0, bottom: 0, trailing: 0))
                HStack {
                    Text("  " + translationService.trans("CURVE_BRANCH")).frame(width: 200,alignment: .leading)
                    Text(String(scale.rBranch)).frame(width: 80,alignment: .trailing).textFieldStyle(RoundedBorderTextFieldStyle())
                    Text("mm")
                }.padding(EdgeInsets.init(top: 12, leading: 0, bottom: 0, trailing: 0))
                HStack {
                    Text("  " + translationService.trans("CURVE_MAIN")).frame(width: 200,alignment: .leading)
                    Text(String(scale.rMain)).frame(width: 80,alignment: .trailing).textFieldStyle(RoundedBorderTextFieldStyle())
                    Text("mm")
                }.padding(EdgeInsets.init(top: 12, leading: 0, bottom: 0, trailing: 0))
            }
            Text(translationService.trans("CURVE_RADIUS_COMMENT"))
                .frame(width: 360,alignment: .center)
                .padding(EdgeInsets.init(top: 12, leading: 0, bottom: 0, trailing: 0))
            ZStack {
                Image("curve").resizable().cornerRadius(12).scaledToFit().padding()
            }.frame(width:300)
            Spacer()
        }.navigationBarTitle(Text(translationService.trans("CURVE_RADIUS")+" (r)"), displayMode: .inline).onAppear() {
            scale = scaleService.scale
        }
    }
    
}

struct CurveRadiusView_Previews: PreviewProvider {
    static var previews: some View {
        CurveRadiusView()
    }
}
