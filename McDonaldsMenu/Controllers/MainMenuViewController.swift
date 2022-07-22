//
//  MainMenuViewController.swift
//  McDonaldsMenu
//
//  Created by Mario Alberto Barragán Espinosa on 20/07/22.
//

import UIKit

final class MainMenuViewController: UIViewController {
    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(ProductCarouselTableViewCell.self, forCellReuseIdentifier: ProductCarouselTableViewCell.identifier)
        tableView.backgroundColor = .white
        tableView.separatorStyle = .none
        tableView.register(ProductHeaderView.self, forHeaderFooterViewReuseIdentifier: ProductHeaderView.identifier)
        return tableView
    }()
    
    private let menuCategoriesViewModel: MenuCategoriesViewModel?
    
    var menuCategories = [MenuCategory]()
    
    init(menuCategoriesViewModel: MenuCategoriesViewModel? = nil) {
        self.menuCategoriesViewModel = menuCategoriesViewModel
        super.init(nibName: nil, bundle: Bundle(for: type(of: self)))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableHeaderView = ProductHeaderView()
        menuCategoriesViewModel?.fetch()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    func display(_ menuCategories: [MenuCategory]) {
        self.menuCategories = menuCategories
        self.tableView.reloadData()
    }
}

extension MainMenuViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        menuCategories.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ProductCarouselTableViewCell.identifier, for: indexPath) as? ProductCarouselTableViewCell else {
            return UITableViewCell()
        }
        let category = menuCategories[indexPath.section]
        cell.configure(with: category.products)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        200
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        40
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: ProductHeaderView.identifier) as? ProductHeaderView else { return UIView() }
        
        header.configure(with: menuCategories[section].title)
        
        return header
    }
}
