//
//  CalculatorView.swift
//  MACalculatorApp
//
//  Created by Alam, Mahjabin | Natasha | ECMPD on 2023/02/28.
//

import UIKit

class CalculatorInterface: UIView {
    
    let viewModel: PresentationViewModel
    
    let mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    let monitor: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .black
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.borderWidth = 2.0
        textField.layer.cornerRadius = 5.0
        textField.textColor = UIColor.white
        return textField
    }()
    
    init(viewModel: PresentationViewModel = PresentationViewModel()) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        configureSubViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("No implementation")
    }
    
    private func configureSubViews() {
        addSubview(monitor)
        addSubview(mainStackView)
        monitor.delegate = self
        monitor.becomeFirstResponder()
        addLayoutConstraints()
        addButtonsRows()
    }
    
    private func addButtonsRows() {
        for row in 0 ..< viewModel.maximumNumberOfRows() {
            let calculatorRow = addButtons(at: row)
            mainStackView.addArrangedSubview(calculatorRow)
        }
    }
    
    private func addButtons(at row: Int) -> UIStackView {
        let rowStackView = setHorizontalStackView()
        let data = viewModel.dataForRow(row)
        let buttonColor = viewModel.buttonColor(at: row)
        for column in 0 ..< viewModel.maximumNumberOfButtonsInRow(row) {
            let calculatorButton = CalculatorButton(data[column], buttonColor: buttonColor)
            rowStackView.addArrangedSubview(calculatorButton)
        }
        return rowStackView
    }
    
    private func setHorizontalStackView() -> UIStackView {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        return stackView
    }
    
    private func addLayoutConstraints() {
        let constraints = [
            monitor.topAnchor.constraint(equalTo: topAnchor),
            monitor.leftAnchor.constraint(equalTo: leftAnchor),
            monitor.rightAnchor.constraint(equalTo: rightAnchor),
            monitor.heightAnchor.constraint(equalToConstant: 60),
            
            mainStackView.topAnchor.constraint(equalTo: monitor.bottomAnchor, constant: 10),
            mainStackView.leftAnchor.constraint(equalTo: leftAnchor),
            mainStackView.rightAnchor.constraint(equalTo: rightAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
    }
}

extension CalculatorInterface: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return textField.resignFirstResponder()
    }
}
