//
//  RegistrationViewController.swift
//  TravelApp_Paniukova
//
//  Created by Ira Paniukova on 13/09/23.
//

import UIKit

//function to read data for users:
func readData() -> [User]
{
    if UserDefaults.standard.data(forKey: "Users") == nil
    {
        return[User]()
    }
    else{
        let data = UserDefaults.standard.data(forKey: "Users") as! Data
        let Users = try! NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as! [User]
        return Users
    }
}



//function to search a user by username
private func searchUserbyUname (uname: String) -> User?
{
    var found : User? = nil
    for i in usr{       //usr is a global variable set as: var usr =  readData() in ViewController
        if i.getUname() == uname
        {
            found = i
            break
        }
    }
    return found
}



class RegistrationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var adrsTextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var phoneTextField: UITextField!
    
    @IBOutlet weak var unameTextField: UITextField!
    
    @IBOutlet weak var pswdTextField: UITextField!
    
    @IBAction func registerButton(_ sender: UIButton) {
        
        if nameTextField.hasText && adrsTextField.hasText && emailTextField.hasText && phoneTextField.hasText && unameTextField.hasText && pswdTextField.hasText    //checking if fields are not empty
        {
            let un = unameTextField.text!
            
            u = searchUserbyUname(uname: un)
            if u == nil {
            let name = nameTextField.text!
            let adrs = adrsTextField.text!
            let email = emailTextField.text!
            let phone = phoneTextField.text!
            let uname = unameTextField.text!
            let pswd = pswdTextField.text!
            var user = User(name : name, adrs : adrs, email : email, phone : phone, uname : uname, pswd : pswd)
            usr.append(user)
            let data = try! NSKeyedArchiver.archivedData(withRootObject: usr, requiringSecureCoding: false)
            UserDefaults.standard.setValue(data, forKey: "Users")
        
                showMessage(msg: "You are registered", controller: self)
            }
            else { showMessage(msg: "Such username already exists", controller: self)}

        }
        else { showMessage(msg: "Some fields are empty", controller: self)}
    }
}
