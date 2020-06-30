//
//  Dictionaries.swift
//  ConvertMate
//
//  Created by Richárd Hardi on 2020. 06. 08..
//  Copyright © 2020. Richárd Hardi. All rights reserved.
//

import UIKit

enum Dictionary {
    static let volume = [
        "CupCup": 1.00,
        "CupLiter": 0.2366,
        "CupMililiter": 236.58,
        "CupOunces" : 8,
        "CupTableSpoon": 16,
        "CupTeaSpoon": 48,
        
        "LiterCup": 4.2268,
        "LiterLiter": 1.00,
        "LiterMililiter": 1000,
        "LiterOunces": 33.814,
        "LiterTableSpoon" : 67.628,
        "LiterTeaSpoon": 202.884,
        
        "MililiterCup": 0.0042268,
        "MililiterLiter": 0.001,
        "MililiterMililiter": 1.00,
        "MililiterOunces" : 0.034,
        "MililiterTableSpoon": 0.068,
        "MililiterTeaspoon": 0.203,
        
        "OuncesCup": 0.125,
        "OuncesLiter": 0.0296,
        "OuncesMililiter": 29.574,
        "OuncesOunces": 1.00,
        "OuncesTableSpoon": 2,
        "OuncesTeaSpoon": 6,
        
        "TableSpoonCup": 0.0625,
        "TableSpoonLiter": 0.0148,
        "TableSpoonMililiter": 14.79,
        "TableSpoonOunces": 0.5,
        "TableSpoonTableSpoon": 1.00,
        "TableSpoonTeaSpoon": 3,
        
        "TeaSpoonCup": 0.021,
        "TeaSpoonLiter": 0.0049,
        "TeaSpoonMililiter": 4.929,
        "TeaSpoonOunces": 0.167,
        "TeaSpoonTableSpoon": 0.333,
        "TeaSpoonTeaSpoon": 1.00,

        
///
///
//
//        "KilogramKilogram": 1.00,
//        "KilogramGram": 1000,
//        "KilogramOunce": 35.274,
//        "KilogramPound": 2.205,
//        "KilogramStone": 0.157,
//
//        "GramKilogram": 0.001,
//        "GramGram": 1.00,
//        "GramOunce": 0.035,
//        "GramPound": 0.002,
//        "GramStone": 0.0002,
//
//        "OunceKilogram": 0.028,
//        "OunceGram": 28.350,
//        "OunceOunce": 1.00,
//        "OuncePound": 0.063,
//        "OunceStone": 0.005,
//
//        "PoundKilogram": 0.454,
//        "PoundGram": 453.592,
//        "PoundOunce": 16,
//        "PoundPound": 1.00,
//        "PoundStone": 0.071,
//
//        "StoneKilogram": 6.350,
//        "StoneGram": 6350.29,
//        "StoneOunce": 224,
//        "StonePound": 14,
//        "StoneStone": 1.00,
    ]
    
    static let weight = [
//        "CupCup": 1.00,
//        "CupLiter": 0.2366,
//        "CupMililiter": 236.58,
//        "CupOunces" : 8,
//        "CupTableSpoon": 16,
//        "CupTeaSpoon": 48,
//
//        "LiterCup": 4.2268,
//        "LiterLiter": 1.00,
//        "LiterMililiter": 1000,
//        "LiterOunces": 33.814,
//        "LiterTableSpoon" : 67.628,
//        "LiterTeaSpoon": 202.884,
//
//        "MililiterCup": 0.0042268,
//        "MililiterLiter": 0.001,
//        "MililiterMililiter": 1.00,
//        "MililiterOunces" : 0.034,
//        "MililiterTableSpoon": 0.068,
//        "MililiterTeaspoon": 0.203,
//
//        "OuncesCup": 0.125,
//        "OuncesLiter": 0.0296,
//        "OuncesMililiter": 29.574,
//        "OuncesOunces": 1.00,
//        "OuncesTableSpoon": 2,
//        "OuncesTeaSpoon": 6,
//
//        "TableSpoonCup": 0.0625,
//        "TableSpoonLiter": 0.0148,
//        "TableSpoonMililiter": 14.79,
//        "TableSpoonOunces": 0.5,
//        "TableSpoonTableSpoon": 1.00,
//        "TableSpoonTeaSpoon": 3,
//
//        "TeaSpoonCup": 0.021,
//        "TeaSpoonLiter": 0.0049,
//        "TeaSpoonMililiter": 4.929,
//        "TeaSpoonOunces": 0.167,
//        "TeaSpoonTableSpoon": 0.333,
//        "TeaSpoonTeaSpoon": 1.00,

///
///
        
        "KilogramKilogram": 1.00,
        "KilogramGram": 1000,
        "KilogramOunce": 35.274,
        "KilogramPound": 2.205,
        "KilogramStone": 0.157,

        "GramKilogram": 0.001,
        "GramGram": 1.00,
        "GramOunce": 0.035,
        "GramPound": 0.002,
        "GramStone": 0.0002,

        "OunceKilogram": 0.028,
        "OunceGram": 28.350,
        "OunceOunce": 1.00,
        "OuncePound": 0.063,
        "OunceStone": 0.005,

        "PoundKilogram": 0.454,
        "PoundGram": 453.592,
        "PoundOunce": 16,
        "PoundPound": 1.00,
        "PoundStone": 0.071,

        "StoneKilogram": 6.350,
        "StoneGram": 6350.29,
        "StoneOunce": 224,
        "StonePound": 14,
        "StoneStone": 1.00,
    ]
    
    static let temp = [
        "CelsiusFahrenheit": 0,
        "FahrenheitCelsius": 1,
        "CelsiusCelsius": 2,
        "FahrenheitFahrenheit": 2,
    ]
    
    static let length = [
        "MetersMeters": 1,
        "MetersCentimeters": 100,
        "MetersMilimeters": 1000,
        "MetersFoot": 3.28,
        "MetersInches": 39.37,
        
        "CentimetersMeters": 0.1,
        "CentimetersCentimeters": 1,
        "CentimetersMilimeters": 10,
        "CentimetersFoot": 0.0328,
        "CentimetersInches": 0.3937,
        
        "MilimetersMeters": 0.001,
        "MilimetersCentimeters": 0.1,
        "MilimetersMilimeters": 1,
        "MilimetersFoot": 0.00328,
        "MilimetersInches": 0.03937,
        
        "FootMeters": 0.3048,
        "FootCentimeters": 30.48,
        "FootMilimeters": 304.8,
        "FootFoot": 1,
        "FootInches": 12,
        
        "InchesMeters": 0.0254,
        "InchesCentimeters": 2.54,
        "InchesMilimeters": 25.4,
        "InchesFoot": 0.0833,
        "InchesInches": 1,
        
    ]
}
