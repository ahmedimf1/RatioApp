//
//  UIElements.swift
//  RatiosUITests
//
//  Created by apple on 2022/05/23.
//  Copyright © 2022 Ahmed Eisa. All rights reserved.
//

import XCTest
enum UIElements: String {

    case coffeeInput = "coffee_total_input"
    case ratioInput = "water_ratio_input"
    case waterAmountLabel = "water_grams_label"
    case timerLabel = "timer_text"
    case startButton = "start_pause_button"
    case resetButton = "reset_button"

    var element: XCUIElement {
        switch self {
        case .coffeeInput:
            return XCUIApplication().textFields[self.rawValue]
        case .ratioInput:
            return XCUIApplication().textFields[self.rawValue]
        case .waterAmountLabel:
            return XCUIApplication().staticTexts[self.rawValue]
        case .timerLabel:
            return XCUIApplication().staticTexts[self.rawValue]
        case .startButton:
            return XCUIApplication().buttons[self.rawValue]
        case .resetButton:
            return XCUIApplication().buttons[self.rawValue]
        }
    }
}
