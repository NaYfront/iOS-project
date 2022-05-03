//
//  RouterTest.swift
//  SleepAppTests
//
//  Created by NaYfront on 03.05.2022.
//

import XCTest
@testable import SleepApp

class MockNavigationController: UINavigationController {
    var presentedVC: UIViewController?
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        self.presentedVC = viewController
        super.pushViewController(viewController, animated: true)
    }
}

class RouterTest: XCTestCase {

    var router: RouterProtocol!
    var navigationController = MockNavigationController()
    let assembly = MainModuleAssemblyBuilder()
    
    override func setUpWithError() throws {
        router = Router(navigationController: navigationController, assemblyBuilder: assembly)
    }

    override func tearDownWithError() throws {
        router = nil
    }

    func testRouter() {
        let detailContent = [DetailContent(author: "Author", title: "Title", image: UIImage(systemName: "questionmark.app.fill") ?? UIImage())]
        router.showDetailViewController(detailContent: detailContent)
        
        let detailViewController = navigationController.presentedVC
        
        XCTAssertTrue(detailViewController is DetailViewController)
    }

}
