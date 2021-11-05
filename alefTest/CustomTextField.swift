//
//  CustomTextField.swift
//  alefTest
//
//  Created by baga on 05.11.2021.
//

import UIKit

//MARK: - Класс кастомного TextField.

@IBDesignable class CustomTextField: UITextField {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupTextField()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupTextField()
    }

    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setupTextField()
    }
    
    //MARK: Настройка верхнего Label
    
    private func setupTextField() {
        let label = UILabel()
        // Текст надписи можно задать путем изменения placeholder в инспекторе.
        label.text = self.placeholder
        label.font = label.font.withSize(16)
        label.textColor = UIColor(red: 0.00, green: 0.00, blue: 0.00, alpha: 0.5)
        self.borderStyle = .roundedRect;
        self.placeholder = ""
        addSubview(label)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.leftAnchor.constraint(equalTo: leftAnchor, constant: 7).isActive = true
        label.bottomAnchor.constraint(equalTo: topAnchor, constant: 24).isActive = true
    }
}
