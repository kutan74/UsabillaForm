//
//  UsabillaFormValidator.swift
//  Usabilla
//
//  Created by KUTAN ÇINGISIZ on 2.05.2019.
//  Copyright © 2019 KUTAN ÇINGISIZ. All rights reserved.
//

import Foundation

open class UsabillaFormValidator {
    
    /** Function to validate form id
     
     - Parameter id: Form id being provided
     - Returns UsabillaError.noFormIdProvided if the form id is nil
     */
    func validateRequestedForm(id: String) throws {
        guard !id.isEmpty else {
            throw UsabillaError.noFormIdProvided
        }
    }
    
    /** Function to validate survey questions
     
     - Parameter surveyQuestions: Survey questions being provided
     - Returns UsabillaError.noSurveyQuestionProvided if none provided
     */
    func validateRequestedSurveyForm(for surveyQuestions: [String]) throws {
        guard surveyQuestions.count > 0 else {
            throw UsabillaError.noSurveyQuestionProvided
        }
    }
}
