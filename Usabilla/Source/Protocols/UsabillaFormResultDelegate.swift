//
//  UsabillaFormResultDelegate.swift
//  Usabilla
//
//  Created by KUTAN ÇINGISIZ on 25.04.2019.
//  Copyright © 2019 KUTAN ÇINGISIZ. All rights reserved.
//

import Foundation

public protocol UsabillaFormResultDelegate: class {
    /** Function to notify user that the form is closed and user pressed done button
    */
    func onDoneButtonTapped(with typedText: String)
}
