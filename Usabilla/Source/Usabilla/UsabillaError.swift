//
//  UsabillaError.swift
//  Usabilla
//
//  Created by KUTAN ÇINGISIZ on 2.05.2019.
//  Copyright © 2019 KUTAN ÇINGISIZ. All rights reserved.
//

import Foundation

public enum UsabillaError: Error {
    case noFormIdProvided
    case noSurveyQuestionProvided
}

extension UsabillaError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .noFormIdProvided:
            return NSLocalizedString("You have to provide a form id", comment: "")
        case .noSurveyQuestionProvided:
            return NSLocalizedString("You have to provide at least one survey question", comment: "")
        }
    }
}
