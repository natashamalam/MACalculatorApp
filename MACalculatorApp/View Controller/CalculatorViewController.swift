//
//  CalculatorViewController.swift
//  MACalculatorApp
//
//  Created by Alam, Mahjabin | Natasha | ECMPD on 2023/02/28.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    var calculator: CalculatorInterface = {
        let myCalculator = CalculatorInterface()
        myCalculator.translatesAutoresizingMaskIntoConstraints = false
        myCalculator.clipsToBounds = true
        return myCalculator
    }()

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)
        self.view.backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(calculator)
        addLayoutConstraints()
    }
    
    
    private func addLayoutConstraints() {
        let top = UIScreen.main.bounds.height/2
        let constraints = [
            calculator.topAnchor.constraint(equalTo: view.topAnchor, constant: top),
            calculator.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10),
            calculator.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10),
            calculator.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50)
        ]
        NSLayoutConstraint.activate(constraints)
    }
 
}
