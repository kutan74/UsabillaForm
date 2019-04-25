//
//  UsabillaForm.swift
//  Usabilla
//
//  Created by KUTAN ÇINGISIZ on 24.04.2019.
//  Copyright © 2019 KUTAN ÇINGISIZ. All rights reserved.
//

import Foundation

public enum FormType {
    case Rating
    case FeedBack
}

public struct UsabillaForm {
    var formID: String
    var type: FormType?
    
    init(formID: String, type: FormType?) {
        self.formID = formID
        self.type = type
    }
}
