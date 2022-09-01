//
//  ViewController.swift
//  ContactApp
//
//  Created by Divya Panthi on 22/08/2022.
//

import UIKit

struct ContactItem {
    
    var firstName: String?
    
    var lastName: String?
    
    var address: String?
    
    var email: String?
    
    var number: String?
    
    var profileImage: UIImage?
    
}


class HomeVC: UIViewController {
    
    var contactListArray = [ContactItem]()
    
    @IBOutlet weak var tblContacts: UITableView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        title  = "Contact App"
        
        tblContacts.register(UINib(nibName: "CellContacts", bundle: nil), forCellReuseIdentifier: "CellContacts")
        
        tblContacts.estimatedRowHeight = UITableView.automaticDimension
        
    }
    
    @IBAction func btnAddContact(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "AddContact", bundle: nil)
        
        let controller = storyboard.instantiateViewController(withIdentifier: "AddContactVC") as! AddContactVC
        
        controller.delegate = self
        
        let navItem = UIBarButtonItem()
        navItem.title = "Add Contact"
        navigationItem.backBarButtonItem = navItem
        
        self.navigationController?.pushViewController(controller, animated: true)
        
    }
    
}

extension HomeVC: ContactProtocol {
    
    func passData(firstName: String, lastName: String, address: String?, email: String?, number: String, profilePic: UIImage) {
        
        contactListArray.append(ContactItem(firstName: firstName, lastName: lastName, address: address, email: email, number: number, profileImage: profilePic))
        
        self.tblContacts.reloadData()
        
    }
    
    
}

extension HomeVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return contactListArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellContacts") as! CellContacts
        
        cell.lblFullName.text = "\(self.contactListArray[indexPath.row].firstName?.capitalized ?? "") " + "\(self.contactListArray[indexPath.row].lastName?.capitalized ?? "")"
        
        cell.lblPhoneNumber.text = self.contactListArray[indexPath.row].number
        
        cell.lblAddress.text = self.contactListArray[indexPath.row].address
        
        cell.lblEmail.text = self.contactListArray[indexPath.row].email
        
        cell.imgPerson.image = self.contactListArray[indexPath.row].profileImage
        
        return cell
        
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete  {
            
            let alert = UIAlertController(title: "Delete Contact?", message: "Are you sure you want to delete this contact \(contactListArray[indexPath.row].firstName?.capitalized ?? "")?",   preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            
            alert.addAction(UIAlertAction(title: "Delete", style: .default, handler: { (_) in
                
                self.contactListArray.remove(at: indexPath.row)
                
                tableView.deleteRows(at: [indexPath], with: .automatic)
            }))
            
            self.present(alert, animated: true)
            
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 120
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let storyboard = UIStoryboard(name: "ViewProfile", bundle: nil)
        
        let controller = storyboard.instantiateViewController(withIdentifier: "ProfileVC")  as! ProfileVC
        
        controller.contactItems = self.contactListArray[indexPath.row]
        
        controller.delegate = self
        
        let navItem = UIBarButtonItem()
        navItem.title = "View Profile"
        navigationItem.backBarButtonItem = navItem
        
        self.navigationController?.pushViewController(controller, animated: true)
        
    }
    
}

extension HomeVC: EditedDelegate{
    
    func passEditedData(firstName: String, lastNme: String, email: String, number: String, address: String, profilePic: UIImage!) {
        
        contactListArray.removeAll()
        
        contactListArray.append(ContactItem(firstName: firstName, lastName: lastNme, address: address, email: email, number: number, profileImage: profilePic))
        
        tblContacts.reloadData()
        
    }
}
