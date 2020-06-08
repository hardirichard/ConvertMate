//
//  VolumeVC.swift
//  ConvertMate
//
//  Created by Richárd Hardi on 2020. 06. 05..
//  Copyright © 2020. Richárd Hardi. All rights reserved.
//

import UIKit

class VolumeVC: UIViewController {
    
    let stackview1 = UIStackView()
    let stackview2 = UIStackView()
    let vStackView = UIStackView()
    
    let cupButton = CMButton(backgroundcolor: .systemGray, title: "Cup")
    let literButton = CMButton(backgroundcolor: .systemGray, title: "Liter")
    let miliLiterButton = CMButton(backgroundcolor: .systemGray, title: "Mililiter")
    let OuncesButton = CMButton(backgroundcolor: .systemGray, title: "Ounces")
    let tableSpoonButton = CMButton(backgroundcolor: .systemGray, title: "TableSpoon")
    let teaSpoonButton = CMButton(backgroundcolor: .systemGray, title: "TeaSpoon")
    
    let secondCard = UIView()
//    let secondCard = CMConvertCard(Buttons: ["Cup", "Liter", "Mililiter"], split: false)
    
    
    
    var selectedVolumeFrom = ""
    
    let fromTextField = CMTextField()

    override func viewDidLoad() {
        super.viewDidLoad()

        configureNavigationController()
        
        configureStackView1()
        configureStackView2()
        configureVStackView()
        configureView()
        
        dismissKeyboard()
    }
    
    
    func configureNavigationController() {
        view.backgroundColor = .systemBlue
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func configureStackView1() {
        stackview1.translatesAutoresizingMaskIntoConstraints = false
        
        stackview1.axis = .horizontal
        stackview1.distribution = .fillProportionally
        stackview1.spacing = 4

        let subviews = [cupButton, literButton, miliLiterButton]
        
        for subview in subviews {
            stackview1.addArrangedSubview(subview)
            subview.addTarget(self, action: #selector(buttonPushed), for: .touchUpInside)
        }
    }
    
    
    func configureStackView2() {
        stackview2.translatesAutoresizingMaskIntoConstraints = false
        
        stackview2.axis = .horizontal
        stackview2.distribution = .fillProportionally
        
        stackview2.spacing = 4
        
        let subviews = [OuncesButton, tableSpoonButton, teaSpoonButton]
        
        
        for subview in subviews {
            stackview2.addArrangedSubview(subview)
            subview.addTarget(self, action: #selector(buttonPushed), for: .touchUpInside)
        }
    }
    
    @objc func buttonPushed(button: UIButton) {
        let buttonsArray = [cupButton, literButton, miliLiterButton, OuncesButton, tableSpoonButton, teaSpoonButton]
        if button.isSelected == true {
            button.backgroundColor = .systemGray
            button.isSelected = false
        } else {
            for buttons in buttonsArray {
                buttons.isSelected = false
                buttons.backgroundColor = .systemGray
            }
            button.isSelected = true
            button.backgroundColor = .systemRed
            self.selectedVolumeFrom = button.titleLabel!.text!
            print(selectedVolumeFrom)
        }
    }
    
    
    func configureVStackView() {
        vStackView.translatesAutoresizingMaskIntoConstraints = false
        vStackView.axis = .vertical
        vStackView.distribution = .fillEqually
        vStackView.spacing = 10
        
        let subviews = [stackview1, stackview2]
        
        for subview in subviews {
            vStackView.addArrangedSubview(subview)
        }
    }
    
    
    func configureView() {
        view.addSubview(vStackView)
        view.addSubview(fromTextField)

        
        let cardVC = CMConvertCard(Buttons: ["Cup", "Liter", "Mililiter", "Four", "Five", "Six"], split: true)
        cardVC.delegate = self
        self.add(childVC: cardVC, to: secondCard)
        view.addSubview(secondCard)
        
       
        
        
        secondCard.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            vStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            vStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            vStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            vStackView.heightAnchor.constraint(equalToConstant: 70),


            fromTextField.topAnchor.constraint(equalTo: vStackView.bottomAnchor, constant: 30),
            fromTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            fromTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            fromTextField.heightAnchor.constraint(equalToConstant: 50),

            
            secondCard.topAnchor.constraint(equalTo: fromTextField.bottomAnchor, constant: 70),
            secondCard.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            secondCard.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            secondCard.heightAnchor.constraint(equalToConstant: 110)
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
    
    
    

}

extension VolumeVC: CMConvertCardDelegate {
    func selectedButton(button: CMButton) {
        selectedVolumeFrom = button.titleLabel?.text! as! String
        print(selectedVolumeFrom)
    }
}
