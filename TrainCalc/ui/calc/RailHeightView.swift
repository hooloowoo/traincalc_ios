//
//  GaugeCalcView.swift
//  TrainCalc
//
//  Created by Kornel Kaulics on 13/04/2020.
//  Copyright © 2020 Kornel Kaulics. All rights reserved.
//

import SwiftUI

struct RailHeightView: View {
    @State var protoHeight : String = ""
    @State var scaledHeight : String = ""
    @State var railCode : String = ""
    @State var railProfil : String = ""
    @State var scale : Scale = scaleService.scale
    
    var body: some View {
        
        let bindingScaled = Binding<String>(get: {
            self.scaledHeight
        }, set: {
            self.scaledHeight = $0
            self.protoHeight = self.calcProto(src:$0)
            self.railCode = self.calcCodeFromScaled(src:$0)
            self.railProfil = self.calcProfilFromScaled(src:$0)
        })
        
        let bindingProto = Binding<String>(get: {
            self.protoHeight
        }, set: {
            self.scaledHeight = self.calcScaled(src : $0)
            self.railCode = self.calcCodeFromProto(src:$0)
            self.protoHeight = $0
            self.railProfil = self.calcProfilFromProto(src:$0)
        })

        let bindingCode = Binding<String>(get: {
            self.railCode
        }, set: {
            self.railCode = $0
            self.scaledHeight = self.calcScaledFromCode(src:$0)
            self.protoHeight = self.calcProtoFromCode(src:$0)
            self.railProfil = self.calcProfilFromCode(src:$0)
        })

        let bindingProfil = Binding<String>(get: {
            self.railProfil
        }, set: {
            self.railProfil = $0
            self.railCode = self.calcCodeFromProfil(src:$0)
            self.scaledHeight = self.calcScaledFromProfil(src:$0)
            self.protoHeight = self.calcProtoFromProfil(src:$0)
        })


        return VStack {
            VStack(alignment: .leading) {
                TitleRowView()
                HStack {
                    Text(translationService.trans("RAILHEIGHT_PROTO")).frame(width: 200,alignment: .leading)
                    TextField("", text: bindingProto).frame(width: 80).textFieldStyle(RoundedBorderTextFieldStyle())
                    Text("mm")
                }
                HStack {
                    Text(translationService.trans("RAILHEIGHT_SCALED")).frame(width: 200,alignment: .leading)
                    TextField("", text: bindingScaled).frame(width: 80).textFieldStyle(RoundedBorderTextFieldStyle())
                    Text("mm")
                }
                HStack {
                    Text("Profil (NEM)").frame(width: 200,alignment: .leading)
                    TextField("", text: bindingProfil).frame(width: 80).textFieldStyle(RoundedBorderTextFieldStyle())
                    Text("")
                }
                HStack {
                    Text("CODE (NMRA)").frame(width: 200,alignment: .leading)
                    TextField("", text: bindingCode).frame(width: 80).textFieldStyle(RoundedBorderTextFieldStyle())
                    Text("")
                }
            }
            ZStack {
                Image("code").resizable().cornerRadius(12).scaledToFit().padding()
            }.frame(width:300) 
            Spacer()
        }.navigationBarTitle(Text(translationService.trans("RAILHEIGHT")), displayMode: .inline)
        .onAppear() {
            self.scale=scaleService.scale
            self.protoHeight = ""
            self.scaledHeight = ""
            self.railCode = ""
        }
    }
    
    func getFormatter() -> NumberFormatter {
        let formatter = NumberFormatter()
        formatter.locale = NSLocale.current
        formatter.numberStyle = NumberFormatter.Style.decimal
        formatter.usesGroupingSeparator = false
        return formatter
    }
    
    func calcCodeFromScaled(src : String) -> String {
        let formatter=getFormatter()
        if let dNum=formatter.number(from: src)  {
            let res = Int(Double(truncating: dNum) / 25.4 * 1000)
            return String(res).replacingOccurrences(of: ".", with: formatter.decimalSeparator)
        }
        else {
            return ""
        }
    }

    func calcCodeFromProto(src : String) -> String {
        let formatter=getFormatter()
        if let dNum=formatter.number(from: src)  {
            let res = Int(Double(truncating: dNum)  / scale.scale / 25.4 * 1000)
            return String(res).replacingOccurrences(of: ".", with: formatter.decimalSeparator)
        }
        else {
            return ""
        }
    }

    func calcScaledFromCode(src : String) -> String {
        let formatter=getFormatter()
        if let dNum=formatter.number(from: src)  {
            let res = Double(truncating: dNum) * 25.4 / 1000
            return String(format: "%.2f", res).replacingOccurrences(of: ".", with: formatter.decimalSeparator)
        }
        else {
            return ""
        }
    }

    func calcScaledFromProfil(src : String) -> String {
        let formatter=getFormatter()
        if let dNum=formatter.number(from: src)  {
            let res = Double(truncating: dNum) / 10
            return String(format: "%.2f", res).replacingOccurrences(of: ".", with: formatter.decimalSeparator)
        }
        else {
            return ""
        }
    }


    func calcProtoFromCode(src : String) -> String {
        let formatter=getFormatter()
        if let dNum=formatter.number(from: src)  {
            let res = Double(truncating: dNum) * 25.4 / 1000 * scale.scale
            return String(format: "%.2f", res).replacingOccurrences(of: ".", with: formatter.decimalSeparator)
        }
        else {
            return ""
        }
    }

    
    func calcProto(src : String) -> String {
        let formatter=getFormatter()
        if let dNum=formatter.number(from: src)  {
            let res = Int(Double(truncating: dNum) * scale.scale)
            return String(res).replacingOccurrences(of: ".", with: formatter.decimalSeparator)
        }
        else {
            return ""
        }
    }
    
    func calcScaled(src : String) -> String {
        let formatter=getFormatter()
        if let dNum=formatter.number(from: src)  {
            let res = Double(truncating: dNum) / scale.scale
            return String(format: "%.2f", res).replacingOccurrences(of: ".", with: formatter.decimalSeparator)
        }
        else {
            return ""
        }
    }
    
    func calcProfilFromScaled(src : String) -> String {
        let formatter=getFormatter()
        if let dNum=formatter.number(from: src)  {
            let res = Double(truncating: dNum) * 10
            return String(format: "%.0f", res).replacingOccurrences(of: ".", with: formatter.decimalSeparator)
        }
        else {
            return ""
        }
    }
    
    func calcProfilFromProto(src : String) -> String {
        let formatter=getFormatter()
        if let dNum=formatter.number(from: src)  {
            let res = Double(truncating: dNum) / scale.scale * 10
            return String(format: "%.0f", res).replacingOccurrences(of: ".", with: formatter.decimalSeparator)
        }
        else {
            return ""
        }
    }
    
    func calcProfilFromCode(src : String) -> String {
        let formatter=getFormatter()
        if let dNum=formatter.number(from: src)  {
            let res = Double(truncating: dNum) * 25.4 / 100
            return String(format: "%.0f", res).replacingOccurrences(of: ".", with: formatter.decimalSeparator)
        }
        else {
            return ""
        }
    }

    func calcCodeFromProfil(src : String) -> String {
        let formatter=getFormatter()
        if let dNum=formatter.number(from: src)  {
            let res = Int(Double(truncating: dNum) / 25.4 * 100)
            return String(res).replacingOccurrences(of: ".", with: formatter.decimalSeparator)
        }
        else {
            return ""
        }
    }


    func calcProtoFromProfil(src : String) -> String {
        let formatter=getFormatter()
        if let dNum=formatter.number(from: src)  {
            let res = Int(Double(truncating: dNum) * scale.scale /  10)
            return String(res).replacingOccurrences(of: ".", with: formatter.decimalSeparator)
        }
        else {
            return ""
        }
    }
}

struct RailHeightView_Previews: PreviewProvider {
    static var previews: some View {
        RailHeightView()
    }
}
