//
//  Notification+EXT.swift
//  ConvertMate
//
//  Created by Richárd Hardi on 2020. 06. 09..
//  Copyright © 2020. Richárd Hardi. All rights reserved.
//

import Foundation

extension Notification.Name {
    static let fromButtonPressed = Notification.Name("cm.from.button.has.pressed")
    static let toButtonPressed = Notification.Name("cm.to.button.has.pressed")
    static let textFieldEdited = Notification.Name("cm.textfield.edited")
    
    static let calculateVolume = Notification.Name("cm.calculate.volume")
    static let calculateWeight = Notification.Name("cm.calculate.weight")
    static let calculateTemp = Notification.Name("cm.calculate.temp")
    
}
