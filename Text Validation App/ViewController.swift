//
//  ViewController.swift
//  Text Validation App
//
//  Created by Paige Stephenson on 2/21/23.
//

//In a coding interview, you are asked to create a single screen login app.
//Your task is to validate the password.
//The password needs to be at least 8 characters long.
//if count <= 8 / count < 8
//The password must contain a special symbol (@,.!@#$%^&*<>?+=-)
//Maybe use an enum to contain the characters?
//enum characters {
//case "@", ",", ".", "#", "$", "%", "^", "&", "*", "<", ">", "+", "=", "-"
//MORE LIKELY just put it in an array and use .contains property
//The password must contain an uppercase and a lowercase letter.
//.contains.uppercased()
//Display an error message to the screen when any one of the requirements is not met. Display a success message when all requirements are met.
//use an if statement to validate it. So if it meets all the requirements, update the label to display success. Else, have the label display an error statement.

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var passwordInput: UITextField!
    @IBOutlet weak var errorOrSuccessLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        errorOrSuccessLabel.isHidden = true
    }
    
    func checkLength(_ password: String) -> Bool {
        return password.count >= 8
    }
    
    func checkCaseSensitivity(_ password: String) -> Bool {
        var hasUppercase = false
        var hasLowercase = false
        for character in password {
            if character.isUppercase {
                hasUppercase = true
            } else {
                hasLowercase = true 
            }
        }
        return hasLowercase && hasUppercase
    }
    
    func specialCharacter(_ password: String) -> Bool {
        
        let symbols = ["@", ",", ".", "#", "$", "%", "^", "&", "*", "<", ">", "+", "=", "-", "!"]
        for symbol in symbols {
            if password.contains(symbol) {
                return true
            }
        }
        return false
    }
    
    
    func checkPassword(_ password: String?) -> Bool {
        guard let password = password else {
            errorOrSuccessLabel.text = "Error"
            return false
        }
        
        let isRightLength = checkLength(password)
        let hasSpecialSymbol = specialCharacter(password)
        let isUpperAndLowerCase = checkCaseSensitivity(password)
        
        return isRightLength && hasSpecialSymbol && isUpperAndLowerCase
        
        
    }
    
    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        let isValidPassword = checkPassword(passwordInput.text)
        if isValidPassword == true {
            errorOrSuccessLabel.isHidden = false
            errorOrSuccessLabel.text = "That is a valid password!"
        } else if isValidPassword == false {
            errorOrSuccessLabel.isHidden = false
            errorOrSuccessLabel.text = "That is not a valid password."
        }
    }
    
    
    
    
    //    func validatePassword() {
    //        for characters in symbols
    //
    //        }
    //    }
    //
    //func containsSymbols(symbolCollection: [String]) {
    //    for characters in symbolCollection {
    //
    //    }
    //
    //
    
    
}

