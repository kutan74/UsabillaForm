//
//  ViewController.swift
//  UsabillaExamples
//
//  Created by KUTAN ÇINGISIZ on 24.04.2019.
//  Copyright © 2019 KUTAN ÇINGISIZ. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var usabilla: Usabilla!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func displayForm(_ sender: Any) {
        let form = UsabillaForm(formID: "yourFormId", type: .FeedBack)
        usabilla = Usabilla(form: form)
        usabilla.delegate = self
        usabilla.configureFeedBackForm { [weak self] result in
            switch result {
            case .success(let form):
                self?.present(form, animated: true, completion: nil)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    @IBAction func displayRatingForm(_ sender: Any) {
        let form = UsabillaForm(formID: "yourFormId", type: .Rating)
        usabilla = Usabilla(form: form)
        usabilla.delegate = self
        usabilla.configureFeedBackForm { [weak self] result in
            switch result {
            case .success(let form):
                self?.present(form, animated: true, completion: nil)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    
    @IBAction func displaySurvey(_ sender: Any) {
        let surveyQuestions = ["Question 1",
                               "Question 2",
                               "Question 3"]
        let survey = UsabillaForm.Survey(surveyQuestions: surveyQuestions)
        let form = UsabillaForm(formID: "yourFormId",
                                type: .Survey,
                                survey: survey)
        
        usabilla = Usabilla(form: form)
        usabilla.delegate = self
        usabilla.configureSurvey { [weak self] result in
            switch result {
            case .success(let form):
                self?.present(form, animated: true, completion: nil)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func feedBackFormWithCustomProperties() {
        let form = UsabillaForm(formID: "yourFormId", type: .FeedBack)
        form.customProperties?.formBackgroundColor = .white
        form.customProperties?.formTitleFont = UIFont.systemFont(ofSize: 14, weight: .light)
        form.customProperties?.formTitleTextColor = .black
        form.customProperties?.feedBackQuestionTitle = "Your Feedback ?"
        
        usabilla = Usabilla(form: form)
        usabilla.delegate = self
        usabilla.configureFeedBackForm { [weak self] result in
            switch result {
            case .success(let form):
                self?.present(form, animated: true, completion: nil)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

extension ViewController: UsabillaFormDelegate {   
    func didFormSubmit(_ form: UIViewController, _ typedText: String) {
        form.dismiss(animated: true, completion: nil)
        print(typedText)
    }
    
    func didRatingSubmit(_ form: UIViewController, _ rating: Int) {
        form.dismiss(animated: true, completion: nil)
        print(rating)
    }
    
    func didSurveySubmitted(_ form: UIViewController, _ surveyResult: [String : Int]) {
        form.dismiss(animated: true, completion: nil)
        print(surveyResult)
    }
}

