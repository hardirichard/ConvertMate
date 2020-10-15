//
//  CMConvertCard.swift
//  ConvertMate
//
//  Created by Richárd Hardi on 2020. 06. 05..
//  Copyright © 2020. Richárd Hardi. All rights reserved.
//

import UIKit

protocol CMConvertCardDelegate {
    func selectedButtonFrom(button: String)
    func typedValue(value: Int)
}


class CMConvertCard: UIViewController {
    
    var delegate: CMConvertCardDelegate!
    
    var buttons: [String]!
    var buttonsArrays: [[String]]! = []
    
    
    var spliting: Bool!
    var cmButtonsArrays: [[CMButton]]! = []
    var isButtonSelected = false
    
    
    var hStacks: [UIStackView]! = []
    let midVStack = UIStackView()
    
    
    let textField = CMTextField()
    
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
        configureView()
        dismissKeyboard()
        configureTextField()
    }
    
    func configureArrays() {
        
        if spliting == true {
            let buttonsArray1 = buttons.splitHalf()[0]
            let buttonsArray2 = buttons.splitHalf()[1]
            buttonsArrays.append(buttonsArray1)
            buttonsArrays.append(buttonsArray2)
            
        } else {
            buttonsArrays.append(buttons)
        }
    }
    
    func configureButtons() {
        
        for buttonsArray in buttonsArrays {
            var tempArray: [CMButton] = []
            for button in buttonsArray {
                let cmButton = CMButton(backgroundcolor: .systemGray, title: button)
                cmButton.isSelected = false
                
                tempArray.append(cmButton)
            }
            cmButtonsArrays.append(tempArray)
        }
    }
    
    
    func configureHStacks() {
        
        for buttonsArray in cmButtonsArrays {
            let stackView = UIStackView()
            stackView.axis = .horizontal
            stackView.spacing = 4
            stackView.distribution = .fillProportionally
            
            
            for buttons in buttonsArray {
                stackView.addArrangedSubview(buttons)
                buttons.addTarget(self, action: #selector(buttonPushed), for: .touchUpInside)
            }
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
            button.backgroundColor = .systemOrange
            delegate.selectedButtonFrom(button: (button.titleLabel?.text)!)
        }
    }
    
    
    func dismissKeyboard() {
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
    }
    
    
    func configureTextField() {
        textField.addTarget(self, action: #selector(didTextEditingEnd), for: .editingDidEnd)
        
    }
    
    @objc func didTextEditingEnd() {
        
        
        let textFieldText = Int(textField.text!) ?? 0
        let textFieldData = ["value": textFieldText] as [String : Any]
        
        delegate.typedValue(value: textFieldText)
        NotificationCenter.default.post(name: .textFieldEdited, object: nil, userInfo: textFieldData)
    }
    
    func configureMidVStack() {
        midVStack.axis = .vertical
        midVStack.spacing = 10
        
        for hStack in hStacks {
            midVStack.addArrangedSubview(hStack)
        }
    }
    
    func configureView() {
        view.addSubview(midVStack)
        view.addSubview(textField)
        
        midVStack.translatesAutoresizingMaskIntoConstraints = false
        textField.translatesAutoresizingMaskIntoConstraints = false
        let height = CGFloat((hStacks.count * 35) + (hStacks.count - 1) * 5)
        
        NSLayoutConstraint.activate([
            midVStack.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            midVStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -4),
            midVStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 4),
            midVStack.heightAnchor.constraint(equalToConstant: height),
            
            
            textField.topAnchor.constraint(equalTo: midVStack.bottomAnchor, constant: 30),
            textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -4),
            textField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 4),
            textField.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
}

extension CMConvertCard: VolumeVCDelegate1, WeigthVCDelegate1, LengthVCDelegate1, TemperatureVCDelegate1 {
    
    
    
    
    
    
    func updateFirstCardFromVolume(value: String) {
        textField.text = value
    }
    
    func updateFirstCardFromWeight(value: String) {
        textField.text = value
    }
    
    func updateFirstCardFromLength(value: String) {
        textField.text = value
    }
    
    func updateFirstCardFromTemp(value: String) {
        textField.text = value
    }
    
    
    
    func firstCardVolumeButtonDeselect(select: Bool) {
        for buttonsArray in cmButtonsArrays {
            for buttons in buttonsArray {
                buttons.isSelected = false
                buttons.backgroundColor = .systemGray
            }
        }
    }
    
    func firstCardWeightButtonDeselect(select: Bool) {
        for buttonsArray in cmButtonsArrays {
            for buttons in buttonsArray {
                buttons.isSelected = false
                buttons.backgroundColor = .systemGray
            }
        }
    }
    
    func firstCardLengthButtonDeselect(select: Bool) {
        for buttonsArray in cmButtonsArrays {
            for buttons in buttonsArray {
                buttons.isSelected = false
                buttons.backgroundColor = .systemGray
            }
        }
    }
    
    func firstCardTempButtonDeselect(select: Bool) {
        for buttonsArray in cmButtonsArrays {
            for buttons in buttonsArray {
                buttons.isSelected = false
                buttons.backgroundColor = .systemGray
            }
        }
    }
}
