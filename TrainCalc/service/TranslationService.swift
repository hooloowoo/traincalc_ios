//
//  ScaleService.swift
//  TrainCalc
//
//  Created by Kornel Kaulics on 13/04/2020.
//  Copyright © 2020 Kornel Kaulics. All rights reserved.
//

import SwiftUI

let translationService = TranslationService()

class TranslationService {
    
    var lang : String = "en"
    
    let languageNames : [String] = ["English","Deutsch","Magyar"]
    let languages : [String] = ["en","de","hu"]
    
    let dict=[
        "MAIN_TITLE" :  ["en":"Model Calculator",   "de":"Modell Rechner",  "hu":"Modell kalkulátor"],
        "GAUGES" :      ["en":"Gauges",             "de":"Spurweiten",      "hu":"Nyomtávok"],

        "GUIDING_RAIL" :      ["en":"Guiding Rails",         "de":"Schutzschienen",      "hu":"Vezetősínek"],
        "MIN_DISTANCE" :      ["en":"Min. distance",         "de":"Min. Abstand",      "hu":"Min. távolság"],
        "PROTO_GAUGE" :      ["en":"Proto gauge (1:1)",      "de":"Vorbildspurweite (1:1)",      "hu":"Eredeti nyomtáv (1:1)"],
        "SCALED_GAUGE" :      ["en":"Scaled gauge",          "de":"Maßstäbliche Spurweite",      "hu":"Arányos nyomtáv"],

        "CURVE_RADIUS" :      ["en":"Curve radius",          "de":"Bogenradius",      "hu":"Ívsugár"],
        "CURVE_MIN_RADIUS" :      ["en":"Minimum radius",          "de":"Kleinste Bogenradien",      "hu":"Minimáis ívsugár"],
        "CURVE_REC_RADIUS" :      ["en":"Recommended minimum radius",          "de":"empfohlener kleinster Bogenradius",      "hu":"Ajánlott legksebb ívsugár"],
        "CURVE_STATION" :      ["en":"at stations",          "de":"in Bahnhöfen",      "hu":"állomásokon"],
        "CURVE_BRANCH" :      ["en":"on branch lines",          "de":"auf Nebenbahnen",      "hu":"mellékvonalakon"],
        "CURVE_MAIN" :      ["en":"on main lines",          "de":"auf Hauptbahnen",      "hu":"fővonalakon"],
        "CURVE_RADIUS_COMMENT":[
            "en":"The minimum radius also depends on the rolling stocks you'd like to run. Please check your vehicle's description to determine the minimum radius on your layout.",
            "de":"Der Mindestradius hängt auch von den Fahrzeugen ab, die Sie an Ihrer Anlage fahren möchten. Bitte überprüfen Sie die Beschreibung Ihres Fahrzeugs, um den Mindestradius an Ihrem Layout zu bestimmen",
            "hu":"A legkisebb ívsugár megállapításakor vegyük figyelembe a terepasztalra szánt járművek paramétereit is! A gyártók általában jelzik, hogy a jármű milyen ívsugáron fut még el."],
        
        "CANT" :      ["en":"Cant in curves",          "de":"Überhöhung im Gleisbogen",      "hu":"Túlemelés ívekben"],
        "CANT_MAX" :      ["en":"Maximum elevation",          "de":"Maximale Überhöhung",      "hu":"Maximális túlemelés"],

        "TRACK_DIST" :      ["en":"Track distance",          "de":"Gleisabstand",      "hu":"Vágánytengely távolság"],
        "TRACK_DIST_DIST" :      ["en":"distance",          "de":"abstand",      "hu":"távolság"],
        "TRACK_DIST_MIN": ["en":"Minimum distance",          "de":"Mindestabstand",      "hu":"Minimális távolság"],
        "TRACK_DIST_STATION" :      ["en":"at stations",          "de":"in Bahnhöfen",      "hu":"állomásokon"],
        "TRACK_DIST_LINE" :      ["en":"on lines",          "de":"auf freier Strecke",      "hu":"nyílt vonalon"],
        "TRACK_DIST_CURVE" :      ["en":"Radius",          "de":"im Bogen",      "hu":"ívben"],
        "TRACK_DIST_R" :      ["en":"Radius",          "de":"Radius",      "hu":"Ívsugár"],
        
        "OVERHEAD_WIRE_POS" :      ["en":"Overhead wire position",          "de":"Fahrdrahtlage",      "hu":"Felsővezeték"],
        "OVERHEAD_WIRE_ZIGZAG" :      ["en":"Max. horiz. deflection",          "de":"größte Seitenabweichung",      "hu":"Vízszintes elmozdulás"],

        "OVERHEAD_WIRE_HIGH" :      ["en":"highest",          "de":"höchste",      "hu":"legmagasabb"],
        "OVERHEAD_WIRE_NORMAL" :      ["en":"normal",          "de":"normal",      "hu":"normál"],
        "OVERHEAD_WIRE_LOW" :      ["en":"lowest",          "de":"tiefste",      "hu":"legalacsonyabb"],
        "OVERHEAD_WIRE_HEIGHT" :      ["en":"Height",          "de":"Lage",      "hu":"Magasság"],
        "OVERHEAD_WIRE_MAST" :      ["en":"Distance of masts",          "de":"Mastabstand",      "hu":"Oszloptávolság"],
        "OVERHEAD_WIRE_R" :      ["en":"curve radius",          "de":"Bogenradien",      "hu":"Ívsugár"],
        "OVERHEAD_WIRE_DIST" :      ["en":"distance",          "de":"Abstand",      "hu":"távolság"],

        "RAILHEIGHT" :      ["en":"Rail height",          "de":"Schienenprofilhöhe",      "hu":"Sínmagasság"],
        "RAILHEIGHT_PROTO" :      ["en":"Proto height (1:1)",      "de":"Vorbildhöhe (1:1)",      "hu":"Eredeti magasság (1:1)"],
        "RAILHEIGHT_SCALED" :      ["en":"Scaled height",          "de":"Maßstäbliche höhe",      "hu":"Arányos magasság"],

        "CLEARANCE" :    ["en":"Clearance",           "de":"Lichtraum",    "hu":"Űrszelvény"],
        "CLEARANCE_R" :      ["en":"Curve radius",          "de":"Bogenradien",      "hu":"Ívsugár"],
        "TRACKBED" :    ["en":"Trackbed",           "de":"Bahnkörper",    "hu":"Ágyazat"],
        "TOPOFRAIL" :    ["en":"Top of the rails",           "de":"Schienenoberkante",    "hu":"Sínkorona"],

        
        "SETTINGS" :    ["en":"Settings",           "de":"Einstellungen",    "hu":"Beállítások"],

        "GAUGE" :       ["en":"Gauge (G)",          "de":"Spurweite (G)",   "hu":"Nyomtáv (G)"],
        "SCALE" :       ["en":"Scale",              "de":"Nenngröße",       "hu":"Méret"],
        "NORM" :        ["en":"Standard",           "de":"Norm de",         "hu":"Szabvány"]
    ]

    
    func trans(_ code : String) -> String {
        let itxt=dict[code]
        return itxt![lang]!
    }
    
    func setLang(idx: Int) {
        lang=languages[idx]
    }
}
