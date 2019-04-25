//
//  ViewController.swift
//  UsabillaExamples
//
//  Created by KUTAN ÇINGISIZ on 24.04.2019.
//  Copyright © 2019 KUTAN ÇINGISIZ. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    let usabilla = Usabilla()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        usabilla.delegate = self
        
    }

    @IBAction func displayForm(_ sender: Any) {
        usabilla.configureForm(with: UsabillaForm(formID: "", type: .FeedBack))
    }
    
}

extension ViewController: UsabillaFormDelegate {
    func didFormEnded(_ form: UIViewController, _ typedText: String) {
        form.dismiss(animated: true, completion: nil)
        print(typedText)
    }
    
    func didFormLoaded(_ form: UIViewController) {
        present(form, animated: true, completion: nil)
    }
}

