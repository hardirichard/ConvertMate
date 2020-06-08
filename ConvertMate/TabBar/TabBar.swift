//
//  TabBar.swift
//  ConvertMate
//
//  Created by Richárd Hardi on 2020. 06. 05..
//  Copyright © 2020. Richárd Hardi. All rights reserved.
//

import UIKit

class TabBar: UITabBarController {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        UITabBar.appearance().tintColor = .systemYellow
        viewControllers = [createVolumeNC(), createWeightNC(), createLengthNC(), createTemperatureNC()]
    }
    
    func createVolumeNC() -> UINavigationController{
        let volumeVC = VolumeVC()
        volumeVC.title = "Volume"
        
        let volumeTBI = UITabBarItem()
        volumeTBI.title = "Volume"
        volumeTBI.image = UIImage(named: "volume")
        volumeTBI.tag = 1
        
        volumeVC.tabBarItem = volumeTBI
        
        return UINavigationController(rootViewController: volumeVC)
    }
    
    
    func createWeightNC() -> UINavigationController{
        let weightVC = WeightVC()
        weightVC.title = "Weight"
        
        let weightTBI = UITabBarItem()
        weightTBI.title = "Weight"
        weightTBI.image = UIImage(named: "scale")
        weightTBI.tag = 2
        
        weightVC.tabBarItem = weightTBI
        
        return UINavigationController(rootViewController: weightVC)
    }
    
    
    func createLengthNC() -> UINavigationController{
        let lengthVC = LengthVC()
        lengthVC.title = "Length"
        
        let lengthTBI = UITabBarItem()
        lengthTBI.title = "Length"
        lengthTBI.image = UIImage(named: "ruler")
        lengthTBI.tag = 3
        
        lengthVC.tabBarItem = lengthTBI
        
        return UINavigationController(rootViewController: lengthVC)
    }
    
    
    func createTemperatureNC() -> UINavigationController{
        let tempVC = TemperatureVC()
        tempVC.title = "Temperature"
        
        let tempTBI = UITabBarItem()
        tempTBI.title = "Temperature"
        tempTBI.image = UIImage(named: "temp")
        tempTBI.tag = 4
        
        tempVC.tabBarItem = tempTBI
        
        return UINavigationController(rootViewController: tempVC)
    }

}
