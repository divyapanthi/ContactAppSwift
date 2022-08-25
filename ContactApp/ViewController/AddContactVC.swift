//
//  AddContactVC.swift
//  ContactApp
//
//  Created by Divya Panthi on 22/08/2022.
//

import UIKit



protocol ContactProtocol: AnyObject{
    
    func passData(firstName: String, lastName: String, address: String, email: String, number: String?)
}


class AddContactVC: UIViewController {
    
    @IBOutlet weak var txtFirstName: UITextField!
    
    @IBOutlet weak var txtLastName: UITextField!
    
    @IBOutlet weak var txtAddress: UITextField!
    
    @IBOutlet weak var txtEmail : UITextField!
    
    @IBOutlet weak var txtNumber: UITextField!
    
    @IBOutlet weak var btnAddContact: UIButton!
    
    @IBOutlet weak var btnDone: UIBarButtonItem!
    
    weak var delegate: ContactProtocol?
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.txtNumber.isHidden = true
        
        
    }
    
    
    @IBAction func btnAddImageAction(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "ImageCollection", bundle: nil)
        
        let controller = storyboard.instantiateViewController(withIdentifier: "ImageCollectionVC")
        self.present(controller, animated: true, completion: nil)
        
    }
    
    @IBAction func btnAddContactAction(_ sender: Any) {
        
        UIView.animateKeyframes(withDuration: 1, delay: .zero) {
            
            self.txtNumber.isHidden = false
            
            self.btnAddContact.isEnabled = false
        
        }
        
    }
    
    @IBAction func btnDoneAction(_ sender: Any) {
        
        checkValidity()
        
        delegate?.passData(firstName: txtFirstName.text!, lastName: txtLastName.text!, address: txtAddress.text!, email: txtEmail.text! ,number: txtNumber.text!)
        
    }
    
    func checkValidity(){
        
        checkFirstNameValidation()
        
        checkLastNameValidation()
        
        checkEmailVaildation()
        
        checkPhoneNumberValidation()
        
    }
    
    
    func checkFirstNameValidation(){
        
        
            if txtFirstName.text!.isEmpty
            {
                txtFirstName.placeholder = "Required*"
                
                txtFirstName.layer.borderColor = UIColor.red.cgColor
                
                txtFirstName.layer.borderWidth = 0.5

            }
    
            else if let errorMessage = invalidFirstName(txtFirstName.text ?? "")
            {
                txtFirstName.text = ""
                txtFirstName.attributedPlaceholder = NSAttributedString(
                    string: errorMessage,
                    attributes: [NSAttributedString.Key.foregroundColor: UIColor.red]
                )
    
            }
                
            else{
                
            }
        
    }
    
    func checkLastNameValidation(){
        
        if txtLastName.text!.isEmpty
        {
           txtLastName.placeholder = "Required*"
           
           txtLastName.layer.borderColor = UIColor.red.cgColor
            
           txtLastName.layer.borderWidth = 0.5


        }
        
        else if let errorMessage = invalidLastName(txtLastName.text ?? "")
        {
            txtLastName.text = ""
            txtLastName.attributedPlaceholder = NSAttributedString(
                string: errorMessage,
                attributes: [NSAttributedString.Key.foregroundColor: UIColor.red]
            )
        }
        else{
            return
        }
        
    }
    
    func checkEmailVaildation(){
        
        if !txtEmail.text!.isEmpty{
            
            if let errorMessage = invalidEmail(txtEmail.text!)
            {
                txtEmail.attributedPlaceholder = NSAttributedString(
                    string: errorMessage,
                    attributes: [NSAttributedString.Key.foregroundColor: UIColor.red]
                    )
            }
            
        }
        
        else{
            
            return
            
            }
    }
        
    
    func checkPhoneNumberValidation(){
        
        if txtNumber.text!.isEmpty
        {
            txtNumber.isHidden = false
            
            self.btnAddContact.isEnabled = false
            
            txtNumber.placeholder = "Required*"
            
            txtNumber.layer.borderColor = UIColor.red.cgColor
            
            txtNumber.layer.borderWidth =  0.5

        }
        
        else if let errorMessage = invalidPhoneNumber(txtNumber.text ?? "")
        {
            txtNumber.text = ""
            txtNumber.attributedPlaceholder = NSAttributedString(
                string: errorMessage,
                attributes: [NSAttributedString.Key.foregroundColor: UIColor.red]
            )
        }
            
        else{
            
                
            }
        }


    
    func invalidFirstName(_ value : String) ->  String?
    {
        
        if value.count<5 {
            
            return  "First name should contain at least 4 characters"
            
        }
            
        if !containsDigit(value){
            
            return "Invalid first name"
            
        }
        
        return nil
        
    }
    
    func invalidLastName(_ value : String) ->  String?
    {

        if value.count<5 {
            
            return  "Last name should contain at least 4 characters"
            
        }
            
        if !containsDigit(value){
            
            return "Invalid last name"
            
        }
        
        return nil
        
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
    
    func containsDigit(_ value: String) -> Bool
    {
        let reqularExpression = ".*[0-9]+.*"
        
        let predicate = NSPredicate(format: "SELF MATCHES %@", reqularExpression)
        
        return !predicate.evaluate(with: value)
    }
        
    
}


