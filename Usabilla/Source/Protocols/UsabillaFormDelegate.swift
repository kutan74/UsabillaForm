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
    /** This is function is called once the user submitted feedeback form
     
     - Parameter form: FormViewController being loaded
     */
    @objc optional func didFormSubmit(_ form: UIViewController, _ typedText: String)

    /** This is function is called once the user submitted rating form
     
     - Parameter form: FormViewController being loaded
     */
    @objc optional func didRatingSubmit(_ form: UIViewController, _ rating: Int)
    
    /** This is function is called once the user submitted survey form
     
     - Parameter form: SurveyViewController being loaded
     */
    @objc optional func didSurveySubmitted(_ form: UIViewController, _ surveyResult: [String: Int])
}

