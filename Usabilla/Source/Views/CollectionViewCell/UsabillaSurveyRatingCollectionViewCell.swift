//
//  UsabillaSurveyRatingCollectionViewCell.swift
//  Usabilla
//
//  Created by KUTAN ÇINGISIZ on 30.04.2019.
//  Copyright © 2019 KUTAN ÇINGISIZ. All rights reserved.
//

import UIKit

open class UsabillaSurveyRatingCollectionViewCell: UICollectionViewCell {
    let checkBoxView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 12.5
        view.clipsToBounds = true
        return view
    }()
    public override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(checkBoxView)
        checkBoxView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            checkBoxView.leadingAnchor.constraint(equalTo: leadingAnchor),
            checkBoxView.trailingAnchor.constraint(equalTo: trailingAnchor),
            checkBoxView.topAnchor.constraint(equalTo: topAnchor),
            checkBoxView.bottomAnchor.constraint(equalTo: bottomAnchor),
            ])
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension UsabillaSurveyRatingCollectionViewCell {
    func applySurveyCustomProperties(accentColor: UIColor) {
        checkBoxView.layer.borderColor = accentColor.cgColor
        checkBoxView.layer.borderWidth = 1.0
    }
}
