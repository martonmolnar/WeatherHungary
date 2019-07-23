//
//  UIElements.swift
//  WeatherHungary
//
//  Created by Marton Molnar on 2019. 07. 18..
//  Copyright © 2019. Marton Molnar. All rights reserved.
//

import UIKit


struct UIElement {
    
    static var customLabelLarge: UITextView {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textColor = .green
        textView.font = UIFont.boldSystemFont(ofSize: 22)
        textView.textAlignment = .center
        textView.backgroundColor = .clear
        textView.isEditable = false
        textView.isSelectable = false
        textView.setContentOffset(CGPoint.zero, animated: true) // Start text at top
        return textView
    }
 
    static var customLabelGrayNormal: UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .grayText
        label.textAlignment = .left
        label.font = label.font.withSize(12)
        label.adjustsFontSizeToFitWidth = true
        return label
    }
    
}



