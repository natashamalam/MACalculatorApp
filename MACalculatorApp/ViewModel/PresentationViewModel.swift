//
//  PresentationViewModel.swift
//  MACalculatorApp
//
//  Created by Alam, Mahjabin | Natasha | ECMPD on 2023/02/28.
//

import UIKit

class PresentationViewModel {
    
    let entireDataSource = ["1", "2", "3", "+", "4", "5", "6", "-", "7", "8", "9", "/", "0", ".", "x", "/"]
    
    func maximumNumberOfButtonsInRow(_ row: Int = 0) -> Int {
        return 4
    }
    
    func maximumNumberOfRows() -> Int {
        return entireDataSource.count/maximumNumberOfButtonsInRow()
    }
    
    func dataForRow(_ row: Int) -> [String] {
        let start = 0 + (4 * row)
        return entireDataSource[start ..< start + 4].map({$0})
    }
    
    func buttonColor(at row: Int) -> UIColor {
        return row % 2 == 0 ? UIColor.lightGray : UIColor.darkGray
    }
}
