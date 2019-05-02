
<p align="center">

<img src="https://img.shields.io/badge/Swift-5.0-orange.svg" />

<a href="https://swift.org/package-manager">

<img src="https://img.shields.io/cocoapods/v/UsabillaForm.svg" alt="Swift Package Manager" />

</a>

<img src="https://img.shields.io/badge/platforms-ios-brightgreen.svg?style=flat" alt="Mac + Linux" />

</p>

  

Welcome to ****UsabillaForm**** — a suite of class that aims to display feedback forms in your existing Swift projects.

  

### Installation

```swift

pod 'UsabillaForm'

```

  

### Examples

A form must be provided with a UsabillaForm object in order to be initialized

```swift

let form = UsabillaForm(formID: "yourFormId", type: .FeedBack)
let usabilla = Usabilla(form: form)
usabilla.delegate = self
usabilla.configureFeedBackForm { [weak self] result in
    switch result {
	case .success(let form):
		self?.present(form, animated: true, completion: nil)
	case .failure(let error):
		print(error.localizedDescription)
	}
}
```

Or rating view

```swift

let form = UsabillaForm(formID: "yourFormId", type: .Rating)
let usabilla = Usabilla(form: form)
usabilla.delegate = self
usabilla.configureFeedBackForm { [weak self] result in
    switch result {
	case .success(let form):
		self?.present(form, animated: true, completion: nil)
	case .failure(let error):
		print(error.localizedDescription)
	}
}

```

  

You can set custom properties such as form background color, form title color and form title font

```swift

form.customProperties?.formBackgroundColor = .white
form.customProperties?.formTitleFont = UIFont.systemFont(ofSize: 14, weight: .light)
form.customProperties?.formTitleTextColor = .black
form.customProperties?.feedBackQuestionTitle = "Your Feedback ?"

```

Comfort the UsabillaFormDelegate in your view controller

```swift

extension YourViewController: UsabillaFormDelegate {
    func didFormSubmit(_ form: UIViewController, _ typedText: String) {
	// form.dismiss(animated: true, completion: nil)
	}

	func didRatingSubmit(_ form: UIViewController, _ rating: Int) {
	// form.dismiss(animated: true, completion: nil)
	}
}

```

### Surveys

```swift
let surveyQuestions = ["Question 1",
		       "Question 2",
		       "Question 3"]
let survey = UsabillaForm.Survey(surveyQuestions: surveyQuestions)

let form = UsabillaForm(formID: "yourFormId", 
			type: .Survey,
			survey: survey)

usabilla = Usabilla(form: form)
usabilla.delegate = self
usabilla.configureSurvey { [weak self] result in
    switch result {
    case .success(let form):
    	self?.present(form, animated: true, completion: nil)
    case .failure(let error):
        print(error.localizedDescription)
     }
   }
}

```

Survey Delegate will return [String: Int]. Survey questions and their ratings

```swift

func didSurveySubmitted(_ form: UIViewController, _ surveyResult: [String : Int]) {
    form.dismiss(animated: true, completion: nil)   
}

```
