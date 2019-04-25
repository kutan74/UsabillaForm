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
        let form = UsabillaForm(formID: "yourFormId", type: .FeedBack, customProperties: nil)
        usabilla = Usabilla(form: form)
        
        usabilla.delegate = self
        usabilla.configureForm()
    }
    
    func formWithDefaultProperties() {
        let customFormProperties = FormProperties(formBackgroundColor: .white,
                                                  formTitleTextColor: .black,
                                                  formTitleFont: .systemFont(ofSize: 14, weight: .light))
        let form = UsabillaForm(formID: "yourFormId", type: .FeedBack, customProperties: customFormProperties)
        usabilla = Usabilla(form: form)
        
        usabilla.delegate = self
        usabilla.configureForm()
    }
    
    func formWithCustomProperties() {
        usabilla.delegate = self
        usabilla.configureForm()
    }
    
}

extension ViewController: UsabillaFormDelegate {
    func didFormSubmit(_ form: UIViewController, _ typedText: String) {
        form.dismiss(animated: true, completion: nil)
        print(typedText)
    }
    
    func didFormLoad(_ form: UIViewController) {
        present(form, animated: true, completion: nil)
    }
}

