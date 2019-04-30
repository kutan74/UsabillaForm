//
//  UsabillaFormDelegate.swift
//  Usabilla
//
//  Created by KUTAN ÇINGISIZ on 24.04.2019.
//  Copyright © 2019 KUTAN ÇINGISIZ. All rights reserved.
//

import UIKit

/// Protocol to communicate with root view controller
@objc public protocol UsabillaFormDelegate: class {
    /** Function to notify user that the form is ready to be displayed
    */
    @objc optional func didFormLoad(_ form: UIViewController)
    
    /** Feedback submission
    */
    @objc optional func didFormSubmit(_ form: UIViewController, _ typedText: String)

    /** Rating submission
    */
    @objc optional func didRatingSubmit(_ form: UIViewController, _ rating: Int)
    
    /** Survey submission
    */
    @objc optional func didSurveySubmitted(_ form: UIViewController, _ surveyResult: [String: Int])
}

