//
//  ViewController.swift
//  TravelApp_Paniukova
//
//  Created by Ira Paniukova on 7/09/23.
//

import UIKit

//function to show message
func showMessage (msg : String, controller: UIViewController){
      
    let alert = UIAlertController(title: "", message: msg, preferredStyle: .alert)
    //it is very frustrating, but .actionSheet, that I prefer to .alert, crushes all ipada similators, so Iam forced to use .alert
        
      let action = UIAlertAction(title: "OK", style:.default,handler: {
              action
              in
            controller.dismiss(animated:true, completion: nil)
                              })
      alert.addAction(action)
    controller.present(alert, animated: true,completion: nil)
  }

var u : User!
var usr = readData()

//function to search a user by password and username
private func searchUser (uname: String, pswd: String) -> User?
{
    var found : User? = nil
    for i in usr{
        if i.getUname() == uname && i.getPswd() == pswd
        {
            found = i
            break
        }
    }
    return found
}



class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    
       }
    
    
    @IBOutlet weak var unameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBAction func toRegisterButton(_ sender: UIButton) {
        unameTextField.text = ""
        passwordTextField.text = ""
        //I clear text fields if a user want to register
    }
    @IBAction func loginButton(_ sender: UIButton) {
        
        
            //check for empty fields!
            if unameTextField.hasText && passwordTextField.hasText
            {
                let un = unameTextField.text!
                let pd = passwordTextField.text!
                u = searchUser(uname: un, pswd: pd)
                if u != nil {
                    performSegue(withIdentifier: "OpenHome", sender: self)
                }
                else {
                    showMessage(msg: "Wrong password or username", controller: self)
                }
            }
            else
            { showMessage(msg: "Some fields are empty", controller: self)}
        
    }
}
