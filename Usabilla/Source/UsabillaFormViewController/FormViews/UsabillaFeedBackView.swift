//
//  UsabillaFeedBackView.swift
//  Usabilla
//
//  Created by KUTAN ÇINGISIZ on 24.04.2019.
//  Copyright © 2019 KUTAN ÇINGISIZ. All rights reserved.
//

import UIKit

class UsabillaFeedBackView: UIView {
    let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 14, weight: .light)
        label.text = "Type your feedback"
        return label
    }()
    
    let textField: UsabillaTextView = {
        let textField = UsabillaTextView()
        textField.sizeToFit()
        textField.isScrollEnabled = false
        textField.textColor = UIColor.black.withAlphaComponent(0.3)
        return textField
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layoutViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init (coder:) has not been implemented")
    }
}

// MARK: Layout

extension UsabillaFeedBackView {
    fileprivate func layoutViews() {
        [titleLabel, textField].forEach {
            addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            textField.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            textField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12),
            textField.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -30),
            textField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            textField.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.size.width - 24),
            ])
    }
}

// MARK: Form settings

extension UsabillaFeedBackView {
    /** Apply form settings. Will apply default settings If user didn't specify one
    */
    func applyFormSettings(for form: UsabillaForm) {
        titleLabel.textColor = form.customProperties?.formTitleTextColor
        titleLabel.font = form.customProperties?.formTitleFont
        backgroundColor = form.customProperties?.formBackgroundColor
        titleLabel.text = form.customProperties?.feedBackQuestionTitle
    }
}
