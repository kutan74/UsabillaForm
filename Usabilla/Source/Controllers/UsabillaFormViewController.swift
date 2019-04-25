//
//  UsabillaFormViewController.swift
//  Usabilla
//
//  Created by KUTAN ÇINGISIZ on 24.04.2019.
//  Copyright © 2019 KUTAN ÇINGISIZ. All rights reserved.
//

import UIKit

open class UsabillaFormViewController: UIViewController {
    /// Subview
    private let formView = UsabillaFormView()
    /// Dynamic bottom constraint for formView
    private var formViewBottomConstraint: NSLayoutConstraint!
    
    /// Requested form
    private let form: UsabillaForm!
    
    open var delegate: UsabillaFormResultDelegate?
    
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
        setKeyboardNotifications()
    }
    
    fileprivate func setKeyboardNotifications() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillShow),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillHide),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
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
            formView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            ])
        formViewBottomConstraint = formView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        formViewBottomConstraint.isActive = true
    }
   
    /// Load the requested form by the user
    func configureFormView() {
        // Load the default form if none requested
        guard let formType = form.type else {
            formView.activateForm(for: .FeedBack)
            return
        }
        formView.activateForm(for: formType)
    }   
}

// MARK: FormView bottom constraint during keyboard state change
extension UsabillaFormViewController {
    @objc func keyboardWillShow(notification: NSNotification) {
        guard let userInfo = notification.userInfo else {
            return
        }
        
        guard let keyboardSize = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else {
            return
        }
        
        let keyboardFrame = keyboardSize.cgRectValue
        if formView.frame.origin.y == 0 {
            UIView.animate(withDuration: 0.2, animations: {
                self.formViewBottomConstraint.constant = -keyboardFrame.height
                self.view.layoutIfNeeded()
            })
        }
    }
    
    /** Function reset FormViews frame position when the keyboard is closed
     It also means that the users done with the form. Let our parent view controller knows that we are ready to submit
    */
    @objc func keyboardWillHide(notification: NSNotification) {
        if formView.frame.origin.y != 0 {
            UIView.animate(withDuration: 0.2, animations: {
                self.formViewBottomConstraint.constant = 0
                self.view.layoutIfNeeded()
            })
            
            /// Don't know if it's makes sense to prevent nil inputs ?
            /*
            guard formView.feedBackView.textField.text != nil else {
                return
            }
            */
            
            delegate?.onDoneButtonTapped(with: formView.feedBackView.textField.text)
        }
    }
}

