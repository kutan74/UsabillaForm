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
    public typealias FormLoadingHandler = (Result< UIViewController, Error>) -> Void
    
    // Feedback and rating forms
    private var formViewController: UsabillaFormViewController!
    
    // Survey form
    private var surveyViewController: UsabillaSurveyViewController!
    
    /// Form being created by the user
    private var form: UsabillaForm!
    
    /// Form validator
    private let formValidator = UsabillaFormValidator()
    
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
}

// MARK: Form loading

extension Usabilla {
    open func configureFeedBackForm(then handler: @escaping FormLoadingHandler) {
        do {
            try formValidator.validateRequestedForm(id: form.formID)
            formViewController = UsabillaFormViewController(form: form)
            formViewController.delegate = self
            formViewController.configureFormView()
            handler(.success(formViewController))
        } catch {
            handler(.failure(error))
        }
    }
    
    open func configureSurvey(then handler: @escaping FormLoadingHandler) {
        do {
            try formValidator.validateRequestedSurveyForm(for: form.survey?.surveyQuestions ?? [])
            surveyViewController = UsabillaSurveyViewController(form: form)
            surveyViewController.delegate = self
            handler(.success(surveyViewController))
        } catch {
            handler(.failure(error))
        }
    }
}

// MARK: UsabillaFormResultDelegate methods

extension Usabilla: UsabillaFormResultDelegate {
    public func onRatingSubmitButtonTapped(with rating: Int) {
        delegate?.didRatingSubmit?(formViewController, rating)
    }
    
    public func onDoneButtonTapped(with typedText: String) {
        delegate?.didFormSubmit!(formViewController, typedText)
    }
}

// MARK: UsabillaSurveyResultDelegate methods

extension Usabilla: UsabillaSurveyResultDelegate {
    public func onSubmitSurveyButtonTapped(result: [String : Int]) {
        delegate?.didSurveySubmitted?(surveyViewController, result)
    }
}
