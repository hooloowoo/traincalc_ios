//
//  ScaleService.swift
//  TrainCalc
//
//  Created by Kornel Kaulics on 13/04/2020.
//  Copyright © 2020 Kornel Kaulics. All rights reserved.
//

import SwiftUI

let scaleService = ScaleService()

class ScaleService {
    
    let scales : [Scale] = [
        Scale(name: "H0",scale:87,standard:"NEM",trackDistStation: 52,trackDistLine: 46,cant: 1,minRadius: 495,rStation: 577.5,rBranch: 660,rMain: 742.5, gaugeFrom: 1250, gaugeTo: 1699,gauge: 16.5,color : Color(red:1.0,green:0.0,blue:0.0),guidingRailDist: 1.5),
        Scale(name: "H0m",scale:87,standard:"NEM",trackDistStation: 52,trackDistLine: 46,cant: 0.8,minRadius: 180,rStation: 240,rBranch: 300,rMain: 360,gaugeFrom: 850, gaugeTo: 1249,gauge: 12.0,color : Color(red:0.9,green:0.25,blue:0.25),guidingRailDist: 1.3),
        Scale(name: "H0e",scale:87,standard:"NEM",trackDistStation: 52,trackDistLine: 46,cant: 0.6,minRadius: 135,rStation: 180,rBranch: 225,rMain: 270,gaugeFrom: 650, gaugeTo: 849,gauge: 9.0,color : Color(red:1.0,green:0.5,blue:0.0),guidingRailDist: 1.2),
        Scale(name: "H0i",scale:87,standard:"NEM",trackDistStation: 52,trackDistLine: 46,cant: 0.4,minRadius: 97.5,rStation: 130,rBranch: 162.5,rMain: 195,gaugeFrom: 400, gaugeTo: 649,gauge: 6.5,color : Color(red:0.8,green:0.7,blue:0.5),guidingRailDist: 0.9),
        Scale(name: "TT",scale:120,standard:"NEM",trackDistStation: 38,trackDistLine: 34,cant: 0.8,minRadius: 360,rStation: 420,rBranch: 480,rMain: 540,gaugeFrom: 1250, gaugeTo: 1699,gauge: 12.0,color : Color(red:0.0,green:1.0,blue:0.0),guidingRailDist: 1.3),
        Scale(name: "TTm",scale:120,standard:"NEM",trackDistStation: 38,trackDistLine: 34,cant: 0.6,minRadius: 135,rStation: 180,rBranch: 225,rMain: 270,gaugeFrom: 850, gaugeTo: 1249,gauge: 9.0,color : Color(red:0.3,green:0.7,blue:0.3),guidingRailDist: 1.2),
        Scale(name: "TTe",scale:120,standard:"NEM",trackDistStation: 38,trackDistLine: 34,cant: 0.4,minRadius: 97.5,rStation: 130,rBranch: 162.5,rMain: 195,gaugeFrom: 650, gaugeTo: 849,gauge: 6.5,color : Color(red:0.0,green:1.0,blue:0.75),guidingRailDist: 0.9),
        Scale(name: "N",scale:160,standard:"NEM",trackDistStation: 28,trackDistLine: 25,cant: 0.6,minRadius: 270,rStation: 315,rBranch: 360,rMain: 405,gaugeFrom: 1250, gaugeTo: 1699,gauge: 9.0,color : Color(red:0.0,green:0.0,blue:1.0),guidingRailDist: 1.2),
        Scale(name: "Nm",scale:160,standard:"NEM",trackDistStation: 28,trackDistLine: 25,cant: 0.4,minRadius: 97.5,rStation: 130,rBranch: 162.5,rMain: 195,gaugeFrom: 850, gaugeTo: 1249,gauge: 6.5,color : Color(red:0.0,green:0.5,blue:1.0),guidingRailDist: 0.9),
        Scale(name: "Z",scale:220,standard:"NEM",trackDistStation: 21,trackDistLine: 19,cant: 0.4,minRadius: 195,rStation: 227.5,rBranch: 260,rMain: 292.5,gaugeFrom: 1250, gaugeTo: 1699,gauge: 6.5,color : Color(red:1.0,green:0.0,blue:1.0),guidingRailDist: 0.9)
    ]
    
    var scale : Scale

    init() {
        self.scale = scales[0]
    }
    
    func scaleFromProtoGauge(_ src : Double) {
        var res=scale
        scales.forEach { sc in
            let iSrc=Int(src)
            if (scale.scale == sc.scale) && (iSrc >= sc.gaugeFrom) && (iSrc <= sc.gaugeTo) {
                res=sc
            }
        }
        scale=res
    }
    

}
