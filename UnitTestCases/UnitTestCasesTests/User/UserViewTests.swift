//
//  UserViewTests.swift
//  UnitTestCasesTests
//
//  Created by Nitin Bhatt on 8/16/22.
//

import XCTest
@testable import UnitTestCases

class UserViewTests: XCTestCase {
    var tableView = UITableView()
    var emptyTableView = UITableView()
    var controller = UserListViewController()
    
    override func setUp() {
        controller.loadViewIfNeeded()
        tableView.dataSource = self
    }

    override func tearDown() {
    }
    
    // Mark: UI elements tests
    
    func test_WhenCreated_HasTableView(){
        XCTAssertNotNil(controller.tableView)
    }
    
    func test_WhenCreated_TableViewHasDelegate(){
        XCTAssertNotNil(controller.tableView.delegate)
    }
    
    func test_WhenCreated_TableViewHasDataSource(){
        XCTAssertNotNil(controller.tableView.dataSource)
    }
    
    func test_TableViewConformsTableViewDataSourceProtocol(){
        XCTAssertTrue(controller.conforms(to: UITableViewDataSource.self))
        XCTAssertTrue(controller.responds(to: #selector(controller.tableView(_ : numberOfRowsInSection:))))
        XCTAssertTrue(controller.responds(to: #selector(controller.tableView(_ : cellForRowAt:))))
    }
    
    func test_RegisterCellWithClassAndNib(){
        tableView.register(UserTableViewCell.nib, forCellReuseIdentifier: UserTableViewCell.identifier)
        let cell = tableView.dequeueReusableCell(withIdentifier: UserTableViewCell.identifier)
        XCTAssertNotNil(cell)
    }
    
    func test_TableCellHasCorrectDefaultLabelText(){
        tableView.register(UserTableViewCell.nib, forCellReuseIdentifier: UserTableViewCell.identifier)
        let cell = tableView.dequeueReusableCell(withIdentifier: UserTableViewCell.identifier) as?  UserTableViewCell
        XCTAssertEqual(cell?.nameLabel.text, "Label")
        XCTAssertEqual(cell?.emailLabel.text, "Label")

    }
}


extension UserViewTests:UITableViewDataSource{
 
    func numberOfSections(in tableView: UITableView) -> Int {
        return tableView == emptyTableView ? 0 : 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == emptyTableView{
            return 0
        }else{
            return section == 0 ? 1 : 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
