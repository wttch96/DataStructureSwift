//
//  BSTTests.swift
//  DataStructureSwiftTests
//
//  Created by Wttch on 2022/8/3.
//

import XCTest
@testable import DataStructureSwift

final class BSTTests : XCTestCase {
    
    func testInsertAndSerach() {
        var bst = BST<Int>()
        let count = 10
        let upperBound: UInt32 = 10
        for _ in 0..<count {
            let t = Int(arc4random_uniform(upperBound))
            bst.insert(t)
        }
        for _ in 0..<count/2 {
            let t = Int(arc4random_uniform(upperBound))
            print(t, bst.exists(t))
        }
    }
}
