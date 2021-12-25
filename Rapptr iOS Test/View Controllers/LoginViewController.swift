//
//  LoginViewController.swift
//  iOSTest
//
//  Copyright © 2020 Rapptr Labs. All rights reserved.

import UIKit

class LoginViewController: UIViewController {
    
    /**
     * =========================================================================================
     * INSTRUCTIONS
     * =========================================================================================
     * 1) Make the UI look like it does in the mock-up.
     *
     * 2) Take email and password input from the user
     *
     * 3) Use the endpoint and paramters provided in LoginClient.m to perform the log in
     *
     * 4) Calculate how long the API call took in milliseconds
     *
     * 5) If the response is an error display the error in a UIAlertController
     *
     * 6) If the response is successful display the success message AND how long the API call took in milliseconds in a UIAlertController
     *
     * 7) When login is successful, tapping 'OK' in the UIAlertController should bring you back to the main menu.
     **/
    
    // MARK: - Properties
    private var client: LoginClient?
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
       
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "img_login")
        backgroundImage.contentMode = UIView.ContentMode.scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
        
        title = "Login"
        
        client = LoginClient()
        configureUI()
    }
    
    func configureUI(){
       
        // MARK: - Email textfield
        emailTextField.layer.cornerRadius = 5
        emailTextField.borderStyle = .none
        emailTextField.clipsToBounds = true
        emailTextField.textColor = UIColor(red: 27/255, green: 30/255, blue: 31/255, alpha: 1.0)
        emailTextField.attributedPlaceholder = NSAttributedString(
            string: "Email",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor(red: 95/255, green: 96/255, blue: 99/255, alpha: 1.0)]
        )
        emailTextField.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        emailTextField.setLeftPaddingPoints(24)
        emailTextField.backgroundColor = UIColor(red: 254/255, green: 254/255, blue: 254/255, alpha: 0.2)
        
        // MARK: - Password textfield
        passwordTextField.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        passwordTextField.layer.cornerRadius = 5
        passwordTextField.borderStyle = .none
        passwordTextField.clipsToBounds = true
        passwordTextField.setLeftPaddingPoints(24)
        passwordTextField.attributedPlaceholder = NSAttributedString(
            string: "Password",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor(red: 95/255, green: 96/255, blue: 99/255, alpha: 1.0)]
        )
        passwordTextField.backgroundColor = UIColor(red: 254/255, green: 254/255, blue: 254/255, alpha: 0.2)
        passwordTextField.textColor = UIColor(red: 27/255, green: 30/255, blue: 31/255, alpha: 1.0)

        // MARK: - Login button
        loginButton.backgroundColor = UIColor(red: 14.0/255, green: 92.0/255, blue: 137.0/255, alpha: 1.0)
        loginButton.titleLabel?.textColor = .white
        loginButton.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        loginButton.setTitleColor(.white, for: .normal)
        
        // MARK: - Anchors
        emailTextField.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 64, paddingLeft: 30, paddingRight: 30, height: 55)
        passwordTextField.anchor(top: emailTextField.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 24, paddingLeft: 30, paddingRight: 30, height: 55)
        loginButton.anchor(top: passwordTextField.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 24, paddingLeft: 30, paddingRight: 30, height: 55)
    }
    
    
    @IBAction func didPressLoginButton(_ sender: Any) {
        var dialogMessage = UIAlertController(title: "", message: "", preferredStyle: .alert)
       
        
        if emailTextField.hasText && passwordTextField.hasText {
            client?.login(email: emailTextField.text!, password: passwordTextField.text!, completion: { response in
                print(response)
                dialogMessage = UIAlertController(title: "Successful", message: "It took \(response) seconds to finish this request.", preferredStyle: .alert)
                let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
                    print("Ok button tapped")
                    self.navigationController?.popViewController(animated: true)
                    self.dismiss(animated: true, completion: nil)
                    
                })
                dialogMessage.addAction(ok)
                self.present(dialogMessage, animated: true, completion: nil)

            }, error: { error in
                 dialogMessage = UIAlertController(title: "Error", message: error, preferredStyle: .alert)
                let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
                    print("Ok button tapped")
                 })
                dialogMessage.addAction(ok)
                self.present(dialogMessage, animated: true, completion: nil)

                
            })
          
        }
        else {
            print("Field is empty")
        }

    }
}

