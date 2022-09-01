//
//  Utilities.swift
//  ContactApp
//
//  Created by Divya Panthi on 01/09/2022.
//

import Foundation

class Utilities {
    
    class func invalidFirstName(_ value : String) ->  String? {
        
        if value.count<4 {
            
            return  "First name should contain at least 4 chars"
            
        }

        return nil
        
    }
    
    class func invalidLastName(_ value : String) ->  String? {
        
        if value.count<4 {
            
            return  "Last name should contain at least 4 chars"
            
        }
        
        return nil
        
    }
    
    class func invalidEmail(_ value: String) -> String? {
        
        let reqularExpression = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let predicate = NSPredicate(format: "SELF MATCHES %@", reqularExpression)
        
        if !predicate.evaluate(with: value)
            
        {
            return "Invalid Email Address"
            
        }
        
        return nil
    }
    
    class func invalidPhoneNumber(_ value: String) -> String? {
        
        let set = CharacterSet(charactersIn: value)
        
        if !CharacterSet.decimalDigits.isSuperset(of: set) {
            return "Phone Number must contain only digits"
        }
        
        if value.count != 10 {
            return "Phone Number must be 10 Digits in Length"
        }
        
        return nil
        
    }
    
    
    
}
