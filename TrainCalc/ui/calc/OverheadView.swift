//
//  TrackDistanceView.swift
//  TrainCalc
//
//  Created by Kornel Kaulics on 11/09/2020.
//  Copyright © 2020 Kornel Kaulics. All rights reserved.
//

import SwiftUI

struct OverheadView: View {

    @State var scale : Scale = scaleService.scale

    @State var curveRadius : String = ""
    @State var distInCurve : String = ""
    
    @State var zigzag : Double = 0
    @State var lowPos : Int = 0
    @State var normalPos : Int = 0
    @State var highPos : Int = 0

    var body: some View {
        let bindingCurve = Binding<String>(get: {
            self.curveRadius
        }, set: {
            self.curveRadius = $0
            self.distInCurve = self.calculateCurve(src:$0)
        })

        return VStack {
            VStack(alignment: .leading) {
                TitleRowView()
                HStack {
                    Text(translationService.trans("OVERHEAD_WIRE_ZIGZAG")).frame(width: 200,alignment: .leading)
                    Text(String(self.getZigZag())).frame(width: 80,alignment: .trailing).textFieldStyle(RoundedBorderTextFieldStyle())
                    Text("mm")
                }.padding(EdgeInsets.init(top: 12, leading: 0, bottom: 0, trailing: 0))
                HStack {
                    Text(translationService.trans("OVERHEAD_WIRE_HEIGHT")+" (h)").frame(width: 200,alignment: .leading)
                }.padding(EdgeInsets.init(top: 12, leading: 0, bottom: 0, trailing: 0))
                HStack {
                    Text("  "+translationService.trans("OVERHEAD_WIRE_HIGH")).frame(width: 200,alignment: .leading)
                    Text(String(highPos)).frame(width: 80,alignment: .trailing).textFieldStyle(RoundedBorderTextFieldStyle())
                    Text("mm")
                }.padding(EdgeInsets.init(top: 12, leading: 0, bottom: 0, trailing: 0))
                HStack {
                    Text("  "+translationService.trans("OVERHEAD_WIRE_NORMAL")).frame(width: 200,alignment: .leading)
                    Text(String(normalPos)).frame(width: 80,alignment: .trailing).textFieldStyle(RoundedBorderTextFieldStyle())
                    Text("mm")
                }.padding(EdgeInsets.init(top: 12, leading: 0, bottom: 0, trailing: 0))
                HStack {
                    Text("  "+translationService.trans("OVERHEAD_WIRE_LOW")).frame(width: 200,alignment: .leading)
                    Text(String(lowPos)).frame(width: 80,alignment: .trailing).textFieldStyle(RoundedBorderTextFieldStyle())
                    Text("mm")
                }.padding(EdgeInsets.init(top: 12, leading: 0, bottom: 0, trailing: 0))
                HStack {
                    Text(translationService.trans("OVERHEAD_WIRE_MAST")).frame(width: 200,alignment: .leading)
                }.padding(EdgeInsets.init(top: 12, leading: 0, bottom: 0, trailing: 0))
                HStack {
                    Text("  "+translationService.trans("OVERHEAD_WIRE_R")).frame(width: 200,alignment: .leading)
                    TextField("", text: bindingCurve).frame(width: 80).textFieldStyle(RoundedBorderTextFieldStyle())
                    Text("mm")
                }
                HStack {
                    Text("  "+translationService.trans("OVERHEAD_WIRE_DIST")).frame(width: 200,alignment: .leading)
                    Text(distInCurve).frame(width: 80,alignment: .trailing).textFieldStyle(RoundedBorderTextFieldStyle())
                    Text("mm")
                }
            }
            ZStack {
                Image("overhead").resizable().cornerRadius(12).scaledToFit().padding()
            }.frame(width:300)
            Spacer()
        }.navigationBarTitle(Text(translationService.trans("OVERHEAD_WIRE_POS")), displayMode: .inline).onAppear() {
            self.curveRadius = ""
            scale = scaleService.scale
            calculate()
        }
    }
    

    func calculateCurve(src : String) -> String {
        let formatter = NumberFormatter()
        formatter.locale = NSLocale.current
        formatter.numberStyle = NumberFormatter.Style.decimal
        formatter.usesGroupingSeparator = false
        if let dNum=formatter.number(from: src) {
            let r = dNum.doubleValue
            let res=Int(4 * sqrt(r*zigzag))
            if res == -1 {
                return "-"
            } else {
                return String(res)
            }
        }
        else {
            return src
        }
    }
    
    func calculate() {
        zigzag=getZigZag()
        lowPos=getLowPos()
        normalPos=getNormalPos()
        highPos=getHighPos()
    }
    
    func getZigZag() -> Double {
        let scale = self.scale
        if scale.name.starts(with: "H0") {
            return 3.0
        } else if scale.name.starts(with: "TT") {
            return 2.0
        } else if scale.name.starts(with: "N") {
            return 1.5
        } else if scale.name.starts(with: "Z") {
            return 1.0
        }
        return 0
    }
    
    func getLowPos() -> Int {
        let scale = self.scale
        if scale.name == "H0" {
            return 60
        } else if scale.name.starts(with: "H0") {
            return 50
        } else if scale.name == "TT" {
            return 44
        } else if scale.name.starts(with: "TT") {
            return 38
        } else if scale.name == "N" {
            return 34
        } else if scale.name.starts(with: "N") {
            return 29
        } else if scale.name == "Z" {
            return 25
        }
        return 0
    }

    func getNormalPos() -> Int {
        let scale = self.scale
        if scale.name == "H0" {
            return 69
        } else if scale.name.starts(with: "H0") {
            return 65
        } else if scale.name == "TT" {
            return 50
        } else if scale.name.starts(with: "TT") {
            return 47
        } else if scale.name == "N" {
            return 38
        } else if scale.name.starts(with: "N") {
            return 35
        } else if scale.name == "Z" {
            return 28
        }
        return 0
    }
    
    func getHighPos() -> Int {
        let scale = self.scale
        if scale.name == "H0" {
            return 73
        } else if scale.name.starts(with: "H0") {
            return 70
        } else if scale.name == "TT" {
            return 52
        } else if scale.name.starts(with: "TT") {
            return 51
        } else if scale.name == "N" {
            return 40
        } else if scale.name.starts(with: "N") {
            return 38
        } else if scale.name == "Z" {
            return 30
        }
        return 0
    }

}

struct OverheadView_Previews: PreviewProvider {
    static var previews: some View {
        OverheadView()
    }
}


