//
//  UsabillaRatingView.swift
//  Usabilla
//
//  Created by KUTAN ÇINGISIZ on 24.04.2019.
//  Copyright © 2019 KUTAN ÇINGISIZ. All rights reserved.
//

import UIKit

class UsabillaRatingView: UIView {
    let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 14, weight: .light)
        label.text = "Rate our awesome product"
        return label
    }()
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fillEqually
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.alignment = .fill
        return stackView
    }()
    
    let sendButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.black.withAlphaComponent(0.9)
        button.setTitle("Send", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .light)
        button.layer.cornerRadius = 5
        button.clipsToBounds = true
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layoutViews()
        layoutStackViewItems()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init (coder:) has not been implemented")
    }
}

extension UsabillaRatingView {
    fileprivate func layoutViews() {
        [titleLabel, stackView, sendButton].forEach {
            addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        stackView.isUserInteractionEnabled = false
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            stackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12),
            stackView.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            stackView.heightAnchor.constraint(equalToConstant: 24),
            stackView.widthAnchor.constraint(equalToConstant: 152),
            sendButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 30),
            sendButton.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            sendButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            sendButton.bottomAnchor.constraint(equalTo: bottomAnchor),
            sendButton.heightAnchor.constraint(equalToConstant: 45)
            ])
    }
    
    func layoutStackViewItems() {
        let starSize: CGFloat = 24
        
        for i in 1...5 {
            let starView = UIButton()
            starView.setImage(UIImage(named: "star_not_filled"), for: .normal)
            starView.tag = i
            stackView.addArrangedSubview(starView)
            
            starView.translatesAutoresizingMaskIntoConstraints = false
            starView.widthAnchor.constraint(equalToConstant: starSize).isActive = true
            starView.heightAnchor.constraint(equalToConstant: starSize).isActive = true
        }
    }    
}

// MARK: Rating star update methods
extension UsabillaRatingView {
    func updateRatingStars(to index: Int) {
        stackView.subviews.forEach {
            guard let starView = $0 as? UIButton else {
                return
            }
            
            if starView.tag <= index {
                starView.setImage(UIImage(named: "star_filled"), for: .normal)
            } else {
                starView.setImage(UIImage(named: "star_not_filled"), for: .normal)
            }
        }
    }
}
