//
//  Scale.swift
//  TrainCalc
//
//  Created by Kornel Kaulics on 13/04/2020.
//  Copyright © 2020 Kornel Kaulics. All rights reserved.
//

import Foundation
import SwiftUI

struct Scale : Identifiable {
    let id = UUID()
    let name : String
    let scale : Double
    let standard : String
    let trackDistStation: Int
    let trackDistLine: Int
    let cant : Double
    let minRadius : Double
    let rStation : Double
    let rBranch : Double
    let rMain : Double
    let gaugeFrom : Int
    let gaugeTo : Int
    let gauge : Double
    let color : Color
    let guidingRailDist : Double
    
    func isNarrow() -> Bool {
        return (gaugeTo < 1450)
    }
    
    func scaleString() -> String {
        if (floor(scale) == scale) {
            return String(Int(scale))
        } else {
            return String(scale)
        }
    }
    
    func protoGaugeString() -> String {
        return "" + String(gaugeFrom) + " - " + String(gaugeTo) + "mm"
    }
    
    func gaugeString() -> String {
        if (floor(gauge) == gauge) {
            return String(Int(gauge))
        } else {
            return String(gauge)
        }
    }
}
