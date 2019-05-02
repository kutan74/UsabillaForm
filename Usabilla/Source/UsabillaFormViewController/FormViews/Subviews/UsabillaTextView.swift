//
//  UsabillaTextView.swift
//  Usabilla
//
//  Created by KUTAN ÇINGISIZ on 25.04.2019.
//  Copyright © 2019 KUTAN ÇINGISIZ. All rights reserved.
//

import UIKit

/** TextView with keyboard action handler
 */
class UsabillaTextView: UITextView {
    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        configureTextView()
        addDoneButtonOnKeyboard()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension UsabillaTextView {
    fileprivate func configureTextView() {
        backgroundColor = UIColor.lightText.withAlphaComponent(0.5)
        text = "What do you think about our product ? "
        textColor = .black
        layer.cornerRadius = 5
        clipsToBounds = true
    }
}

extension UsabillaTextView {
    // I didn't like the way I handle done action at here
    // Right now If the user presses done button it means he/she is done with the form
    // That might not be correct all the time. UsabillaFormViewController should handle this part
    fileprivate func addDoneButtonOnKeyboard()
    {
        let doneToolbar: UIToolbar = UIToolbar(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
        doneToolbar.barStyle = .default
        
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let done: UIBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneButtonAction))
        
        let items = [flexSpace, done]
        doneToolbar.items = items
        doneToolbar.sizeToFit()
        
        inputAccessoryView = doneToolbar
    }
    
    @objc func doneButtonAction() {
        self.resignFirstResponder()
    }
}
