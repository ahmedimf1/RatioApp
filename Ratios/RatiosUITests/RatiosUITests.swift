//
//  RatiosUITests.swift
//  RatiosUITests
//


import XCTest

//    @state private var selection: Tab =
//        CommandLine.arguments.contains("-ratios-tests")? .recipes : .menu

class RatiosUITests: XCTestCase {
    let app = XCUIApplication()

    override func setUpWithError() throws {
        continueAfterFailure = false
        // launch argument to set the state for example
        app.launchArguments.append("-ratios-UI-tests")
        app.launch()
    }


    override func tearDown() {


    }
    
    func testUICalculationResults() {
        
        //Input coffee amount
        setCoffeeAmount(amount: "10")
        
        //Input water Ratio
        setWaterRatio(amount: "3")
        
        let expected = "30.0"
        let actual = getUIAmountOfWater()
        XCTAssertEqual(expected, actual, "Water amount is expected to be \(expected), but it is shown as \(actual)")
    }

    func testInvalidCoffeeInput() {
        
        //Invalid coffee amount input
        let inputValue = "F"
        let initialValue = getUIAmountOfWater()
        
        setCoffeeAmount(amount: inputValue)
        
        let displayedValue = getUIAmountOfWater()
        
        XCTAssertEqual(displayedValue, initialValue, "The initial value \(initialValue) changed to \(displayedValue) on invalid input of \(inputValue)")
    }
    
    func testInvalidRatioInput() {

        //Invalid water ratio input
        let inputValue = "X"
        let initialValue = getUIAmountOfWater()
        
        setWaterRatio(amount: inputValue)
        
        let displayedValue = getUIAmountOfWater()
        
        XCTAssertEqual(displayedValue, initialValue, "The initial value \(initialValue) changed to \(displayedValue) on invalid input of \(inputValue) ")
    }
    
    func testTimer() {
        
        // ensure timer is at 0
        let timerLabel = getTimerValue()
        XCTAssertEqual(timerLabel, "00:00", "Timer is expected to be at 00:00, but it is shown as \(timerLabel)")
        
        //ensure button reads start
        let startPauseButton = app.buttons["start_pause_button"]
        XCTAssertEqual(startPauseButton.label, "Start", "Timer button label is expected to show 'Start', but it is shown as \(startPauseButton.label)")

        // press start button
        clickStartButton()
        // ensure text changed to pause
        XCTAssertEqual(startPauseButton.label, "Pause", "Timer button label is expected to show 'Pause', but it is shown as \(startPauseButton.label)")

        //ensure timer value is more than "00:00"
        //get timer value at an instant
        var timerValue = getTimerValue()
        sleep(2)
        clickStartButton()
        
        let timerValue2 = getTimerValue()
        
        let before = Int(timerValue.components(separatedBy: ":")[1])
        let after = Int(timerValue2.components(separatedBy: ":")[1])
        
        // assert timer value at the next instant is not equal
        XCTAssertEqual(before! + 2, after!)
        //assert timer pause
        
        timerValue = getTimerValue()
        sleep(2)
        XCTAssertEqual(timerValue, getTimerValue())
        
        //reset button
        clickResetButton()
        XCTAssertEqual(getTimerValue(), "00:00")
    }

    func testLaunchPerformance() {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
                XCUIApplication().launch()
                //test1
                //test2
            }
        }
    }
}
