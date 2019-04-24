//
//  UsabillaFormDelegate.swift
//  Usabilla
//
//  Created by KUTAN ÇINGISIZ on 24.04.2019.
//  Copyright © 2019 KUTAN ÇINGISIZ. All rights reserved.
//

import UIKit

/// Protocol to communicate with root view controller
public protocol UsabillaFormDelegate: class {
    /** Function to notify user that the form is ready to be displayed
    */
    func didFormLoaded(_ form: UIViewController)
}
