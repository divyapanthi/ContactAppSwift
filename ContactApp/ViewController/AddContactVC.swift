//
//  AddContactVC.swift
//  ContactApp
//
//  Created by Divya Panthi on 22/08/2022.
//

import UIKit



protocol ContactProtocol: AnyObject{
    
    func passData(firstName: String, lastName: String, address: String?, email: String?, number: String)
}


class AddContactVC: UIViewController {
    
    //UITextField and Buttons
    
    @IBOutlet weak var txtFirstName: UITextField!
    
    @IBOutlet weak var txtLastName: UITextField!
    
    @IBOutlet weak var txtAddress: UITextField!
    
    @IBOutlet weak var txtEmail : UITextField!
    
    @IBOutlet weak var txtNumber: UITextField!
    
    @IBOutlet weak var btnAddContact: UIButton!
    
    @IBOutlet weak var btnDone: UIBarButtonItem!
    
    //Errors Label Field
    
    @IBOutlet weak var firstNameError: UILabel!
    
    @IBOutlet weak var lastNameError: UILabel!
    
    @IBOutlet weak var emailError: UILabel!
    
    @IBOutlet weak var contactError: UILabel!
    
    @IBOutlet weak var addressError: UILabel!

    
    weak var delegate: ContactProtocol?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        resetForm()
        
    }
    
    
    func resetForm()
        {
            self.txtNumber.isHidden = true
            
            btnDone.isEnabled = false
//
            firstNameError.isHidden = false
            lastNameError.isHidden = false
            
            emailError.isHidden = true
            addressError.isHidden = true
//            contactError.isHidden = true
//

            contactError.isHidden = true
            
            firstNameError.text = "Required"
            lastNameError.text = "Required"
//            emailError.text = "Required"
//            addressError.text = "Required"
            contactError.text = "Required"
            
            txtFirstName.text = ""
            txtLastName.text = ""
            txtEmail.text = ""
            txtAddress.text = ""
            txtNumber.text = ""
        }
    
    
    @IBAction func firstNameChanged(_ sender: Any)
        {
        if let firstName = txtFirstName.text
            {
                if let errorMessage = invalidFirstName(firstName)
                {
                    firstNameError.text = errorMessage
                    firstNameError.isHidden = false
                }
                else
                {
                    firstNameError.isHidden = true
                }
            }
                
            checkForValidForm()
            
        }
    
    func invalidFirstName(_ value : String) ->  String?
    {
        
        if value.count<4 {
            
            return  "First name should contain at least 4 chars"
            
        }
        return nil
        
    }
    
    @IBAction func lastNameChanged(_ sender: Any)
    {
        if let lastName = txtLastName.text
            {
                if let errorMessage = invalidLastName(lastName)
                {
                    lastNameError.text = errorMessage
                    lastNameError.isHidden = false
                }
                else
                {
                    lastNameError.isHidden = true
                }
            }
                    
            checkForValidForm()
            
        }
    
    func invalidLastName(_ value : String) ->  String?
    {

        if value.count<4 {
            
            return  "Last name should contain at least 4 chars"
            
        }

        return nil
        
    }
    
    
    @IBAction func emailChanged(_ sender: Any)
    {
        if let email = txtEmail.text
        {
            if let errorMessage = invalidEmail(email)
            {
                emailError.text = errorMessage
                emailError.isHidden = false
            }
            else if email.isEmpty{
                
                emailError.isHidden = true
            }
            else
            {
                emailError.isHidden = true
            }
        }
                
        checkForValidForm()
    }
    
    func invalidEmail(_ value: String) -> String?
    {
        let reqularExpression = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let predicate = NSPredicate(format: "SELF MATCHES %@", reqularExpression)
            
        if !predicate.evaluate(with: value)
                
        {
            return "Invalid Email Address"
                
        }
        
        return nil
    }
    
    
    @IBAction func addressChanged(_ sender: Any)
        {
            if let address = txtAddress.text{
                if  address.isEmpty {
                    addressError.isHidden = false
                }
                else{
                    addressError.isHidden = true
                }
            }
            
        }
    
    @IBAction func phoneNumberChanged(_ sender: Any)
    {
        if let phoneNumber = txtNumber.text
        {
            if let errorMessage = invalidPhoneNumber(phoneNumber)
            {
                contactError.text = errorMessage
                contactError.isHidden = false
            }
            else
            {
                contactError.isHidden = true
            }
        }
        checkForValidForm()
            
    }
    
    func invalidPhoneNumber(_ value: String) -> String?
    {
        let set = CharacterSet(charactersIn: value)
        if !CharacterSet.decimalDigits.isSuperset(of: set)
        {
            return "Phone Number must contain only digits"
        }
        
        if value.count != 10
        {
            return "Phone Number must be 10 Digits in Length"
        }
        return nil

    }
    
    
    @IBAction func btnAddContactAction(_ sender: Any) {
        
        UIView.animateKeyframes(withDuration: 1, delay: .zero) {
            
            self.checkContact()
        
        }
        
    }
    
    func checkContact(){
        
        if txtNumber.text!.isEmpty{
            
            self.txtNumber.isHidden = false
            
            self.contactError.isHidden = false
            
            self.btnAddContact.isEnabled = false
            
        }
    }
    
    @IBAction func btnDoneAction(_ sender: Any) {
        
        checkContact()
            
        delegate?.passData(firstName: txtFirstName.text!, lastName: txtLastName.text!, address: txtAddress.text ?? "", email: txtEmail.text ?? "" ,number: txtNumber.text!)
        
        
    }

    
    func checkForValidForm()
    {
        if firstNameError.isHidden && lastNameError.isHidden && contactError.isHidden
        {
            btnDone.isEnabled = true
        }
        else
        {
            btnDone.isEnabled = false
        }
    }
    
    
    
        @IBAction func btnAddImageAction(_ sender: Any) {
    
            let storyboard = UIStoryboard(name: "ImageCollection", bundle: nil)
    
            let controller = storyboard.instantiateViewController(withIdentifier: "ImageCollectionVC")
            self.present(controller, animated: true, completion: nil)
    
        }
        
    
}


