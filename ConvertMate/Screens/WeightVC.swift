//
//  WeightVC.swift
//  ConvertMate
//
//  Created by Richárd Hardi on 2020. 06. 05..
//  Copyright © 2020. Richárd Hardi. All rights reserved.
//

import UIKit

protocol WeigthVCDelegate1 {
    func updateFirstCardFromWeight(value: String)
    func firstCardWeightButtonDeselect(select: Bool)
}

protocol WeigthVCDelegate2 {
    func updateSecondCardFromWeight(value: String)
    func secondCardWeightButtonDeselect(select: Bool)
}




class WeightVC: UIViewController {
    
    var delegate1: WeigthVCDelegate1!
    var delegate2: WeigthVCDelegate2!
    
    let firstCard = UIView()
    let secondCard = UIView()
    let backgroundImage = UIImageView()
    
    
    var selectedWeightFrom = ""
    var weightValue: Int = 0
    var selectedWeightTo = ""
    var valuePair = ""
    var countedValue: Double! = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureNavigationController()
        configureView()
        configureCards()
        
        dismissKeyboard()
        reloadWeightData()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        loadEmptyData()
    }
    
    func configureNavigationController() {
        view.backgroundColor = .white
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    
    func configureCards() {
        let cardVC = CMConvertCard(Buttons: ["Kilogram", "Gram", "Ounce", "Pound", "Stone"], split: true)
        cardVC.delegate = self
        self.delegate1 = cardVC
        self.add(childVC: cardVC, to: firstCard)
        
        
        let convertToVC = CMConvertCardTo(Buttons: ["Kilogram", "Gram", "Ounce", "Pound", "Stone"], split: true)
        convertToVC.delegate = self
        self.delegate2 = convertToVC
        self.add(childVC: convertToVC, to: secondCard)
    }
    
    
    func configureView() {
        view.addSubview(backgroundImage)
        view.addSubview(firstCard)
        view.addSubview(secondCard)
        
        
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        backgroundImage.image = UIImage(named: "squares2")
        backgroundImage.contentMode = .scaleAspectFill
        firstCard.translatesAutoresizingMaskIntoConstraints = false
        secondCard.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            backgroundImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 320),
            backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            firstCard.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            firstCard.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            firstCard.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            firstCard.heightAnchor.constraint(equalToConstant: 155),
            
            secondCard.topAnchor.constraint(equalTo: firstCard.bottomAnchor, constant: 90),
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
    
    func reloadWeightData() {
        countedValue = Dictionary.weight[selectedWeightFrom + selectedWeightTo] ?? 0
        
        let value: String
        if countedValue == 0 {
            value = ""
        } else {
            value = String(round((countedValue * Double(weightValue)*100))/100)
        }
        
        delegate2.updateSecondCardFromWeight(value: value)
    }
    
    
    func loadEmptyData() {
        selectedWeightFrom = ""
        weightValue = 0
        selectedWeightTo = ""
        
        delegate2.updateSecondCardFromWeight(value: "")
        delegate1.updateFirstCardFromWeight(value: "")
        delegate2.secondCardWeightButtonDeselect(select: false)
        delegate1.firstCardWeightButtonDeselect(select: false)
    }
}


extension WeightVC: CMConvertCardDelegate, CMConvertCardToDelegate {
    func selectedButtonFrom(button: String) {
        selectedWeightFrom = button
        
        reloadWeightData()
    }
    
    func typedValue(value: Int) {
        weightValue = value
        
        reloadWeightData()
    }
    
    func selectedButtonTo(button: String) {
        selectedWeightTo = button
        
        reloadWeightData()
    }
    
    
}
