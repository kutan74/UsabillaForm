//
//  UsabillaSurveyResultDelegate.swift
//  Usabilla
//
//  Created by KUTAN ÇINGISIZ on 30.04.2019.
//  Copyright © 2019 KUTAN ÇINGISIZ. All rights reserved.
//

import Foundation

public protocol UsabillaSurveyResultDelegate: class {
    func onSubmitSurveyButtonTapped(result: [String: Int])
}
