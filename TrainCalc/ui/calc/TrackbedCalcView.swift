//
//  GaugeCalcView.swift
//  TrainCalc
//
//  Created by Kornel Kaulics on 13/04/2020.
//  Copyright © 2020 Kornel Kaulics. All rights reserved.
//

import SwiftUI
import LocalAuthentication

struct TrackbedCalcView: View {
    
    @State var scale : Scale = scaleService.scale

    @State var a : Double = 0
    @State var b : Double = 0
    @State var c : Double = 0
    @State var d : Double = 0
    @State var e : Double = 0
    @State var f : Double = 0
    @State var k : Double = 0
    @State var h : Double = 0

    var body: some View {

        return VStack {
            VStack(alignment: .leading) {
                TitleRowView()
                HStack {
                    Text("T").frame(width: 32,alignment: .leading)
                    Text(translationService.trans("TOPOFRAIL")).frame(width: 300,alignment: .leading)
                }.padding(EdgeInsets.init(top: 12, leading: 0, bottom: 0, trailing: 0))
                HStack {
                    Text("a").frame(width: 32,alignment: .leading)
                    Text(String(format: "%.2f", a)).frame(width: 60,alignment: .trailing).textFieldStyle(RoundedBorderTextFieldStyle())
                    Text("mm")
                    Text("").frame(width: 35,alignment: .leading)
                    Text("b").frame(width: 32,alignment: .leading)
                    Text(String(format: "%.2f", b)).frame(width: 60,alignment: .trailing).textFieldStyle(RoundedBorderTextFieldStyle())
                    Text("mm")
                }.padding(EdgeInsets.init(top: 12, leading: 0, bottom: 0, trailing: 0))

                HStack {
                    Text("c").frame(width: 32,alignment: .leading)
                    Text(String(format: "%.2f", c)).frame(width: 60,alignment: .trailing).textFieldStyle(RoundedBorderTextFieldStyle())
                    Text("mm")
                    Text("").frame(width: 35,alignment: .leading)
                    if (scale.isNarrow()) {
                        Text("k").frame(width: 32,alignment: .leading)
                        Text(String(format: "%.2f", k)).frame(width: 60,alignment: .trailing).textFieldStyle(RoundedBorderTextFieldStyle())
                        Text("mm")
                    }  else {
                        Text("d").frame(width: 32,alignment: .leading)
                        Text(String(format: "%.2f", d)).frame(width: 60,alignment: .trailing).textFieldStyle(RoundedBorderTextFieldStyle())
                        Text("mm")

                    }
                }.padding(EdgeInsets.init(top: 12, leading: 0, bottom: 0, trailing: 0))

                HStack {
                    if (scale.isNarrow()) {
                        Text("f").frame(width: 32,alignment: .leading)
                        Text(String(format: "%.2f", f)).frame(width: 60,alignment: .trailing).textFieldStyle(RoundedBorderTextFieldStyle())
                        Text("mm")
                        Text("").frame(width: 35,alignment: .leading)
                        Text("h").frame(width: 32,alignment: .leading)
                        Text(String(format: "%.2f", h)).frame(width: 60,alignment: .trailing).textFieldStyle(RoundedBorderTextFieldStyle())
                        Text("mm")
                    } else {
                        Text("e").frame(width: 32,alignment: .leading)
                        Text(String(format: "%.2f", e)).frame(width: 60,alignment: .trailing).textFieldStyle(RoundedBorderTextFieldStyle())
                        Text("mm")
                        Text("").frame(width: 35,alignment: .leading)
                        Text("f").frame(width: 32,alignment: .leading)
                        Text(String(format: "%.2f", f)).frame(width: 60,alignment: .trailing).textFieldStyle(RoundedBorderTextFieldStyle())
                        Text("mm")
                    }
                    
                    
                }.padding(EdgeInsets.init(top: 12, leading: 0, bottom: 0, trailing: 0))
                if (!scale.isNarrow()) {
                    HStack {
                        Text("h").frame(width: 32,alignment: .leading)
                        Text(String(format: "%.2f", h)).frame(width: 60,alignment: .trailing).textFieldStyle(RoundedBorderTextFieldStyle())
                        Text("mm")
                    }.padding(EdgeInsets.init(top: 12, leading: 0, bottom: 0, trailing: 0))
                }
            }
            ZStack {
                Image(self.scale.isNarrow()  ? "trackBed" : "trackBedr").resizable().cornerRadius(12).scaledToFit().padding()
            }.frame(width:300)
            Spacer()
        }.navigationBarTitle(Text(translationService.trans("TRACKBED")), displayMode: .inline).onAppear() {
            self.scale=scaleService.scale
            calculate()
        }
    }
    
    
    func calculate() {
        if (scale.name == "Z") {
            a=12.0
            b=16.0
            c=28.0
            d=3.0
            e=2.0
            f=2.0
            h=4.0
        } else if (scale.name == "N") {
            a=16.0
            b=22.0
            c=38.0
            d=5.0
            e=3.0
            f=3.0
            h=6.0
        } else if (scale.name == "Nm") {
            a=12.0
            b=14.0
            c=26.0
            k=2.0
            f=1.5
            h=4.0
        } else if (scale.name == "TT") {
            a=22.0
            b=28.0
            c=50.0
            d=7.0
            e=4.0
            f=5.0
            h=8.0
        } else if (scale.name == "TTm") {
            a=15.0
            b=18.0
            c=35.0
            k=3.0
            f=2.5
            h=5.0
        } else if (scale.name == "TTe") {
            a=12.5
            b=16.0
            c=25.0
            k=3.0
            f=2.5
            h=3.5
        } else if (scale.name == "H0") {
            a=30.0
            b=38.0
            c=70.0
            d=9.0
            e=5.0
            f=6.0
            h=10.0
        } else if (scale.name == "H0m") {
            a=21.0
            b=25.0
            c=48.0
            k=4.0
            f=3.0
            h=6.0
        } else if (scale.name == "H0e") {
            a=17.0
            b=22.0
            c=35.0
            k=4.0
            f=3.0
            h=4.5
        } else if (scale.name == "H0i") {
            a=15.0
            b=20.0
            c=35.0
            k=4.0
            f=3.0
            h=0.0
        }
    }

}

struct TrackbedCalcView_Previews: PreviewProvider {
    static var previews: some View {
        TrackbedCalcView()
    }
}
