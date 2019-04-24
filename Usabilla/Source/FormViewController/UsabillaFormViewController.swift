//
//  UsabillaFormViewController.swift
//  Usabilla
//
//  Created by KUTAN ÇINGISIZ on 24.04.2019.
//  Copyright © 2019 KUTAN ÇINGISIZ. All rights reserved.
//

import UIKit

open class UsabillaFormViewController: UIViewController {
    private let formView = UsabillaFormView()
    private let form: UsabillaForm!
    
    public init(form: UsabillaForm) {
        self.form = form
        super.init(nibName: nil, bundle: nil)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        layoutViews()
    }
}

// MARK: Layout
extension UsabillaFormViewController {
    fileprivate func layoutViews() {
        view.backgroundColor = .white
        view.addSubview(formView)
        formView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            formView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            formView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            formView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            formView.heightAnchor.constraint(equalToConstant: 200)
            ])
    }
    
    /// Load the requested form by the user
    func configureFormView() {
        formView.activateForm(for: form.type)
    }
}

