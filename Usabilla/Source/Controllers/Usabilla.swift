//
//  Usabilla.swift
//  Usabilla
//
//  Created by KUTAN ÇINGISIZ on 24.04.2019.
//  Copyright © 2019 KUTAN ÇINGISIZ. All rights reserved.
//

import UIKit

open class Usabilla: UIViewController {
    open var delegate: UsabillaFormDelegate?
    public typealias FormLoadingHandler = (UIViewController) -> Void
    
    private var formViewController: UsabillaFormViewController!
    private var surveyViewController: UsabillaSurveyViewController!
    private var form: UsabillaForm!
    
    init(form: UsabillaForm) {
        self.form = form
        super.init(nibName: nil, bundle: nil)
    }
   
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    /// Function to configure requested form
    open func configureForm() {
        switch form.type! {
        case .FeedBack, .Rating:
            formViewController = UsabillaFormViewController(form: form)
            formViewController.delegate = self
            formViewController.configureFormView()
            delegate?.didFormLoad!(formViewController)
        case .Survey:
            surveyViewController = UsabillaSurveyViewController(form: form)
            surveyViewController.delegate = self
            delegate?.didFormLoad!(surveyViewController)
            break
        }
    }
    
    open func configureForm(then handler: @escaping FormLoadingHandler) {
        switch form.type! {
        case .FeedBack, .Rating:
            formViewController = UsabillaFormViewController(form: form)
            formViewController.delegate = self
            formViewController.configureFormView()
            handler(formViewController)
        case .Survey:
            surveyViewController = UsabillaSurveyViewController(form: form)
            surveyViewController.delegate = self
            handler(surveyViewController)
            break
        }
    }
}

extension Usabilla: UsabillaFormResultDelegate {
    public func onRatingSubmitButtonTapped(with rating: Int) {
        delegate?.didRatingSubmit?(formViewController, rating)
    }
    
    public func onDoneButtonTapped(with typedText: String) {
        delegate?.didFormSubmit!(formViewController, typedText)
    }
}

extension Usabilla: UsabillaSurveyResultDelegate {
    public func onSubmitSurveyButtonTapped(result: [String : Int]) {
        delegate?.didSurveySubmitted?(surveyViewController, result)
    }
}
