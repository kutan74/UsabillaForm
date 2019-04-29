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
        formWithDefaultProperties()
    }
    
    func formWithDefaultProperties() {
        let form = UsabillaForm(formID: "yourFormId", type: .Rating)
        usabilla = Usabilla(form: form)
        usabilla.delegate = self
        usabilla.configureForm()
    }
    
    func formWithFeedBack() {
        let form = UsabillaForm(formID: "yourFormId", type: .FeedBack)
        usabilla = Usabilla(form: form)
        usabilla.delegate = self
        usabilla.configureForm()
    }
    
    func formWithCustomProperties() {
        var form = UsabillaForm(formID: "yourFormId", type: .FeedBack)
        form.customProperties = UsabillaForm.UsabillaFormProperties(formBackgroundColor: .black,
                                                                    formTitleTextColor: .black,
                                                                    formTitleFont: .systemFont(ofSize: 14, weight: .light))
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
        print(typedText)
    }
    
    func didRatingSubmit(_ form: UIViewController, _ rating: Int) {
        print(rating)
    }
}

