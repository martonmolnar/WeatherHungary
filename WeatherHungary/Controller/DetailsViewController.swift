//
//  ViewController.swift
//  WeatherHungary
//
//  Created by Marton Molnar on 2019. 07. 18..
//  Copyright © 2019. Marton Molnar. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, DetailsDownloadedProtocol, DetailsDownloadFailedProtocol {
    //Handle to get back the details from the WeatherModel
    func detailsDownloaded(cityDetails: Array<String>) {
        self.cityDetails = cityDetails
        tableView.reloadData()
    }
    
    var cityDetails = [String]()
    
    let tableView = UITableView()
    let cellId = "cellId"
    
    var cityName = ""
    
    let bottomContainer = UIView()
    let titleLabel = UIElement.customLabelLarge
    let cityLabel = UIElement.customLabelGrayNormal
    
    
    let layout = UICollectionViewFlowLayout()
    let getWethaerModel = GetWeatherModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTabBar()
        setupTableViewLayout()
        
        self.tableView.separatorColor = .lightGray
        
        self.tableView.register(CityTableViewCell.self, forCellReuseIdentifier: cellId)
        self.tableView.separatorColor = .gray
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        getWethaerModel.getWeather(cityName: cityName)
        getWethaerModel.delegeateDetails = self
        getWethaerModel.delegeateDetailsDownloadFailed = self
    }
    
    //MARK: TableView functions
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if cityDetails.count == 0 {
            setTextOnEmptyCollectionView(title: "There is no details :(", message: "There is no details to this city, please try with an other one")
            
        } else {
            removeTextIfCollectionViewIsNotEmpty()
        }
        
        return cityDetails.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! CityTableViewCell
        
        cell.cityNameLabel.text = cityDetails[indexPath.row]
        cell.cityNameLabel.textAlignment = .center
        cell.backgroundColor = .clear
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.translatesAutoresizingMaskIntoConstraints = false
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        headerView.addSubview(titleLabel)
        titleLabel.text = "\(cityName) Weather Details"
        titleLabel.textAlignment = .center
        titleLabel.textColor = .black
        titleLabel.font = UIFont.boldSystemFont(ofSize: 18)
        
        NSLayoutConstraint.activate([
            headerView.heightAnchor.constraint(equalToConstant: 60),
            titleLabel.topAnchor.constraint(equalTo: headerView.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 8),
            titleLabel.trailingAnchor.constraint(equalTo: headerView.trailingAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: headerView.bottomAnchor)            
            ])
        
        return headerView
    }
    
    //MARK: Setup layout functions
    private func setupTabBar() {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.navigationController?.navigationBar.barTintColor = .middleMagenta
        self.navigationController?.navigationBar.tintColor = .customWhite
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationItem.hidesBackButton = false
        
    }
    
    private func setupTableViewLayout() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .white
        tableView.tableFooterView = UIView(frame: .zero)
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
            ])
        tableView.isHidden = false
    }
    
    func displayMyAlertMessage(){
        
        let myAlert = UIAlertController(title:"There is no internet connectivity!", message: "Please check it in your settings and try again!", preferredStyle: UIAlertController.Style.alert)
        
        let confirmAction = UIAlertAction(title: "OK", style: .default) { (_) in
           self.navigationController?.popViewController(animated: true)
        }
        
        myAlert.addAction(confirmAction)
        
        self.present(myAlert, animated:true,completion:nil)
    }
    
}

extension DetailsViewController {
    
    func setTextOnEmptyCollectionView(title: String, message: String) {
        let bgView = UIView()
        let titleLabel = UILabel()
        let messageLabel = UILabel()
        
        tableView.addSubview(bgView)
        bgView.translatesAutoresizingMaskIntoConstraints = false
        bgView.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        bgView.addSubview(messageLabel)
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // Layout constraints
        bgView.anchor(centerX: tableView.centerXAnchor, centerY: tableView.centerYAnchor, xPadding: nil, yPadding: nil, width: tableView.frame.width, height: tableView.frame.height, top: nil, leading: nil, bottom: nil, trailing: nil, paddingTop: nil, paddingLeading: nil, paddingBottom: nil, paddingTrailing: nil)
        
        titleLabel.anchor(centerX: bgView.centerXAnchor, centerY: bgView.centerYAnchor, xPadding: nil, yPadding: 0, width: tableView.frame.width * 0.8, height: 30, top: nil, leading: nil, bottom: nil, trailing: nil, paddingTop: nil, paddingLeading: nil, paddingBottom: nil, paddingTrailing: nil)
        
        messageLabel.anchor(centerX: bgView.centerXAnchor, centerY: bgView.centerYAnchor, xPadding: nil, yPadding: 35, width: tableView.frame.width * 0.8, height: 60, top: nil, leading: nil, bottom: nil, trailing: nil, paddingTop: nil, paddingLeading: nil, paddingBottom: nil, paddingTrailing: nil)
        
        // Customization
        bgView.backgroundColor = .customWhite
        titleLabel.text = title
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.boldSystemFont(ofSize: 18)
        titleLabel.textColor = .darkMagenta
        messageLabel.text = message
        messageLabel.numberOfLines = 2
        messageLabel.textAlignment = .center
        messageLabel.font = UIFont.systemFont(ofSize: 13)
        messageLabel.textColor = .gray
        
        // Assign view to tableview's background
        tableView.backgroundView = bgView
        
    }
    // Remove
    func removeTextIfCollectionViewIsNotEmpty() {
        tableView.backgroundView = nil
        
    }
}
