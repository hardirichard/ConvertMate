//
//  LengthVC.swift
//  ConvertMate
//
//  Created by Richárd Hardi on 2020. 06. 05..
//  Copyright © 2020. Richárd Hardi. All rights reserved.
//

import UIKit

protocol LengthVCDelegate1 {
    func updateFirstCardFromLength(value: String)
    func firstCardLengthButtonDeselect(select: Bool)
}

protocol LengthVCDelegate2 {
    func updateSecondCardFromLength(value: String)
    func secondCardLengthButtonDeselect(select: Bool)
}

class LengthVC: UIViewController {
    
    var delegate1: LengthVCDelegate1!
    var delegate2: LengthVCDelegate2!
    
    let firstCard = UIView()
    let secondCard = UIView()
    let backgroundImage = UIImageView()
    
    
    
    var selectedLengthFrom = ""
    var lengthValue: Int = 0
    var selectedLengthTo = ""
    var valuePair = ""
    var countedValue: Double! = 0.0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureNavigationController()
        configureView()
        configureCards()
        
        dismissKeyboard()
        reloadVolumeData()
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
        let cardVC = CMConvertCard(Buttons: ["Meters", "Centimeters", "Milimeters", "Foot", "Inches"], split: true)
        cardVC.delegate = self
        self.delegate1 = cardVC
        self.add(childVC: cardVC, to: firstCard)
        
        
        let convertToVC = CMConvertCardTo(Buttons: ["Meters", "Centimeters", "Milimeters", "Foot", "Inches"], split: true)
        convertToVC.delegate = self
        self.delegate2 = convertToVC
        self.add(childVC: convertToVC, to: secondCard)
    }
    
    
    func configureView() {
        view.addSubview(backgroundImage)
        view.addSubview(firstCard)
        view.addSubview(secondCard)
        
        
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        backgroundImage.image = UIImage(named: "grass")
        backgroundImage.contentMode = .scaleAspectFill
        firstCard.translatesAutoresizingMaskIntoConstraints = false
        secondCard.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            backgroundImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 460),
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
    
    func reloadVolumeData() {
        countedValue = Dictionary.length[selectedLengthFrom + selectedLengthTo] ?? 0
        
        let value: String
        if countedValue == 0 {
            value = ""
        } else {
            value = String(round((countedValue * Double(lengthValue)*100))/100)
        }
        
        delegate2.updateSecondCardFromLength(value: value)
    }
    
    
    func loadEmptyData() {
        selectedLengthFrom = ""
        lengthValue = 0
        selectedLengthTo = ""
        
        delegate2.updateSecondCardFromLength(value: "")
        delegate1.updateFirstCardFromLength(value: "")
        delegate2.secondCardLengthButtonDeselect(select: false)
        delegate1.firstCardLengthButtonDeselect(select: false)
    }
}

extension LengthVC: CMConvertCardDelegate, CMConvertCardToDelegate {
    func selectedButtonTo(button: String) {
        selectedLengthTo = button
        
        reloadVolumeData()
    }
    
    
    func selectedButtonFrom(button: String) {
        selectedLengthFrom = button
        
        reloadVolumeData()
    }
    
    func typedValue(value: Int) {
        lengthValue = value
        
        reloadVolumeData()
    }
}
