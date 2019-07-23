//
//  Extensions.swift
//  WeatherHungary
//
//  Created by Marton Molnar on 2019. 07. 18..
//  Copyright © 2019. Marton Molnar. All rights reserved.
//

import UIKit

extension UIView {
    
    // If there's no value required, use nil at function arguments
    
    public func anchor(centerX: NSLayoutXAxisAnchor?, centerY: NSLayoutYAxisAnchor?, xPadding: CGFloat?, yPadding: CGFloat?, width: CGFloat?, height: CGFloat?,
                       top: NSLayoutYAxisAnchor?, leading: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, trailing: NSLayoutXAxisAnchor?,
                       paddingTop: CGFloat?, paddingLeading: CGFloat?, paddingBottom: CGFloat?, paddingTrailing: CGFloat?) {
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        if let centerX = centerX  {
            self.centerXAnchor.constraint(equalTo: centerX, constant: xPadding ?? 0).isActive = true
        }
        
        if let centerY = centerY {
            self.centerYAnchor.constraint(equalTo: centerY, constant: yPadding ?? 0).isActive = true
        }
        
        if let top = top {
            self.topAnchor.constraint(equalTo: top, constant: paddingTop ?? 0).isActive = true
        }
        
        if let bottom = bottom {
            self.bottomAnchor.constraint(equalTo: bottom, constant: paddingBottom ?? 0).isActive = true
        }
        
        if let leading = leading {
                self.leadingAnchor.constraint(equalTo: leading, constant: paddingLeading ?? 0).isActive = true
        }
        
        if let trailing = trailing {
                self.trailingAnchor.constraint(equalTo: trailing, constant: paddingTrailing ?? 0).isActive = true
        }
        
        if width != nil {
            NSLayoutConstraint.activate([
                self.widthAnchor.constraint(equalToConstant: width!)
                ])
        }
        
        if height != nil {
            NSLayoutConstraint.activate([
                self.heightAnchor.constraint(equalToConstant: height!)
                ])
        }
    }
    
    
}
