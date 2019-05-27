//
//  SpecialOfferTests.swift
//  DinDinnAssignmentTests
//
//  Created by Duy Nguyen on 5/28/19.
//  Copyright © 2019 Duy Nguyen. All rights reserved.
//

import XCTest
@testable import DinDinnAssignment

class SpecialOfferTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_initNewSpecialOffer_whenPriceIsNotNull_getPriceTextReturnString() {
        //given
        let specialOffer = SpecialOffer(offerName: "String", offerWeight: 22, offerPrice: 24.5)
        
        //when
        let priceText = specialOffer.getOfferPriceText()
        
        //then
        XCTAssertNotNil(priceText)
        XCTAssertTrue(priceText != "")
    }
    
    func test_initNewSpecialOffer_whenPriceIsNull_getPriceTextReturnEmpty() {
        let specialOffer = SpecialOffer(offerName: "String", offerWeight: 22, offerPrice: nil)
        
        //when
        let priceText = specialOffer.getOfferPriceText()
        
        //then
        XCTAssertNotNil(priceText)
        XCTAssertTrue(priceText == "")
    }
    
    func test_initNewSpecialOffer_whenWeightIsNotNull_getWeightTextReturnString() {
        let specialOffer = SpecialOffer(offerName: "String", offerWeight: 77, offerPrice: nil)
        
        //when
        let weightText = specialOffer.getOfferWeightText()
        
        //then
        XCTAssertNotNil(weightText)
        XCTAssertTrue(weightText != "")
    }
    
    func test_initNewSpecialOffer_whenWeightIsNull_getWeightTextReturnEmpty() {
        let specialOffer = SpecialOffer(offerName: "String", offerWeight: nil, offerPrice: nil)
        
        //when
        let weightText = specialOffer.getOfferWeightText()
        
        //then
        XCTAssertNotNil(weightText)
        XCTAssertTrue(weightText == "")
    }

}
