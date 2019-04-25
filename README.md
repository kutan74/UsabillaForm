<p align="center">
    <img src="https://img.shields.io/badge/Swift-5.0-orange.svg" />
    <a href="https://swift.org/package-manager">
        <img src="https://img.shields.io/cocoapods/v/UsabillaForm.svg" alt="Swift Package Manager" />
    </a>
    <img src="https://img.shields.io/badge/platforms-ios-brightgreen.svg?style=flat" alt="Mac + Linux" />
</p>

Welcome to **UsabillaForm** — a suite of class that aims to display feedback forms in your existing Swift projects. 

### Examples 

Create a new Usabilla form without custom properties
```swift
llet form = UsabillaForm(formID: "yourFormId", type: .FeedBack, customProperties: nil)
```

You can set custom properties such as form background color, form title color and form title font
```swift
let customFormProperties = FormProperties(formBackgroundColor: .white,
                                          formTitleTextColor: .black,
                                          formTitleFont: .systemFont(ofSize: 14, weight: .light))

let form = UsabillaForm(formID: "yourFormId", type: .FeedBack, customProperties: customFormProperties)
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

	func didFormSubmit(_ form: UIViewController, _ typedText: String) {
		// form.dismiss(animated: true, completion: nil)
	}	
}
```