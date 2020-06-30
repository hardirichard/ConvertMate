//
//  CMConvertCardTo.swift
//  ConvertMate
//
//  Created by Richárd Hardi on 2020. 06. 08..
//  Copyright © 2020. Richárd Hardi. All rights reserved.
//

import UIKit

protocol CMConvertCardToDelegate {
    func selectedButtonTo(button: String)
}


class CMConvertCardTo: UIViewController {
    
    var delegate: CMConvertCardToDelegate!
    
    var buttons: [String]!
    var buttonsArrays: [[String]]! = []
    
    var spliting: Bool!
    var cmButtonsArrays: [[CMButton]]! = []
    
    
    var hStacks: [UIStackView]! = []
    let midVStack = UIStackView()
    
    
    let textLabel = CMLabel()
    var selectedButton: String = ""
    var buttonSelected = false
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
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
            delegate.selectedButtonTo(button: button.titleLabel!.text!)
        }
    }
    
    
    func dismissKeyboard() {
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
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
        view.addSubview(textLabel)
        
        midVStack.translatesAutoresizingMaskIntoConstraints = false
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let height = CGFloat((hStacks.count * 35) + (hStacks.count - 1) * 5)
        
        NSLayoutConstraint.activate([
            midVStack.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            midVStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -4),
            midVStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 4),
            midVStack.heightAnchor.constraint(equalToConstant: height),
            
            
            textLabel.topAnchor.constraint(equalTo: midVStack.bottomAnchor, constant: 30),
            textLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -4),
            textLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 4),
            textLabel.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
}

extension CMConvertCardTo: VolumeVCDelegate2, WeigthVCDelegate2, LengthVCDelegate2, TemperatureVCDelegate2 {

    

    
    
    // update second cards
    
    func updateSecondCardFromWeight(value: String) {
        textLabel.text = value
    }

    func updateSecondCardFromTemp(value: String) {
        textLabel.text = value
    }

    func updateSecondCardFromVolume(value: String) {
        textLabel.text = value
    }
    
    func updateSecondCardFromLength(value: String) {
        textLabel.text = value
    }
    

    
    func secondCardVolumeButtonDeselect(select: Bool) {
        for buttonsArray in cmButtonsArrays {
            for buttons in buttonsArray {
                buttons.isSelected = false
                buttons.backgroundColor = .systemGray
            }
        }
    }
    
    
    func secondCardWeightButtonDeselect(select: Bool) {
        for buttonsArray in cmButtonsArrays {
            for buttons in buttonsArray {
                buttons.isSelected = false
                buttons.backgroundColor = .systemGray
            }
        }
    }
    
    
    
    func secondCardLengthButtonDeselect(select: Bool) {
        for buttonsArray in cmButtonsArrays {
            for buttons in buttonsArray {
                buttons.isSelected = false
                buttons.backgroundColor = .systemGray
            }
        }
    }
    
    func secondCardTempButtonDeselect(select: Bool) {
        for buttonsArray in cmButtonsArrays {
            for buttons in buttonsArray {
                buttons.isSelected = false
                buttons.backgroundColor = .systemGray
            }
        }
    }
}


