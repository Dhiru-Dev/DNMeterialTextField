# DNMeterialTextField

[![Version](https://img.shields.io/cocoapods/v/DNMeterialTextField.svg?style=flat)](https://cocoapods.org/pods/DNMeterialTextField)
[![Platform](https://img.shields.io/cocoapods/p/DNMeterialTextField.svg?style=flat)](https://cocoapods.org/pods/DNMeterialTextField)


## DNMeterialTextFiled
This TextFiled is created using Swift languagge and this is available  iOS , inspired by Material Design , Android EditText 
`com.google.android.material.textfield.TextInputEditText`
###### With icons

![](https://i.imgur.com/p76rpgu.gif)

###### Without icons

![](https://i.imgur.com/RPvINYl.gif)


## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements
Platform :  `iOS , Swift 4.3+`

## Installation

DNMeterialTextField is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'DNMeterialTextField'
```


## Uses

1.  `DNMeterialTextField` connect this file to your TextField in Storyboard .

2. Using code :

` let textField = DNMeterialTextField(frame: CGRect(x: 0, y: 0, width: 200.00, height: 40.00))
textField.borderStyle  = .none //important
textField.placeholder = "Enter Email"
self.view.addSubview(textField)`

## Customize

### Inspectable Properties (Storyboard)

##### Border Style Must be set to `none` (4th in image)

![](https://i.imgur.com/X15EzHF.png)


### Modify using code :
1.  Change roundness
`self.textField.cornerRadius =  10.0`

2.  Change Active Color
`self.textField.activeBorderColor = UIColor.orange`

3.  Change InAcitve Color
`self.textField.inactiveColor = .darkGray`

3.  Change Left Side icon ( set nil to remove icon default = nil )
`self.textField.leftSideIcon = UIImage(named:”ic_user”)`


## Author

Dhiru-Dev, dhiru.ard@gmail.com

#### StackOvrflow 
![](https://stackoverflow.com/users/4466607/dhiru)


## License

DNMeterialTextField is available under the MIT license. See the LICENSE file for more info.
