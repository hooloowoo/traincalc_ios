//
//  GaugeCalcView.swift
//  TrainCalc
//
//  Created by Kornel Kaulics on 13/04/2020.
//  Copyright © 2020 Kornel Kaulics. All rights reserved.
//

import SwiftUI

struct GaugeCalcView: View {
    @State var protoGauge : String = ""
    @State var scaledGauge : String = ""
    
    @State var scale : Scale = scaleService.scale
    var body: some View {
        
        let bindingScaled = Binding<String>(get: {
            self.protoGauge
        }, set: {
            self.protoGauge = $0
            self.scaledGauge = self.calcScaled(src:$0)
        })
        
        let bindingProto = Binding<String>(get: {
            self.scaledGauge
        }, set: {
            self.protoGauge = self.calcProto(src : $0)
            self.scaledGauge = $0
        })

        return VStack {
            VStack(alignment: .leading) {
                HStack {
                    Text(translationService.trans("SCALE")).frame(width: 200,alignment: .leading)
                    NavigationLink(destination: ScaleSelectorView() , label: {
                        ScaleIconView(scale: scale)
                    })
                }.buttonStyle(PlainButtonStyle()).padding(EdgeInsets.init(top: 12, leading: 0, bottom: 0, trailing: 0))
                HStack {
                    Text(translationService.trans("PROTO_GAUGE")).frame(width: 200,alignment: .leading)
                    TextField("", text: bindingProto).frame(width: 80).textFieldStyle(RoundedBorderTextFieldStyle())
                    Text("mm")
                }
                HStack {
                    Text(translationService.trans("SCALED_GAUGE")).frame(width: 200,alignment: .leading)
                    TextField("", text: bindingScaled).frame(width: 80).textFieldStyle(RoundedBorderTextFieldStyle())
                    Text("mm")
                }
                HStack {
                    Text(scaleService.scale.standard + " " + translationService.trans("GAUGE")).frame(width: 200,alignment: .leading)
                    Text(scaleService.scale.gaugeString()).frame(width: 80,alignment: .trailing).textFieldStyle(RoundedBorderTextFieldStyle())
                    Text("mm")
                }.padding(EdgeInsets.init(top: 12, leading: 0, bottom: 0, trailing: 0))
            }
            ZStack {
                Image("gauge").resizable().cornerRadius(12).scaledToFit().padding()
            }.frame(width:300)
            Spacer()
        }.navigationBarTitle(Text(translationService.trans("GAUGE")), displayMode: .inline)
        .onAppear() {
            self.scale=scaleService.scale
            self.protoGauge = ""
            self.scaledGauge = ""
        }
    }
    
    func calcProto(src : String) -> String {
        let formatter = NumberFormatter()
        formatter.locale = NSLocale.current
        formatter.numberStyle = NumberFormatter.Style.decimal
        formatter.usesGroupingSeparator = false
        if let dNum=formatter.number(from: src) {
            let dSrc = dNum.doubleValue
            let res=dSrc / scaleService.scale.scale
            scaleService.scaleFromProtoGauge(dSrc)
            self.scale=scaleService.scale
            return String(format: "%.2f", res).replacingOccurrences(of: ".", with: formatter.decimalSeparator)
        }
        else {
            return src
        }
    }
    
    func calcScaled(src : String) -> String {
        let formatter = NumberFormatter()
        formatter.locale = NSLocale.current
        formatter.numberStyle = NumberFormatter.Style.decimal
        formatter.usesGroupingSeparator = false
        if let dNum=formatter.number(from: src) {
            let dSrc = dNum.doubleValue
            let res=dSrc * scaleService.scale.scale
            scaleService.scaleFromProtoGauge(res)
            self.scale=scaleService.scale
            return String(format: "%.2f", res).replacingOccurrences(of: ".", with: formatter.decimalSeparator)
        }
        else {
            return src
        }
    }
}

struct GaugeCalcView_Previews: PreviewProvider {
    static var previews: some View {
        GaugeCalcView()
    }
}
