//
//  CalculatorButtonView.swift
//  MACalculatorApp
//
//  Created by Alam, Mahjabin | Natasha | ECMPD on 2023/02/28.
//

import UIKit

class CalculatorButton: UIView {
   
    private(set) var text: String
    
    var buttonLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.numberOfLines = 1
        label.font = UIFont.systemFont(ofSize: 12.0)
        label.textColor = .black
        label.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        label.setContentHuggingPriority(.defaultHigh, for: .vertical)
        return label
    }()
    
    init(_ text: String) {
        self.text = text
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        customizeButtonView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func customizeButtonView() {
        self.layer.borderWidth = 1.0
        self.layer.borderColor = UIColor.orange.cgColor
        buttonLabel.text = text
        addSubview(buttonLabel)
        addLayoutConstraint()
    }
    
    private func addLayoutConstraint() {
        let constraints = [
            buttonLabel.widthAnchor.constraint(equalToConstant: 50),
            buttonLabel.heightAnchor.constraint(equalToConstant: 50),
            buttonLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            buttonLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
}
