//
//  File.swift
//  RatiosUITests
//
//  Created by apple on 2022/05/23.
//  Copyright © 2022 Ahmed Eisa. All rights reserved.
//

// Helper functions
func getTimerValue()-> String{
    return UIElements.timerLabel.element.label
}
func getUIAmountOfWater()-> String{
    return UIElements.waterAmountLabel.element.label
}
func setCoffeeAmount(amount: String){
    UIElements.coffeeInput.element.tap()
    UIElements.coffeeInput.element.typeText(amount)
}
func setWaterRatio(amount: String){
    UIElements.ratioInput.element.tap()
    UIElements.ratioInput.element.typeText(amount)
}
func clickStartButton(){
    UIElements.startButton.element.tap()
}
func clickResetButton(){
    UIElements.resetButton.element.tap()
}
