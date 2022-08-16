//
//  UserListViewController.swift
//  UnitTestCases
//
//  Created by Nitin Bhatt on 8/16/22.
//

import UIKit


class UserListViewController: UIViewController {
    
    //MARK: - Outlet and Variable
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.frame = self.view.bounds
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UserTableViewCell.nib, forCellReuseIdentifier: UserTableViewCell.identifier)
        return tableView
    }()
    
    lazy var viewModel = {
      UserViewModel()
    }()
    
    private var dataSource: [UserList]?


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(tableView)
        
        fetchContacts()
    }
    
    func fetchContacts(){
        viewModel.getUsers()
        
        viewModel.reloadTableView = { [self] in
            DispatchQueue.main.async {
                tableView.reloadData()
            }
        }
    }
}
//MARK: - UITableview Delegate and Datasource
extension UserListViewController:UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.userCellViewModels.count 
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: UserTableViewCell.identifier, for: indexPath) as? UserTableViewCell else { return UITableViewCell() }
        let cellViewModel = viewModel.getCellViewModel(at: indexPath)
        cell.cellViewModel = cellViewModel
        return cell
    }
}
