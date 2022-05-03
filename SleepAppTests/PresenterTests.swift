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
    var router: RouterProtocol!
    var assemblyBuilder: AssemblyBuilderProtocol!
    
    override func setUpWithError() throws {
        view = MockView()
        content = assemblyBuilder.createModuleContent()
        presenter = MainPresenter(view: view, content: content, router: router)
    }

    override func tearDownWithError() throws {
        view = nil
        content = nil
        presenter = nil
    }

    func testModuleIsNotNil() {
        XCTAssertNotNil(view, "view is not nil")
        XCTAssertNotNil(content, "content is not nil")
        XCTAssertNotNil(view, "presenter is not nil")
    }
}
