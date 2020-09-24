//
//  SettingsView.swift
//  TrainCalc
//
//  Created by Kornel Kaulics on 13/04/2020.
//  Copyright © 2020 Kornel Kaulics. All rights reserved.
//
import SwiftUI
import LocalAuthentication

struct SettingsView: View {
    
    @State private var index = translationService.languages.firstIndex(of: translationService.lang)
    @State var updater = false
    
    @State var lang : String = translationService.lang
    
    var body: some View {

        let langBinding = Binding<Int>(get: {
            return self.index!
        }, set: {
            self.index = $0
            self.updater.toggle()
            translationService.setLang(idx: $0)
        })


        VStack {
            VStack(alignment: .leading) {
                VStack {
                    Picker(selection:  langBinding, label: Text("")) {
                        ForEach(0 ..< translationService.languageNames.count) {
                            Text(translationService.languageNames[$0])
                        }
                    }
                }
            }.padding()
            Spacer()
        }.navigationBarTitle(Text(translationService.trans("SETTINGS")), displayMode: .inline)
    }
    
    
}

