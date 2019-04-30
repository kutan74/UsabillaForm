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
        formWithCustomProperties()
    }
    
    func formWithDefaultProperties() {
        let form = UsabillaForm(formID: "yourFormId", type: .FeedBack)
        usabilla = Usabilla(form: form)
        usabilla.delegate = self
        usabilla.configureForm()
    }
    
    func formWithCompletionHandler() {
        let form = UsabillaForm(formID: "yourFormId", type: .FeedBack)
        usabilla = Usabilla(form: form)
        usabilla.delegate = self
        usabilla.configureForm { (form) in
            self.present(form, animated: true, completion: nil)
        }
    }
    
    func formWithRatingView() {
        let form = UsabillaForm(formID: "yourFormId", type: .Rating)
        usabilla = Usabilla(form: form)
        usabilla.delegate = self
        usabilla.configureForm()
    }
    
    func formWithCustomProperties() {
        var form = UsabillaForm(formID: "yourFormId", type: .FeedBack)
        form.customProperties = UsabillaForm.UsabillaFormProperties(formBackgroundColor: .white,
                                                                    formTitleTextColor: .black,
                                                                    formTitleFont: .systemFont(ofSize: 12, weight: .light),
                                                                    feedBackQuestionTitle: "Your feedback",
                                                                    ratingTitle: "Rate our awesome app")
        usabilla = Usabilla(form: form)
        usabilla.delegate = self
        usabilla.configureForm()
    }
}

extension ViewController: UsabillaFormDelegate {   
    func didFormLoad(_ form: UIViewController) {
        present(form, animated: true, completion: nil)
    }
    
    func didFormSubmit(_ form: UIViewController, _ typedText: String) {
        form.dismiss(animated: true, completion: nil)
        print(typedText)
    }
    
    func didRatingSubmit(_ form: UIViewController, _ rating: Int) {
        form.dismiss(animated: true, completion: nil)
        print(rating)
    }
}

