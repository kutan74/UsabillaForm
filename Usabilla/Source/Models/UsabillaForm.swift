//
//  UsabillaForm.swift
//  Usabilla
//
//  Created by KUTAN ÇINGISIZ on 24.04.2019.
//  Copyright © 2019 KUTAN ÇINGISIZ. All rights reserved.
//

import UIKit

public enum FormType {
    case Rating
    case FeedBack
    case Survey
}

public struct UsabillaForm {
    var formID: String
    var type: FormType?
    var autoDismiss: Bool = false
    var customProperties: UsabillaFormProperties?
    var survey: Survey?
    
    init(formID: String,
         type: FormType?,
         customProperties: UsabillaFormProperties? = UsabillaFormProperties(),
         survey: Survey? = Survey()) {
        
        self.formID = formID
        self.type = type
        self.customProperties = customProperties
    }   
}

extension UsabillaForm {
    // Custom form properties
    struct UsabillaFormProperties {
        var formBackgroundColor: UIColor?
        var formTitleTextColor: UIColor?
        var formTitleFont: UIFont?
        var feedBackQuestionTitle: String?
        var ratingTitle: String?
        var surveyAccentColor: UIColor
        
        init(formBackgroundColor: UIColor? = .white ,
             formTitleTextColor: UIColor? = .black,
             formTitleFont: UIFont? = UIFont.systemFont(ofSize: 14, weight: .light),
             feedBackQuestionTitle: String? = UsabillaConstants.defaultFeedBackQuestionTitle,
             ratingTitle: String? = UsabillaConstants.defaultRatingTitle,
             surveyAccentColor: UIColor = .black) {
            
            self.formBackgroundColor = formBackgroundColor
            self.formTitleTextColor = formTitleTextColor
            self.formTitleFont = formTitleFont
            self.feedBackQuestionTitle = feedBackQuestionTitle
            self.ratingTitle = ratingTitle
            self.surveyAccentColor = surveyAccentColor
        }
    }
}

extension UsabillaForm {
    struct Survey {
        var surveyQuestions: [String]!
        
        init(surveyQuestions: [String]) {
            self.surveyQuestions = surveyQuestions
        }
        
        init() {
            
        }
    }
}
