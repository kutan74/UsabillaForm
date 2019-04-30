//
//  UsabillaSurveyDataSourceDelegate.swift
//  Usabilla
//
//  Created by KUTAN ÇINGISIZ on 30.04.2019.
//  Copyright © 2019 KUTAN ÇINGISIZ. All rights reserved.
//

import Foundation

public protocol UsabillaSurveyDataSourceDelegate: class {
    func onQuestionRated(for question: String, with rating: Int)
}
