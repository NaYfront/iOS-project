//
//  ListenModuleTests.swift
//  SleepAppTests
//
//  Created by NaYfront on 08.04.2022.
//

import XCTest
@testable import SleepApp

class MockView: MainViewProtocol {
}
                    
class ListenModuleTests: XCTestCase {

    var view: MockView!
    var content: [MainContent]!
    var presenter: MainPresenter!
    var vc: UINavigationController!
    var mvc: MainViewController!
    
    override func setUpWithError() throws {
        view = MockView()
        content = MainModuleBuilder.createModuleContent()
        presenter = MainPresenter(view: view, content: content)
        vc = MainModuleBuilder.createListenFirstScreen()
        mvc = MainViewController()
    }

    override func tearDownWithError() throws {
        view = nil
        content = nil
        presenter = nil
        vc = nil
        mvc = nil
    }

    func testModuleIsNotNil() throws {
        XCTAssertNotNil(view, "view is not nil")
        XCTAssertNotNil(content, "content is not nil")
        XCTAssertNotNil(view, "presenter is not nil")
    }
    
    func testContentCheck() {
        XCTAssertEqual(content[0].title, "ASMR")
        XCTAssertEqual(content[2].color, UIColor(named: "deepPurple"))
        XCTAssertEqual(content[1].detailContent[0].author, "John Ronald Reuel Tolkien")
    }
    
    func testViewController() {
        XCTAssertEqual(vc.viewControllers[0].isBeingPresented, false)
        XCTAssertEqual(vc.viewControllers[0].navigationItem.title, "Listen")
    }
}
