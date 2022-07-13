//
//  MMMUITests.swift
//  MMMUITests
//
//  Created by Sergei Kovalev on 09.06.2022.
//

import XCTest

final class MMMUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        app.tabBars.buttons["Прлофиль"].tap()
        app.navigationBars.buttons["Вход/Выход"].tap()
        
        XCUIApplication()/*@START_MENU_TOKEN@*/.textFields["Введите номер"]/*[[".scrollViews.textFields[\"Введите номер\"]",".textFields[\"Введите номер\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.textFields["Введите номер"].typeText("79153408513")
        XCUIApplication()/*@START_MENU_TOKEN@*/.buttons["Войти"]/*[[".scrollViews.buttons[\"Войти\"]",".buttons[\"Войти\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.staticTexts["Войти"].tap()
        

        sleep(10)
        app.otherElements.textViews.element.tap()
        app.otherElements.textViews.element.typeText("111111")
        app.otherElements.buttons["Проверить код"].tap()
        
        XCUIApplication().tables/*@START_MENU_TOKEN@*/.staticTexts["Курица-Томат стоимостью от 800 Руб."]/*[[".cells.staticTexts[\"Курица-Томат стоимостью от 800 Руб.\"]",".staticTexts[\"Курица-Томат стоимостью от 800 Руб.\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
                
        
        
        let incrementButton = XCUIApplication().steppers.buttons["Increment"]
        incrementButton.tap()
        incrementButton.tap()
        
        //app/*@START_MENU_TOKEN@*/.staticTexts["Добавить в корзину"]/*[[".buttons[\"Добавить в корзину\"].staticTexts[\"Добавить в корзину\"]",".staticTexts[\"Добавить в корзину\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
                
        //XCUIApplication().tabBars["Tab Bar"].buttons["Заказ"].tap()
        
                
        
                
        
        
        let tablesQuery = app.tables
        tablesQuery/*@START_MENU_TOKEN@*/.cells.containing(.staticText, identifier:"Курица-Томат: 2").element/*[[".cells.containing(.staticText, identifier:\"800\").element",".cells.containing(.staticText, identifier:\"Курица-Томат: 2\").element"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.swipeLeft()
        tablesQuery/*@START_MENU_TOKEN@*/.buttons["Delete"]/*[[".cells.buttons[\"Delete\"]",".buttons[\"Delete\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.alerts["Корзина пуста"].scrollViews.otherElements.buttons["Меню"].tap()
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Курица-Томат стоимостью от 800 Руб."]/*[[".cells.staticTexts[\"Курица-Томат стоимостью от 800 Руб.\"]",".staticTexts[\"Курица-Томат стоимостью от 800 Руб.\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        let incrementButton1 = app.steppers.buttons["Increment"]
        incrementButton1.tap()
        incrementButton1.tap()
        app/*@START_MENU_TOKEN@*/.staticTexts["Добавить в корзину"]/*[[".buttons[\"Добавить в корзину\"].staticTexts[\"Добавить в корзину\"]",".staticTexts[\"Добавить в корзину\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.tabBars["Tab Bar"].buttons["Заказ"].tap()
        //tablesQuery.staticText.tap()
        

        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        
        
        
        
        
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
