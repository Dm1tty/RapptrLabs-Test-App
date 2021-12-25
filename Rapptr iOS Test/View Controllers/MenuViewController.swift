//
//  MenuViewController.swift
//  iOSTest
//
//  Copyright © 2020 Rapptr Labs. All rights reserved.

import UIKit


class MenuViewController: UIViewController, UINavigationBarDelegate {
    
    
    // MARK: - Outlets
    @IBOutlet weak var chatButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var animationButton: UIButton!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
       title = "Coding Tasks"
    }
    
    // MARK: - Actions
    @IBAction func didPressChatButton(_ sender: Any) {
        let chatViewController = ChatViewController()
        navigationController?.pushViewController(chatViewController, animated: true)
    }
    
    @IBAction func didPressLoginButton(_ sender: Any) {
        let loginViewController = LoginViewController()
        navigationController?.pushViewController(loginViewController, animated: true)
    }
    
    @IBAction func didPressAnimationButton(_ sender: Any) {
        let animationViewController = AnimationViewController()
        navigationController?.pushViewController(animationViewController, animated: true)
    }
    
    func configureUI(){
        // MARK: - Background Settings
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "bg_home_menu")
        backgroundImage.contentMode = UIView.ContentMode.scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
        
        // MARK: - Navigation Bar Settings
        navigationItem.backButtonTitle = ""
        self.navigationController?.isNavigationBarHidden = false
        let barAppearance = UINavigationBarAppearance()
        barAppearance.backgroundColor = UIColor(red: 14.0/255, green: 92.0/255, blue: 137.0/255, alpha: 1.0)
        barAppearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font : UIFont.systemFont(ofSize: 17, weight: .semibold)]
        navigationController?.navigationBar.standardAppearance = barAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = barAppearance
           
        // MARK: - Button settings
        configureButton(button: chatButton)
        configureButton(button: loginButton)
        configureButton(button: animationButton)
        
        chatButton.setImage(UIImage(named: "ic_chat"), for: .normal)
        loginButton.setImage(UIImage(named: "ic_login"), for: .normal)
        animationButton.setImage(UIImage(named: "ic_animation"), for: .normal)
        
        // MARK: - Button Anchors
        chatButton.anchor(top: view.safeAreaLayoutGuide.topAnchor,left: view.leftAnchor,
                           right: view.rightAnchor, paddingTop: 227, paddingLeft: 30,
                           paddingRight: 30, height: 55)
        loginButton.anchor(top: chatButton.bottomAnchor,left: view.leftAnchor,
                           right: view.rightAnchor, paddingTop: 24, paddingLeft: 30,
                           paddingRight: 30, height: 55)
        animationButton.anchor(top: loginButton.bottomAnchor,left: view.leftAnchor,
                           right: view.rightAnchor, paddingTop: 24, paddingLeft: 30,
                           paddingRight: 30, height: 55)
    }
    
    
    func configureButton(button: UIButton){
        button.backgroundColor = UIColor(white: 255.0/255.0, alpha: 0.8)
        button.layer.cornerRadius = 8
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        button.contentHorizontalAlignment = .left
        button.titleEdgeInsets = UIEdgeInsets(top: 0 , left: 46.0, bottom: 0.0, right: 0.0)
        button.imageEdgeInsets.left = 22

    }
}
