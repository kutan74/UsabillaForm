//
//  UsabillaFormResultDelegate.swift
//  Usabilla
//
//  Created by KUTAN ÇINGISIZ on 25.04.2019.
//  Copyright © 2019 KUTAN ÇINGISIZ. All rights reserved.
//

import Foundation

/** Protocol for Usabilla class to receive Feedback and Rating form submission callbacks
*/
public protocol UsabillaFormResultDelegate: class {
    /** This is function is called once the user submitted feedeback form
     
     - Parameter typedText: Feedback input being sent
     */
    func onDoneButtonTapped(with typedText: String)
    
    /** This is function is called once the user submitted rating form
     
     - Parameter rating: Rating value being sent
     */
    func onRatingSubmitButtonTapped(with rating: Int)
}
