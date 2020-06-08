//
//  CMConvertCard.swift
//  ConvertMate
//
//  Created by Richárd Hardi on 2020. 06. 05..
//  Copyright © 2020. Richárd Hardi. All rights reserved.
//

import UIKit

protocol CMConvertCardDelegate {
    func selectedButton(button: CMButton)
}

class CMConvertCard: UIViewController {
    
    var delegate: CMConvertCardDelegate!
    
    var buttons: [String]!
//    var buttons = ["Cup", "Liter", "Mililiter"]
    var buttonsArray1: [String]!
    var buttonsArray2: [String]!
    var buttonsArrays: [[String]]! = []
    
    
    var spliting: Bool!
//    var spliting = false
    
//    var cmButtons: [CMButton]!
    var cmButtonsArrays: [[CMButton]]! = []
    
    
    var hStacks: [UIStackView]! = []
    var hStacksArray: [[UIStackView]]!
    let midVStack = UIStackView()
    let bigVStack = UIStackView()
    
    
    let textField = CMTextField()
    
    
    var selectedButton: String = ""
    
    
    
    
    
    init(Buttons: [String], split: Bool) {
        super.init(nibName: nil, bundle: nil)
        self.buttons = Buttons
        self.spliting = split
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        configureArrays()
        configureButtons()
        configureHStacks()
        configureMidVStack()
        configureBigVStack()
        configureView()
        dismissKeyboard()
    }
    
    func configureArrays() {
        
        if spliting == true {
            buttonsArray1 = buttons.splitHalf()[0]
            buttonsArray2 = buttons.splitHalf()[1]
            buttonsArrays.append(buttonsArray1)
            buttonsArrays.append(buttonsArray2)
//            print(buttonsArray1)
//            print(buttonsArray2)
//            print(buttonsArrays)
            
        } else {
            buttonsArrays.append(buttons)
        }
    }
    
    func configureButtons() {
        
        for buttonsArray in buttonsArrays {
            var tempArray: [CMButton] = []
            for button in buttonsArray {
                let cmButton = CMButton(backgroundcolor: .systemGray, title: button)
                tempArray.append(cmButton)
            }
            cmButtonsArrays.append(tempArray)
        }
    }
    
    
    func configureHStacks() {
        
        for buttonsArray in cmButtonsArrays {
            let stackView = UIStackView()
            stackView.axis = .horizontal
            stackView.distribution = .fillProportionally
            stackView.spacing = 4
            
            for buttons in buttonsArray {
                stackView.addArrangedSubview(buttons)
                buttons.addTarget(self, action: #selector(buttonPushed), for: .touchUpInside)
            }
//            print(stackView)
            hStacks.append(stackView)
        }
    }
    
    @objc func buttonPushed(button: CMButton) {
        
        
        
        if button.isSelected == true {
            button.backgroundColor = .systemGray
            button.isSelected = false
        } else {
            for buttonsArray in cmButtonsArrays {
                for buttons in buttonsArray {
                    buttons.isSelected = false
                    buttons.backgroundColor = .systemGray
                }
            }
            button.isSelected = true
            button.backgroundColor = .systemRed
            delegate.selectedButton(button: button)
            
//            self.selectedButton = button.titleLabel!.text!
//            print(selectedButton)
        }
    }
    
    
    func dismissKeyboard() {
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
    }
    
    
    func configureMidVStack() {
        
//        midVStack.translatesAutoresizingMaskIntoConstraints = false
        midVStack.axis = .vertical
        midVStack.distribution = .fillEqually
        midVStack.spacing = 10
        
        for hStack in hStacks {
            midVStack.addArrangedSubview(hStack)
        }
    }
    
    
    func configureBigVStack() {
//        bigVStack.translatesAutoresizingMaskIntoConstraints = false
        bigVStack.axis = .vertical
        bigVStack.distribution = .fillEqually
        bigVStack.spacing = 30
        
        let subviews = [midVStack, textField]
        for subview in subviews {
            bigVStack.addArrangedSubview(subview)
            subview.translatesAutoresizingMaskIntoConstraints = false
        }
        
        let midVStackheight = hStacks.count * 20 + 10
        
        NSLayoutConstraint.activate([
            bigVStack.heightAnchor.constraint(equalToConstant: CGFloat(midVStackheight))
        ])
    }
    
    func configureView() {
        view.addSubview(midVStack)
        view.addSubview(textField)
        
        midVStack.translatesAutoresizingMaskIntoConstraints = false
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            midVStack.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            midVStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            midVStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            midVStack.heightAnchor.constraint(equalToConstant: 70),
            
            
            textField.topAnchor.constraint(equalTo: midVStack.bottomAnchor, constant: 30),
            textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            textField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            textField.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
}
