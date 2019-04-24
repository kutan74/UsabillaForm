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
    var type: FormType
    
    init(type: FormType) {
        self.type = type
    }
}
