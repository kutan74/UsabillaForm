//
//  UsabillaSurveyDataSourceDelegate.swift
//  Usabilla
//
//  Created by KUTAN ÇINGISIZ on 30.04.2019.
//  Copyright © 2019 KUTAN ÇINGISIZ. All rights reserved.
//

import Foundation

/** Protocol for UsabillaSurveyViewController to commnunicate with it's data source
*/
public protocol UsabillaSurveyDataSourceDelegate: class {
    /**
     This function is called once the user rated a survey question
     
     - Parameter question: Survey question being rated
     - Parameter rating: Rating being given
     */
    func onQuestionRated(for question: String, with rating: Int)
}
