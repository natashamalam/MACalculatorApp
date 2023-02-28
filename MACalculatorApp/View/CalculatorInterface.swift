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
    
    init(viewModel: PresentationViewModel = PresentationViewModel()) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        configureSubViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("No implementation")
    }
    
    private func configureSubViews() {
        addSubview(mainStackView)
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
        for count in 0 ..< viewModel.maximumNumberOfButtonsInRow(row) {
            let data = viewModel.dataForRow(row)
            let buttonColor = viewModel.buttonColor(at: row)
            let calculatorButton = CalculatorButton(data[count], buttonColor: buttonColor)
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
            mainStackView.topAnchor.constraint(equalTo: topAnchor),
            mainStackView.leftAnchor.constraint(equalTo: leftAnchor),
            mainStackView.rightAnchor.constraint(equalTo: rightAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
    }
}
