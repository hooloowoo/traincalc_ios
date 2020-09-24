//
//  TrackDistanceView.swift
//  TrainCalc
//
//  Created by Kornel Kaulics on 11/09/2020.
//  Copyright © 2020 Kornel Kaulics. All rights reserved.
//

import SwiftUI

struct TrackDistanceView: View {
    
    @State var curveRadius : String = ""
    @State var distInCurve : String = ""
    @State var scale : Scale = scaleService.scale

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
                    Text(translationService.trans("TRACK_DIST_MIN")).frame(width: 200,alignment: .leading)
                }.padding(EdgeInsets.init(top: 12, leading: 0, bottom: 0, trailing: 0))
                HStack {
                    Text("  "+translationService.trans("TRACK_DIST_STATION")).frame(width: 200,alignment: .leading)
                    Text(String(scale.trackDistStation)).frame(width: 80,alignment: .trailing).textFieldStyle(RoundedBorderTextFieldStyle())
                    Text("mm")
                }.padding(EdgeInsets.init(top: 12, leading: 0, bottom: 0, trailing: 0))
                HStack {
                    Text("  "+translationService.trans("TRACK_DIST_LINE")).frame(width: 200,alignment: .leading)
                    Text(String(scale.trackDistLine)).frame(width: 80,alignment: .trailing).textFieldStyle(RoundedBorderTextFieldStyle())
                    Text("mm")
                }.padding(EdgeInsets.init(top: 12, leading: 0, bottom: 0, trailing: 0))
                HStack {
                    Text("  "+translationService.trans("TRACK_DIST_CURVE")).frame(width: 200,alignment: .leading)
                }.padding(EdgeInsets.init(top: 12, leading: 0, bottom: 0, trailing: 0))
                HStack {
                    Text("    "+translationService.trans("TRACK_DIST_R")).frame(width: 200,alignment: .leading)
                    TextField("", text: bindingCurve).frame(width: 80).textFieldStyle(RoundedBorderTextFieldStyle())
                    Text("mm")
                }
                HStack {
                    Text("    "+translationService.trans("TRACK_DIST_DIST")).frame(width: 200,alignment: .leading)
                    Text(distInCurve).frame(width: 80,alignment: .trailing).textFieldStyle(RoundedBorderTextFieldStyle())
                    Text("mm")
                }
            }
            ZStack {
                Image("trackDist").resizable().cornerRadius(12).scaledToFit().padding()
            }.frame(width:300)
            Spacer()
        }.navigationBarTitle(Text(translationService.trans("TRACK_DIST")+" (d)"), displayMode: .inline).onAppear() {
            self.curveRadius = ""
            scale = scaleService.scale
        }
    }
    
    func calculateCurve(src : String) -> String {
        let formatter = NumberFormatter()
        formatter.locale = NSLocale.current
        formatter.numberStyle = NumberFormatter.Style.decimal
        formatter.usesGroupingSeparator = false
        if let dNum=formatter.number(from: src) {
            let dSrc = dNum.doubleValue
            let res=self.calcCurve( r: dSrc)
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
    
    
    func calcCurve(r : Double) -> Int {
        var cdist : Int = -1;
        let scale = self.scale
        if scale.name.starts(with: "H0") {
            if r < 400 {cdist = -1}
            else if (r >= 400) && (r < 450) {cdist=64}
            else if (r >= 450) && (r < 500) {cdist=61}
            else if (r >= 500) && (r < 550) {cdist=59}
            else if (r >= 550) && (r < 600) {cdist=57}
            else if (r >= 600) && (r < 700) {cdist=55}
            else if (r >= 700) && (r < 800) {cdist=52}
            else if (r >= 800) && (r < 900) {cdist=50}
            else if (r >= 900) && (r < 1000) {cdist=48}
            else if (r >= 1000) && (r < 1200) {cdist=47}
            else {cdist=46}
        } else if scale.name.starts(with: "TT") {
            if r < 300 {cdist = -1}
            else if (r >= 300) && (r < 325) {cdist=46}
            else if (r >= 325) && (r < 350) {cdist=45}
            else if (r >= 350) && (r < 400) {cdist=43}
            else if (r >= 400) && (r < 450) {cdist=41}
            else if (r >= 450) && (r < 500) {cdist=40}
            else if (r >= 500) && (r < 550) {cdist=38}
            else if (r >= 550) && (r < 600) {cdist=37}
            else if (r >= 600) && (r < 700) {cdist=36}
            else if (r >= 700) && (r < 800) {cdist=35}
            else {cdist=34}

        } else if scale.name.starts(with: "N") {
            if r < 225 {cdist = -1}
            else if (r >= 225) && (r < 250) {cdist=35}
            else if (r >= 250) && (r < 275) {cdist=33}
            else if (r >= 275) && (r < 300) {cdist=32}
            else if (r >= 300) && (r < 325) {cdist=31}
            else if (r >= 325) && (r < 350) {cdist=30}
            else if (r >= 350) && (r < 400) {cdist=29}
            else if (r >= 400) && (r < 450) {cdist=28}
            else if (r >= 450) && (r < 500) {cdist=27}
            else if (r >= 500) && (r < 700) {cdist=26}
            else {cdist=25}

        } else if scale.name.starts(with: "Z") {
            if r < 175 {cdist = -1}
            else if (r >= 175) && (r < 200) {cdist=25}
            else if (r >= 200) && (r < 225) {cdist=24}
            else if (r >= 225) && (r < 250) {cdist=23}
            else if (r >= 250) && (r < 275) {cdist=22}
            else if (r >= 275) && (r < 325) {cdist=21}
            else if (r >= 325) && (r < 400) {cdist=20}
            else {cdist=19}

        }
        return cdist
    }
    
}

struct TrackDistanceView_Previews: PreviewProvider {
    static var previews: some View {
        TrackDistanceView()
    }
}


