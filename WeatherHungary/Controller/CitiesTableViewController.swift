//
//  TableViewController.swift
//  WeatherHungary
//
//  Created by Marton Molnar on 2019. 07. 22..
//  Copyright © 2019. Marton Molnar. All rights reserved.
//

import UIKit

class CitiesTableViewController: UITableViewController {
    
    let reuseIdentifier = "reuseIdentifier"
    
    let cityNameArray = ["Budapest","Szombathely","Sopron","Szeged","Miksolc"]
    
    let countyNameArray = ["Budapest County","Vas County","Győr-Moson-Sopron County","Csongrád County","Borsod-Abaúj-Zemplén County"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupTabBar()
    }
    
    //MARK: TableView functions
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cityNameArray.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! CityTableViewCell
        
        cell.cityNameLabel.text = cityNameArray[indexPath.row]
        cell.cityNameLabel.textAlignment = .center
        cell.countyTitleLabel.text = countyNameArray[indexPath.row]
        cell.countyTitleLabel.textAlignment = .center
        cell.backgroundColor = .clear
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailsVC = DetailsViewController()
        detailsVC.cityName  = cityNameArray[indexPath.row]
        navigationController?.pushViewController(detailsVC, animated: true)
    }
    
    //MARK: Setup layout functions
    fileprivate func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CityTableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        tableView.tintColor = .customWhite
        self.title = "Weather Hungary"
        tableView.tableFooterView = UIView(frame: .zero)
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    }
    
    private func setupTabBar() {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.navigationController?.navigationBar.barTintColor = .middleMagenta
        self.navigationController?.navigationBar.tintColor = .customWhite
        self.navigationController?.navigationBar.isTranslucent = false
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        self.navigationItem.hidesBackButton = false
    }
    
}
