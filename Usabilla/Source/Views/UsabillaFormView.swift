//
//  UsabillaFormView.swift
//  Usabilla
//
//  Created by KUTAN ÇINGISIZ on 24.04.2019.
//  Copyright © 2019 KUTAN ÇINGISIZ. All rights reserved.
//

import UIKit

class UsabillaFormView: UIView {
    lazy var feedBackView = UsabillaFeedBackView()
    lazy var ratingView = UsabillaRatingView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        layoutViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init (coder:) has not been implemented")
    }
}

// MARK: Layout
private extension UsabillaFormView {
    func layoutViews() {
        [feedBackView, ratingView].forEach {
            addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.isHidden = true
            // Layout form views to bottom
            // Let them adjust their own heights
            NSLayoutConstraint.activate([
                $0.leadingAnchor.constraint(equalTo: leadingAnchor),
                $0.trailingAnchor.constraint(equalTo: trailingAnchor),
                $0.bottomAnchor.constraint(equalTo: bottomAnchor)
                ])
        }
    }
}

// MARK: FormViews Visibility
extension UsabillaFormView {
    func activateForm(for form: UsabillaForm) {
        switch form.type! {
        case .FeedBack:
            feedBackView.isHidden = false
            feedBackView.applyFormSettings(for: form)
            // I'm not sure if it's the right place to call this function ?
            feedBackView.textField.becomeFirstResponder()
        case .Rating:
            ratingView.isHidden = false
        case .Survey:
            break
        }
    }
}
