//
//  PresentationViewModel.swift
//  MACalculatorApp
//
//  Created by Alam, Mahjabin | Natasha | ECMPD on 2023/02/28.
//

import UIKit

class PresentationViewModel {
    
    let entireDataSource = ["(", ")", "/", "AC", "1", "2", "3", "+", "4", "5", "6", "-", "7", "8", "9", "X", ".", "0", "=", ""]
    
    func maximumNumberOfButtonsInRow(_ row: Int = 0) -> Int {
        return row == (maximumNumberOfRows() - 1) ? 3 : 4
    }
    
    func maximumNumberOfRows() -> Int {
        return entireDataSource.count/4
    }
    
    func dataForRow(_ row: Int) -> [String] {
        let start = 0 + (4 * row)
        let end = row == (maximumNumberOfRows() - 1) ? start + 3 : start + 4
        return entireDataSource[start ..< end].map({$0})
    }
    
    func buttonColor(at row: Int) -> UIColor {
        return row % 2 == 0 ? UIColor.lightGray : UIColor.darkGray
    }
    
    //func someFunc() {}
}
