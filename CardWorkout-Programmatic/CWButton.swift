//
//  CWButton.swift
//  CardWorkout-Programmatic
//
//  Created by Māris Lakšs on 12/03/2023.
//

import UIKit

class CWButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    init(color: UIColor, title: String, SystemImageName: String) {
        super.init(frame: .zero)
        // NOTE! Here we will configure BUTTONS appearance programmatically.
        // Tinted colour and SF Symbols
        configuration = .tinted()
        // Write configuration. to see all the options you have in Storyboard, just except
        // this will be via code
        configuration?.title = title
        configuration?.baseForegroundColor = color
        configuration?.baseBackgroundColor = color
        configuration?.cornerStyle = .medium

        // Below we add SF Symbols to our UIButtons using CODE
        configuration?.image = UIImage(systemName: SystemImageName)
        configuration?.imagePadding = 5
        configuration?.imagePlacement = .leading

        translatesAutoresizingMaskIntoConstraints = false
    }
}
