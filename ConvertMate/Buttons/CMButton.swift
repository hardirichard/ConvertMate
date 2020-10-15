//
//  CMButton.swift
//  ConvertMate
//
//  Created by Richárd Hardi on 2020. 06. 05..
//  Copyright © 2020. Richárd Hardi. All rights reserved.
//

import UIKit

class CMButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(backgroundcolor: UIColor, title: String) {
        self.init(frame: .zero)
        self.backgroundColor = backgroundcolor
        self.setTitle(title, for: .normal)
    }
    
    
    
    func configure() {
        
        layer.borderWidth = 0
        layer.borderColor = UIColor.gray.cgColor
        layer.cornerRadius = 10
        setTitleColor(.white, for: .normal)
        titleLabel?.font = UIFont.preferredFont(forTextStyle: .body)
        translatesAutoresizingMaskIntoConstraints = false
        
        
        layer.shadowColor = UIColor.darkGray.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 0)
        layer.shadowRadius = 3
        layer.shadowOpacity = 0.5
    }
    
}
