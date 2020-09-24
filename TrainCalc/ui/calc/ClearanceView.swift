//
//  CantView.swift
//  TrainCalc
//
//  Created by Kornel Kaulics on 11/09/2020.
//  Copyright © 2020 Kornel Kaulics. All rights reserved.
//

import SwiftUI

struct ClearanceVew: View {
    
    @State var scale : Scale = scaleService.scale

    @State var b1 : Double = 0
    @State var b2 : Double = 0
    @State var b3 : Double = 0
    @State var b4 : Double = 0
    @State var b5 : Double = 0
    @State var h1 : Double = 0
    @State var h2 : Double = 0
    @State var h3 : Double = 0
    @State var h4 : Double = 0
    @State var h5 : Double = 0

    @State var h : Double = 0
    @State var b : Double = 0


    @State var curveRadius : String = ""

    var body: some View {

        let bindingCurve = Binding<String>(get: {
            self.curveRadius
        }, set: {
            self.curveRadius = $0
            self.calculate()
        })

        return VStack {
            VStack(alignment: .leading) {
                TitleRowView()
                VStack(alignment: .leading) {
                    HStack {
                        Text(translationService.trans("CLEARANCE_R")).frame(width: 200,alignment: .leading)
                        TextField("", text: bindingCurve).frame(width: 80).textFieldStyle(RoundedBorderTextFieldStyle())
                        Text("mm")
                    }
                    HStack {
                        Text("T").frame(width: 32,alignment: .leading)
                        Text(translationService.trans("TOPOFRAIL")).frame(width: 300,alignment: .leading)
                    }.padding(EdgeInsets.init(top: 12, leading: 0, bottom: 0, trailing: 0))
                    if (scale.isNarrow()) {
                        HStack {
                            Text("B").frame(width: 32,alignment: .leading)
                            Text(String(format: "%.2f", b)).frame(width: 60,alignment: .trailing).textFieldStyle(RoundedBorderTextFieldStyle())
                            Text("mm")
                        }.padding(EdgeInsets.init(top: 12, leading: 0, bottom: 0, trailing: 0))
                        HStack {
                            Text("H").frame(width: 32,alignment: .leading)
                            Text(String(format: "%.2f", h)).frame(width: 60,alignment: .trailing).textFieldStyle(RoundedBorderTextFieldStyle())
                            Text("mm")
                        }.padding(EdgeInsets.init(top: 12, leading: 0, bottom: 0, trailing: 0))

                    } else {
                        HStack {
                            Text("B1").frame(width: 32,alignment: .leading)
                            Text(String(format: "%.2f", b1)).frame(width: 60,alignment: .trailing).textFieldStyle(RoundedBorderTextFieldStyle())
                            Text("mm")
                            Text("").frame(width: 35,alignment: .leading)
                            Text("B2").frame(width: 32,alignment: .leading)
                            Text(String(format: "%.2f", b2)).frame(width: 60,alignment: .trailing).textFieldStyle(RoundedBorderTextFieldStyle())
                            Text("mm")
                        }.padding(EdgeInsets.init(top: 12, leading: 0, bottom: 0, trailing: 0))
                        HStack {
                            Text("B3").frame(width: 32,alignment: .leading)
                            Text(String(format: "%.2f", b3)).frame(width: 60,alignment: .trailing).textFieldStyle(RoundedBorderTextFieldStyle())
                            Text("mm")
                            Text("").frame(width: 35,alignment: .leading)
                            Text("B4").frame(width: 32,alignment: .leading)
                            Text(String(format: "%.2f", b4)).frame(width: 60,alignment: .trailing).textFieldStyle(RoundedBorderTextFieldStyle())
                            Text("mm")
                        }.padding(EdgeInsets.init(top: 12, leading: 0, bottom: 0, trailing: 0))
                        HStack {
                            Text("B5").frame(width: 32,alignment: .leading)
                            Text(String(format: "%.2f", b5)).frame(width: 60,alignment: .trailing).textFieldStyle(RoundedBorderTextFieldStyle())
                            Text("mm")
                        }.padding(EdgeInsets.init(top: 12, leading: 0, bottom: 0, trailing: 0))
                        VStack(alignment: .leading) {
                            HStack {
                                Text("H1").frame(width: 32,alignment: .leading)
                                Text(String(format: "%.2f", h1)).frame(width: 60,alignment: .trailing).textFieldStyle(RoundedBorderTextFieldStyle())
                                Text("mm")
                                Text("").frame(width: 35,alignment: .leading)
                                Text("H2").frame(width: 32,alignment: .leading)
                                Text(String(format: "%.2f", h2)).frame(width: 60,alignment: .trailing).textFieldStyle(RoundedBorderTextFieldStyle())
                                Text("mm")
                            }.padding(EdgeInsets.init(top: 24, leading: 0, bottom: 0, trailing: 0))
                            HStack {
                                Text("H3").frame(width: 32,alignment: .leading)
                                Text(String(format: "%.2f", h3)).frame(width: 60,alignment: .trailing).textFieldStyle(RoundedBorderTextFieldStyle())
                                Text("mm")
                                Text("").frame(width: 35,alignment: .leading)
                                Text("H4").frame(width: 32,alignment: .leading)
                                Text(String(format: "%.2f", h4)).frame(width: 60,alignment: .trailing).textFieldStyle(RoundedBorderTextFieldStyle())
                                Text("mm")
                            }.padding(EdgeInsets.init(top: 12, leading: 0, bottom: 0, trailing: 0))
                            HStack {
                                Text("H5").frame(width: 32,alignment: .leading)
                                Text(String(format: "%.2f", h5)).frame(width: 60,alignment: .trailing).textFieldStyle(RoundedBorderTextFieldStyle())
                                Text("mm")
                            }.padding(EdgeInsets.init(top: 12, leading: 0, bottom: 0, trailing: 0))
                        }
                    }
                }
            }
            ZStack {
                Image(scale.isNarrow() ? "clearance_s" : "clearance_n").resizable().cornerRadius(12).scaledToFit().padding()
            }.frame(width:300)
            Spacer()
        }.navigationBarTitle(Text(translationService.trans("CLEARANCE")), displayMode: .inline).onAppear() {
            self.scale=scaleService.scale
            calculate()
        }
    }
    
    
    func getE(_ r : Double) -> Double {
        if (r == 0.0) { return 0.0 }
        var e=0.0
        if (scale.isNarrow()) {
            let a = (13600 / scale.scale)  / 2
            let mr = (r * r) - ( a * a)
            e = mr < 0 ? 0 : r - sqrt(mr)
        } else if (scale.name == "Z") {
            if (r < 200) {e=5}
            else if (r < 250) {e=4}
            else if (r < 325) {e=3}
            else if (r < 450) {e=2}
            else if (r < 700) {e=1}
        } else if (scale.name == "N") {
            if (r < 250) {e=7}
            else if(r < 300) {e=6}
            else if (r < 350) {e=5}
            else if (r < 450) {e=4}
            else if (r < 550) {e=3}
            else if (r < 800) {e=2}
            else if (r < 1000) {e=1}
        } else if (scale.name == "TT") {
            if(r < 325) {e=10}
            else if (r < 350) {e=9}
            else if (r < 400) {e=8}
            else if (r < 450) {e=7}
            else if (r < 500) {e=6}
            else if (r < 550) {e=5}
            else if (r < 700) {e=4}
            else if (r < 900) {e=3}
            else if (r < 1200) {e=2}
            else if (r < 1800) {e=1}
        } else if (scale.name == "H0") {
            if(r < 450) {e=14}
            else if (r < 500) {e=12}
            else if (r < 550) {e=11}
            else if (r < 600) {e=10}
            else if (r < 700) {e=9}
            else if (r < 800) {e=7}
            else if (r < 900) {e=6}
            else if (r < 1000) {e=5}
            else if (r < 1200) {e=4}
            else if (r < 1400) {e=3}
            else if (r < 1800) {e=2}
            else if (r < 2500) {e=1}
        }
        return e*2;
    }

    func calculate() {
        let formatter = NumberFormatter()
        formatter.locale = NSLocale.current
        formatter.numberStyle = NumberFormatter.Style.decimal
        formatter.usesGroupingSeparator = false
        var r=0.0
        if let dNum=formatter.number(from: self.curveRadius) {
            r = dNum.doubleValue
        }
        if (scale.name == "Z") {
            b1=20.0+getE(r);
            b2=14.0+getE(r);
            b3=18.0+getE(r);
            h1=4.0;
            h2=6.0;
            h3=18.0;
            h4=24.0;
            b4=16.0;
            b5=13.0;
            h5=27.0;
        } else if (scale.name == "Nm") {
            h=26.0;
            b=22.0+getE(r);
        } else if (scale.name == "N") {
            b1=27.0+getE(r);
            b2=18.0+getE(r);
            b3=25.0+getE(r);
            h1=6.0;
            h2=8.0;
            h3=25.0;
            h4=33.0;
            b4=22.0;
            b5=18.0;
            h5=37.0;
        } else if (scale.name == "TTe") {
            h=32.0;
            b=26.0+getE(r);
        } else if (scale.name == "TTm") {
            h=34.0;
            b=28.0+getE(r);
        } else if (scale.name == "TT") {
            b1=36.0+getE(r);
            b2=24.0+getE(r);
            b3=32.0+getE(r);
            h1=8.0;
            h2=10.0;
            h3=33.0;
            h4=43.0;
            b4=28.0;
            b5=22.0;
            h5=48.0;
        } else if (scale.name == "H0") {
            b1=48.0+getE(r);
            b2=32.0+getE(r);
            b3=42.0+getE(r);
            h1=11.0;
            h2=14.0;
            h3=45.0;
            h4=59.0;
            b4=38.0;
            b5=30.0;
            h5=65.0;
        } else if (scale.name == "H0m") {
            b=38.0+getE(r);
            h=48.0;
        } else if (scale.name == "H0e") {
            b=36.0+getE(r);
            h=46.0;
        } else if (scale.name == "H0i") {
            b=36.0+getE(r);
            h=46.0;
        }
    }
}
    
struct ClearanceVew_Previews: PreviewProvider {
    static var previews: some View {
        ClearanceVew()
    }
}

