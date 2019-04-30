<p align="center">
    <img src="https://img.shields.io/badge/Swift-5.0-orange.svg" />
    <a href="https://swift.org/package-manager">
        <img src="https://img.shields.io/cocoapods/v/UsabillaForm.svg" alt="Swift Package Manager" />
    </a>
    <img src="https://img.shields.io/badge/platforms-ios-brightgreen.svg?style=flat" alt="Mac + Linux" />
</p>

Welcome to **UsabillaForm** — a suite of class that aims to display feedback forms in your existing Swift projects. 

### Examples 

Create a new Usabilla feedback form without custom properties
```swift
let form = UsabillaForm(formID: "yourFormId", type: .FeedBack)
```

Or rating view
```swift
let form = UsabillaForm(formID: "yourFormId", type: .Rating)
```

You can set custom properties such as form background color, form title color and form title font
```swift
let form = UsabillaForm(formID: "yourFormId", type: .FeedBack)
form.customProperties = UsabillaForm.UsabillaFormProperties(formBackgroundColor: .white,
                                                                    formTitleTextColor: .black,
                                                                    formTitleFont: .systemFont(ofSize: 12, weight: .light),
                                                                    feedBackQuestionTitle: "Your feedback",
                                                                    ratingTitle: "Rate our awesome app")
```

Initialise the Usabilla form and set delegate to self
```swift
let usabilla = Usabilla(form: form)
usabilla.delegate = self
usabilla.configureForm()
```

Comfort the UsabillaFormDelegate in your view controller
```swift
extension YourViewController: UsabillaFormDelegate {
	func didFormLoad(_ form: UIViewController) {
		// present(form, animated: true, completion: nil)
	}

    	// Optional func for feedback form
	func didFormSubmit(_ form: UIViewController, _ typedText: String) {
		// form.dismiss(animated: true, completion: nil)
	}	

        // Optional func for rating form
    	func didRatingSubmit(_ form: UIViewController, _ rating: Int) {
        	// form.dismiss(animated: true, completion: nil)
	}
}
```

You can load the form with completion handler. You don't have to comfort the didFormLoad if you use completion handler
```swift
usabilla.configureForm { (form) in
    self.present(form, animated: true, completion: nil)            
}
```

### Surveys
```swift
var form = UsabillaForm(formID: "yourFormId", type: .Survey)
let surveyQuestions = ["How do you scale our product ?",
                       "How was your overal shopping experience ?"]
form.survey = UsabillaForm.Survey(surveyQuestions: surveyQuestions)
        
usabilla = Usabilla(form: form)
usabilla.delegate = self
usabilla.configureForm { (surveyViewController) in
    self.present(surveyViewController, animated: true, completion: nil)
}
```

Delegate
```swift
func didSurveySubmitted(_ form: UIViewController, _ surveyResult: [String : Int]) {
    form.dismiss(animated: true, completion: nil)    
}
```