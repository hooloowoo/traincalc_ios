//
//  ContentView.swift
//  TrainCalc
//
//  Created by Kornel Kaulics on 28/03/2020.
//  Copyright © 2020 Kornel Kaulics. All rights reserved.
//

import SwiftUI
import UIKit

struct ContentView: View {
    
    init() {
        UINavigationBar.appearance().isOpaque = true
    }
    
    @State var updater : Bool = false
    var body: some View {
        NavigationView {
            VStack(alignment: .leading)  {
                List {
                    HStack {
                        NavigationLink(destination: GaugeCalcView() , label: {MenuRowView(image: "gauge_av", titles : [translationService.trans("GAUGES")])})
                    }
                    HStack {
                        NavigationLink(destination: GuidingRailsView() , label: {MenuRowView(image: "guide_av", titles : [translationService.trans("GUIDING_RAIL")])})
                    }
                    HStack {
                        NavigationLink(destination: CurveRadiusView() , label: {MenuRowView(image: "curve_av", titles : [translationService.trans("CURVE_RADIUS")])})
                    }
                    HStack {
                        NavigationLink(destination: CantView() , label: {MenuRowView(image: "cant_av", titles : [translationService.trans("CANT")])})
                    }
                    HStack {
                        NavigationLink(destination: TrackDistanceView() , label: {MenuRowView(image: "tdist_av", titles : [translationService.trans("TRACK_DIST")])})
                    }
                    Group {
                        HStack {
                            NavigationLink(destination: OverheadView() , label: {MenuRowView(image: "overhead_av", titles : [translationService.trans("OVERHEAD_WIRE_POS")])})
                        }
                        HStack {
                            NavigationLink(destination: RailHeightView() , label: {MenuRowView(image: "code_av", titles : [translationService.trans("RAILHEIGHT")])})
                        }
                        HStack {
                            NavigationLink(destination: ClearanceVew() , label: {MenuRowView(image: "clearance_s", titles : [translationService.trans("CLEARANCE")])})
                        }
                        HStack {
                            NavigationLink(destination: TrackbedCalcView() , label: {MenuRowView(image: "trackbed_av", titles : [translationService.trans("TRACKBED")])})
                        }
                        HStack {
                            NavigationLink(destination: SettingsView() , label: {MenuRowView(image: "defaultAvatar", titles : [translationService.trans("SETTINGS")])})
                        }
                    }
                }
                Text(updater ? "" : " ")
                Spacer()
            }.navigationBarTitle(Text(translationService.trans("MAIN_TITLE")))
            .onAppear() {
                updater.toggle()
            }
            GaugeCalcView()
        }.accentColor(.primary)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

