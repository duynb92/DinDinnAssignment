//
//  IngredientTests.swift
//  DinDinnAssignmentTests
//
//  Created by Duy Nguyen on 5/28/19.
//  Copyright © 2019 Duy Nguyen. All rights reserved.
//

import XCTest
@testable import DinDinnAssignment

class IngredientTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_initNewSpecialOffer_whenPriceIsNotNull_getPriceTextReturnString() {
        //given
        let ingredient = Ingredient(id: 1, name: "name", price: 222, quantity: 1)
        
        //when
        let priceText = ingredient.getPriceText()
        
        //then
        XCTAssertNotNil(priceText)
        XCTAssertTrue(priceText != "")
    }
    
    func test_initNewSpecialOffer_whenPriceIsNull_getPriceTextReturnEmpty() {
        //given
        let ingredient = Ingredient(id: 1, name: "name", price: nil, quantity: 1)
        
        //when
        let priceText = ingredient.getPriceText()
        
        //then
        XCTAssertNotNil(priceText)
        XCTAssertTrue(priceText == "")
    }

}
