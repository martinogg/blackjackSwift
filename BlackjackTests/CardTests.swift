//
//  CardTests.swift
//  BlackjackTests
//
//  Created by martin ogg on 16/03/2018.
//  Copyright © 2018 martinogg. All rights reserved.
//

import XCTest

class CardTests: XCTestCase {
    
    let card_c2 = Card.Digit(.Club, .v2)
    let card_c3 = Card.Digit(.Club, .v3)
    let card_c4 = Card.Digit(.Club, .v4)
    let card_c5 = Card.Digit(.Club, .v5)
    let card_c6 = Card.Digit(.Club, .v6)
    let card_c7 = Card.Digit(.Club, .v7)
    let card_c8 = Card.Digit(.Club, .v8)
    let card_c9 = Card.Digit(.Club, .v9)
    let card_c10 = Card.Digit(.Club, .v10)
    let card_cj = Card.Jack(.Club)
    let card_cq = Card.Queen(.Club)
    let card_ck = Card.King(.Club)
    let card_ca = Card.Ace(.Club)
    
    let card_d2 = Card.Digit(.Diamond, .v2)
    let card_h2 = Card.Digit(.Heart, .v2)
    let card_s2 = Card.Digit(.Spade, .v2)

    let card_dj = Card.Jack(.Diamond)
    let card_hj = Card.Jack(.Heart)
    let card_sj = Card.Jack(.Spade)

    let card_dq = Card.Queen(.Diamond)
    let card_hq = Card.Queen(.Heart)
    let card_sq = Card.Queen(.Spade)

    let card_dk = Card.King(.Diamond)
    let card_hk = Card.King(.Heart)
    let card_sk = Card.King(.Spade)

    let card_da = Card.Ace(.Diamond)
    let card_ha = Card.Ace(.Heart)
    let card_sa = Card.Ace(.Spade)
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testStringValues() {
        // all digitValues of clubs
        XCTAssert(card_c2.stringValue == "c2")
        XCTAssert(card_c3.stringValue == "c3")
        XCTAssert(card_c4.stringValue == "c4")
        XCTAssert(card_c5.stringValue == "c5")
        XCTAssert(card_c6.stringValue == "c6")
        XCTAssert(card_c7.stringValue == "c7")
        XCTAssert(card_c8.stringValue == "c8")
        XCTAssert(card_c9.stringValue == "c9")
        XCTAssert(card_c10.stringValue == "c10")
        
        
        // 1 digit for all suites (except clubs, already done)
        XCTAssert(card_d2.stringValue == "d2")
        XCTAssert(card_h2.stringValue == "h2")
        XCTAssert(card_s2.stringValue == "s2")
        
        // jack for all suites
        XCTAssert(card_cj.stringValue == "cj")
        XCTAssert(card_dj.stringValue == "dj")
        XCTAssert(card_hj.stringValue == "hj")
        XCTAssert(card_sj.stringValue == "sj")
        
        // queen for all suites
        XCTAssert(card_cq.stringValue == "cq")
        XCTAssert(card_dq.stringValue == "dq")
        XCTAssert(card_hq.stringValue == "hq")
        XCTAssert(card_sq.stringValue == "sq")
        
        // king for all suites
        XCTAssert(card_ck.stringValue == "ck")
        XCTAssert(card_dk.stringValue == "dk")
        XCTAssert(card_hk.stringValue == "hk")
        XCTAssert(card_sk.stringValue == "sk")
        
        // ace for all suites
        XCTAssert(card_ca.stringValue == "ca")
        XCTAssert(card_da.stringValue == "da")
        XCTAssert(card_ha.stringValue == "ha")
        XCTAssert(card_sa.stringValue == "sa")
    }

    func testHashes() {
        // all digitValues of clubs
        XCTAssert(card_c2.hashValue == Card.Digit(.Club, .v2).hashValue)
        XCTAssert(card_c3.hashValue == Card.Digit(.Club, .v3).hashValue)
        XCTAssert(card_c4.hashValue == Card.Digit(.Club, .v4).hashValue)
        XCTAssert(card_c5.hashValue == Card.Digit(.Club, .v5).hashValue)
        XCTAssert(card_c6.hashValue == Card.Digit(.Club, .v6).hashValue)
        XCTAssert(card_c7.hashValue == Card.Digit(.Club, .v7).hashValue)
        XCTAssert(card_c8.hashValue == Card.Digit(.Club, .v8).hashValue)
        XCTAssert(card_c9.hashValue == Card.Digit(.Club, .v9).hashValue)
        XCTAssert(card_c10.hashValue == Card.Digit(.Club, .v10).hashValue)
        
        // 1 digit for all suites (except clubs, already done)
        XCTAssert(card_d2.hashValue == Card.Digit(.Diamond, .v2).hashValue)
        XCTAssert(card_h2.hashValue == Card.Digit(.Heart, .v2).hashValue)
        XCTAssert(card_s2.hashValue == Card.Digit(.Spade, .v2).hashValue)
        
        // jack for all suites
        XCTAssert(card_cj.hashValue == Card.Jack(.Club).hashValue)
        XCTAssert(card_dj.hashValue == Card.Jack(.Diamond).hashValue)
        XCTAssert(card_hj.hashValue == Card.Jack(.Heart).hashValue)
        XCTAssert(card_sj.hashValue == Card.Jack(.Spade).hashValue)
        
        // queen for all suites
        XCTAssert(card_cq.hashValue == Card.Queen(.Club).hashValue)
        XCTAssert(card_dq.hashValue == Card.Queen(.Diamond).hashValue)
        XCTAssert(card_hq.hashValue == Card.Queen(.Heart).hashValue)
        XCTAssert(card_sq.hashValue == Card.Queen(.Spade).hashValue)
        
        // king for all suites
        XCTAssert(card_ck.hashValue == Card.King(.Club).hashValue)
        XCTAssert(card_dk.hashValue == Card.King(.Diamond).hashValue)
        XCTAssert(card_hk.hashValue == Card.King(.Heart).hashValue)
        XCTAssert(card_sk.hashValue == Card.King(.Spade).hashValue)
        
        // ace for all suites
        XCTAssert(card_ca.hashValue == Card.Ace(.Club).hashValue)
        XCTAssert(card_da.hashValue == Card.Ace(.Diamond).hashValue)
        XCTAssert(card_ha.hashValue == Card.Ace(.Heart).hashValue)
        XCTAssert(card_sa.hashValue == Card.Ace(.Spade).hashValue)
    }

    func testHashesForDifferentCards() {
        let aDifferentCardHash = Card.Digit(.Club, .v2).hashValue
        
        // all digitValues of clubs
        XCTAssert(card_c2.hashValue != Card.Digit(.Diamond, .v2).hashValue)
        XCTAssert(card_c3.hashValue != aDifferentCardHash)
        XCTAssert(card_c4.hashValue != aDifferentCardHash)
        XCTAssert(card_c5.hashValue != aDifferentCardHash)
        XCTAssert(card_c6.hashValue != aDifferentCardHash)
        XCTAssert(card_c7.hashValue != aDifferentCardHash)
        XCTAssert(card_c8.hashValue != aDifferentCardHash)
        XCTAssert(card_c9.hashValue != aDifferentCardHash)
        XCTAssert(card_c10.hashValue != aDifferentCardHash)
        
        // 1 digit for all suites (except clubs, already done)
        XCTAssert(card_d2.hashValue != aDifferentCardHash)
        XCTAssert(card_h2.hashValue != aDifferentCardHash)
        XCTAssert(card_s2.hashValue != aDifferentCardHash)
        
        // jack for all suites
        XCTAssert(card_cj.hashValue != aDifferentCardHash)
        XCTAssert(card_dj.hashValue != aDifferentCardHash)
        XCTAssert(card_hj.hashValue != aDifferentCardHash)
        XCTAssert(card_sj.hashValue != aDifferentCardHash)
        
        // queen for all suites
        XCTAssert(card_cq.hashValue != aDifferentCardHash)
        XCTAssert(card_dq.hashValue != aDifferentCardHash)
        XCTAssert(card_hq.hashValue != aDifferentCardHash)
        XCTAssert(card_sq.hashValue != aDifferentCardHash)
        
        // king for all suites
        XCTAssert(card_ck.hashValue != aDifferentCardHash)
        XCTAssert(card_dk.hashValue != aDifferentCardHash)
        XCTAssert(card_hk.hashValue != aDifferentCardHash)
        XCTAssert(card_sk.hashValue != aDifferentCardHash)
        
        // ace for all suites
        XCTAssert(card_ca.hashValue != aDifferentCardHash)
        XCTAssert(card_da.hashValue != aDifferentCardHash)
        XCTAssert(card_ha.hashValue != aDifferentCardHash)
        XCTAssert(card_sa.hashValue != aDifferentCardHash)
    }

    
    
}
