//
//  CMLabel.swift
//  ConvertMate
//
//  Created by Richárd Hardi on 2020. 06. 08..
//  Copyright © 2020. Richárd Hardi. All rights reserved.
//

import UIKit

class CMLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        
        layer.cornerRadius = 15
        layer.borderWidth = 2
        layer.borderColor = UIColor.systemGray.cgColor
        layer.masksToBounds = true
        
        textColor = .label
        tintColor = .label
        textAlignment = .center
        font = UIFont.preferredFont(forTextStyle: .title2)
        adjustsFontSizeToFitWidth = true
        
        backgroundColor = .tertiarySystemBackground
        
        
    }

}
