//
//  UsabillaSurveyResultDelegate.swift
//  Usabilla
//
//  Created by KUTAN ÇINGISIZ on 30.04.2019.
//  Copyright © 2019 KUTAN ÇINGISIZ. All rights reserved.
//

import Foundation

/** Protocol for Usabilla class to receive survey submission callbacks
*/
public protocol UsabillaSurveyResultDelegate: class {
    /** This is function is called once the user submitted survey form
     
     - Parameter result: Survey questions and ratings being sent
     */
    func onSubmitSurveyButtonTapped(result: [String: Int])
}
