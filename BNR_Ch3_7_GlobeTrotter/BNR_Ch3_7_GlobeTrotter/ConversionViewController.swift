//
//  ViewController.swift
//  BNR_Ch3_7_GlobeTrotter
//
//  Created by Magela Moore on 4/26/17.
//  Copyright © 2017 Rainbow Interactive. All rights reserved.
//  Purpose: This app accepts the tempearture in celsius and converts 
//           it to fahrenheit
//


import UIKit

class ConversionViewController: UIViewController, UITextFieldDelegate{

   //Define Outlets
    @IBOutlet var temperatureCelsius: UILabel!
    @IBOutlet var someTextField: UITextField!
    
    
   override func viewDidLoad() {
        super.viewDidLoad()
        updateCelsius()
        
        // Keep for Reference: 1. Progromatically create a view in swift //
        /*
        let firstFrame = CGRect(x:160, y:240, width: 100, height: 150)
        let firstView = UIView (frame: firstFrame)
        firstView.backgroundColor = UIColor.blue
        view.addSubview(firstView)
        
        // Progromatically create a 2nd  view in swift //
        let secondFrame = CGRect(x:20, y:30, width: 50, height: 50)
        let secondView = UIView (frame: secondFrame)
        secondView.backgroundColor = UIColor.orange
        //view.addSubview(secondView)
        
        // Add the second view as a sub view to the 1st view//
         firstView.addSubview(secondView)
         */
        
    }
    
    // Adds an optional of type "Mesuremant" to store the fahrenheit tempurature
    // Also adds a property observer which will update the field once it's changed
    var fahrenheitValue: Measurement<UnitTemperature>?{
        didSet{
            updateCelsius()
        }
    }
    
    
    //If the Fahrenheit Value exists, convert it to Celsius
    var celsiusValue: Measurement <UnitTemperature>? {
        if let fahrenheitValue = fahrenheitValue {
            return fahrenheitValue.converted(to: .celsius) //<<== Nice!!!
        } else {
            return nil
        }
    }
    
//MARK: - Update the Celsius Temperature
    // This function calls celsiusValue to convert to celsius and then 
    // updates the text field celsius value
    func updateCelsius(){
        if let celsiusValue = celsiusValue {
            
            // Wow - to instantiate a class, no import is required. Amazing!!
            let numberFormatter = ConversionUtilities().numberFormatter
            // calls the celsiusValue method
            temperatureCelsius.text = numberFormatter.string(from: NSNumber(value: celsiusValue.value))
            
            //Keep: Reference // temperatureCelsius.text = "\(celsiusValue)"
        } else {
            temperatureCelsius.text = " "
        }
    }
    
    //Create an IB Action for Celsius Text Field changes
    @IBAction func fahrenheitFieldEditingChanged(_ textField: UITextField){
        // Determine if the field has text and may be assigned to a double
        // If so, retreive the value in units of Fahrenheit
        if let text = textField.text, let value = Double(text){
            fahrenheitValue = Measurement(value: value, unit: .fahrenheit)
        } else {
            fahrenheitValue = nil
        }
    }
    
    
    // Utility method which uses our delegate to prevent
    // more than one decimal from being entered
    func textField(_ textField: UITextField,
                   shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool {
        
        let existingTextHasDecimalSeparator = textField.text?.range(of: ".")
        let replacementTextHasDecimalSeparator = string.range(of: ".")
        
        if existingTextHasDecimalSeparator != nil, replacementTextHasDecimalSeparator != nil {
            return false
        } else {
            return true
        }
    }

//MARK: - Dismis the keyboard
      @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer){
        someTextField.resignFirstResponder()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
