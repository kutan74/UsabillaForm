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
    
    private var formViewController: UsabillaFormViewController!
    
    public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    /// Function to configure requested form
    open func configureForm(with form: UsabillaForm) {
        formViewController = UsabillaFormViewController(form: form)
        formViewController.delegate = self
        formViewController.configureFormView()
        
        // We're done. Let the user know form is ready to be presented
        delegate?.didFormLoad(formViewController)
    }
}

extension Usabilla: UsabillaFormResultDelegate {    
    public func onDoneButtonTapped(with typedText: String) {
        delegate?.didFormSubmit(formViewController, typedText)
    }
}
