//
//  TemperatureVC.swift
//  ConvertMate
//
//  Created by Richárd Hardi on 2020. 06. 05..
//  Copyright © 2020. Richárd Hardi. All rights reserved.
//

import UIKit



protocol TemperatureVCDelegate1 {
    func updateFirstCardFromTemp(value: String)
    func firstCardTempButtonDeselect(select: Bool)
}

protocol TemperatureVCDelegate2 {
    func updateSecondCardFromTemp(value: String)
    func secondCardTempButtonDeselect(select: Bool)
}





class TemperatureVC: UIViewController {
    
    var delegate1: TemperatureVCDelegate1!
    var delegate2: TemperatureVCDelegate2!
    
    let firstCard = UIView()
    let secondCard = UIView()
    
    
    var selectedTempFrom = ""
    var tempValue: Int = 0
    var selectedTempTo = ""
    var valuePair = ""
    var countedValue: Int = 0
    
//    deinit {
//        NotificationCenter.default.removeObserver(self)
//    }
//
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureNavigationController()
        configureView()
        configureCards()
        
        dismissKeyboard()
        reloadTempData()
    }
    
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        loadEmptyData()
    }
    
    
    func configureNavigationController() {
        view.backgroundColor = .systemRed
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    
    func configureCards() {
        let cardVC = CMConvertCard(Buttons: ["Celsius", "Fahrenheit"], split: false)
        cardVC.delegate = self
        self.delegate1 = cardVC
        self.add(childVC: cardVC, to: firstCard)
        
        
        let convertToVC = CMConvertCardTo(Buttons: ["Celsius", "Fahrenheit"], split: false)
        convertToVC.delegate = self
        self.delegate2 = convertToVC
        self.add(childVC: convertToVC, to: secondCard)
    }
    
    
    func configureView() {
        view.addSubview(firstCard)
        view.addSubview(secondCard)
        
        firstCard.translatesAutoresizingMaskIntoConstraints = false
        secondCard.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            firstCard.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 70),
            firstCard.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            firstCard.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            firstCard.heightAnchor.constraint(equalToConstant: 155),
            
            secondCard.topAnchor.constraint(equalTo: firstCard.bottomAnchor, constant: 120),
            secondCard.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            secondCard.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            secondCard.heightAnchor.constraint(equalToConstant: 155)
        ])
    }
    
    
    func add(childVC: UIViewController, to containerView: UIView) {
        addChild(childVC)
        containerView.addSubview(childVC.view)
        
        childVC.view.frame = containerView.bounds
        childVC.didMove(toParent: self)
    }
    
    
    func dismissKeyboard() {
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
    }
    
    func reloadTempData() {
        countedValue = Dictionary.temp[selectedTempFrom + selectedTempTo] ?? 2
        
        let value: String
        if countedValue == 0 {
            let rawValue = Double((tempValue * 9 / 5) + 32)
            let roundedValue = round(rawValue * 100) / 100
            value = String(roundedValue)
        } else if countedValue == 1 {
            let rawValue = Double((tempValue - 32) * 5 / 9)
            let roundedValue = round(rawValue * 100) / 100
            value = String(roundedValue)
        } else {
            value = ""
        }
        
        delegate2.updateSecondCardFromTemp(value: value)
    }
    
    func loadEmptyData() {
        selectedTempFrom = ""
        tempValue = 0
        selectedTempTo = ""
        
        delegate2.updateSecondCardFromTemp(value: "")
        delegate1.updateFirstCardFromTemp(value: "")
        delegate2.secondCardTempButtonDeselect(select: false)
        delegate1.firstCardTempButtonDeselect(select: false)
    }
    
}

extension TemperatureVC: CMConvertCardDelegate, CMConvertCardToDelegate {
    func selectedButtonTo(button: String) {
        selectedTempTo = button
        
        reloadTempData()
    }
    
    func selectedButtonFrom(button: String) {
        selectedTempFrom = button
        
        reloadTempData()
    }
    
    func typedValue(value: Int) {
        tempValue = value
        
        reloadTempData()
    }
}
