//
//  VolumeVC.swift
//  ConvertMate
//
//  Created by Richárd Hardi on 2020. 06. 05..
//  Copyright © 2020. Richárd Hardi. All rights reserved.
//

import UIKit

protocol VolumeVCDelegate1 {
    func updateFirstCardFromVolume(value: String)
    func firstCardVolumeButtonDeselect(select: Bool)
}

protocol VolumeVCDelegate2 {
    func updateSecondCardFromVolume(value: String)
    func secondCardVolumeButtonDeselect(select: Bool)
}



class VolumeVC: UIViewController{
    
    var delegate1: VolumeVCDelegate1!
    var delegate2: VolumeVCDelegate2!
    
    let firstCard = UIView()
    let secondCard = UIView()
    let backgroundImage = UIImageView()
    
    
    
    var selectedVolumeFrom = ""
    var volumeValue: Int = 0
    var selectedVolumeTo = ""
    var valuePair = ""
    var countedValue: Double! = 0.0

    override func viewDidLoad() {
        super.viewDidLoad()

        configureNavigationController()
        configureView()
        configureCards()
        
        dismissKeyboard()
        reloadVolumeData()
        loadEmptyData()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        loadEmptyData()
    }
    
    
    
    func configureNavigationController() {
        
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    
    func configureCards() {
        let cardVC = CMConvertCard(Buttons: ["Liter", "Mililiter", "Cup", "Ounces", "TableSpoon", "TeaSpoon"], split: true)
        cardVC.delegate = self
        self.delegate1 = cardVC
        self.add(childVC: cardVC, to: firstCard)
        
        
        let convertToVC = CMConvertCardTo(Buttons: ["Liter", "Mililiter", "Cup", "Ounces", "TableSpoon", "TeaSpoon"], split: true)
        convertToVC.delegate = self
        self.delegate2 = convertToVC
        self.add(childVC: convertToVC, to: secondCard)
    }
    
    
    func configureView() {
        view.addSubview(backgroundImage)
        view.addSubview(firstCard)
        view.addSubview(secondCard)

        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        backgroundImage.image = UIImage(named: "vawe2")
        firstCard.translatesAutoresizingMaskIntoConstraints = false
        secondCard.translatesAutoresizingMaskIntoConstraints = false
        

        NSLayoutConstraint.activate([
            backgroundImage.topAnchor.constraint(equalTo: view.topAnchor, constant: -10),
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
        countedValue = Dictionary.volume[selectedVolumeFrom + selectedVolumeTo] ?? 0
        
        let value: String
        if countedValue == 0 {
            value = ""
        } else {
            value = String(round((countedValue * Double(volumeValue)*100))/100)
        }
        delegate2.updateSecondCardFromVolume(value: value)
    }
    
    func loadEmptyData() {
        selectedVolumeFrom = ""
        volumeValue = 0
        selectedVolumeTo = ""
        
        delegate2.updateSecondCardFromVolume(value: "")
        delegate1.updateFirstCardFromVolume(value: "")
        delegate2.secondCardVolumeButtonDeselect(select: false)
        delegate1.firstCardVolumeButtonDeselect(select: false)
    }
}


extension VolumeVC: CMConvertCardDelegate, CMConvertCardToDelegate {
    func selectedButtonTo(button: String) {
        selectedVolumeTo = button
        
        reloadVolumeData()
    }
    
    func selectedButtonFrom(button: String) {
        selectedVolumeFrom = button
        
        reloadVolumeData()
    }
    
    func typedValue(value: Int) {
        volumeValue = value
        
        reloadVolumeData()
    }
}
