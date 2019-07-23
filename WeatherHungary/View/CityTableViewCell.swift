//
//  CityTableViewCell.swift
//  WeatherHungary
//
//  Created by Marton Molnar on 2019. 07. 22..
//  Copyright © 2019. Marton Molnar. All rights reserved.
//

import UIKit

class CityTableViewCell: UITableViewCell {

    var containerView = UIView()
    
    let cityNameLabel = UIElement.customLabelGrayNormal
    
    let countyTitleLabel = UIElement.customLabelGrayNormal
    
    
   
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLayout()
        setupCellLayoutCustomization()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        containerView = {
            let view = UIView()
            view.translatesAutoresizingMaskIntoConstraints = false
            view.backgroundColor = .clear
            view.layer.cornerRadius = 20
            view.layer.masksToBounds = true
            return view
        }()
        addSubview(containerView)
        containerView.addSubview(cityNameLabel)
        containerView.addSubview(countyTitleLabel)
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            cityNameLabel.trailingAnchor.constraint(equalTo:trailingAnchor, constant: 0),
            cityNameLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            cityNameLabel.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            cityNameLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 0),
            countyTitleLabel.trailingAnchor.constraint(equalTo:trailingAnchor, constant: 0),
            countyTitleLabel.centerXAnchor.constraint(equalTo: cityNameLabel.centerXAnchor),
            countyTitleLabel.centerYAnchor.constraint(equalTo: cityNameLabel.centerYAnchor,constant: 20),
            countyTitleLabel.leadingAnchor.constraint(equalTo: cityNameLabel.leadingAnchor, constant: 0)
            ])
    }
    
    private func setupCellLayoutCustomization() {
        
        
        cityNameLabel.font = UIFont.boldSystemFont(ofSize: 20)
        cityNameLabel.textColor = .black
        cityNameLabel.textAlignment = .left
        
        countyTitleLabel.adjustsFontSizeToFitWidth = true
        countyTitleLabel.font = UIFont.systemFont(ofSize: 12)
        
        
        
    }
    
    
}
