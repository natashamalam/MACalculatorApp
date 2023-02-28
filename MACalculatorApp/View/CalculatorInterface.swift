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
        stackView.backgroundColor = .green
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 10
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
            calculatorRow.backgroundColor = row == 1 ? UIColor.purple : UIColor.clear
            mainStackView.addArrangedSubview(calculatorRow)
        }
    }
    
    private func addButtons(at row: Int) -> UIStackView {
        let rowStackView = setHorizontalStackView()
        for count in 0 ..< viewModel.maximumNumberOfButtonsInRow(row) {
            let calculatorButton = CalculatorButton(String(describing: count + 1))
            rowStackView.addArrangedSubview(calculatorButton)
        }
        return rowStackView
    }
    
    private func setHorizontalStackView() -> UIStackView {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.distribution = .equalSpacing
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
