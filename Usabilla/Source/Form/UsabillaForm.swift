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
}

public struct UsabillaForm {
    var formID: String
    var type: FormType?
    var customProperties: FormProperties?
    
    init(formID: String, type: FormType?, customProperties: FormProperties?) {
        self.formID = formID
        self.type = type
        self.customProperties = customProperties
    }
}

public struct FormProperties {
    var formBackgroundColor: UIColor!
    var formTitleTextColor: UIColor!
    var formTitleFont: UIFont!
    
    init(formBackgroundColor: UIColor? = .white ,
         formTitleTextColor: UIColor? = .black,
         formTitleFont: UIFont? = UIFont.systemFont(ofSize: 14, weight: .light)) {
        
        self.formBackgroundColor = formBackgroundColor
        self.formTitleTextColor = formTitleTextColor
        self.formTitleFont = formTitleFont
    }
}

