//
//  AnimationViewController.swift
//  iOSTest
//
//  Copyright © 2020 Rapptr Labs. All rights reserved.

import UIKit
import AVFoundation

class AnimationViewController: UIViewController {
    
        let myImageView:UIImageView = UIImageView()
        var panGesture = UIPanGestureRecognizer()
        var player = AVAudioPlayer()
    
        @IBOutlet weak var fadeButton: UIButton!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Animation"
     
        
        panGesture = UIPanGestureRecognizer(target: self, action: #selector(AnimationViewController.draggedView(_:)))
            myImageView.isUserInteractionEnabled = true
            myImageView.addGestureRecognizer(panGesture)
        
        configureUI()
    }
    
    // MARK: - Actions
  
    
    @IBAction func didPressFade(_ sender: Any) {
   
        playSound()
        
        if myImageView.alpha == 0.0{
            myImageView.fadeIn(1.0, delay: 0) { appeared in
                print("View has appeared")
                self.fadeButton.setTitle("Fade Out", for: .normal)
                
            }
            
        }
        else{
            myImageView.fadeOut(1.0, delay: 0) { disappeared in
                print("View has disappeared")
                self.fadeButton.setTitle("Fade In", for: .normal)
            }
        }
       
    }
    
    // MARK: - Functions
    func playSound() {
        let path = Bundle.main.path(forResource: "sound", ofType : "wav")!
            let url = URL(fileURLWithPath : path)
            do {
                player = try AVAudioPlayer(contentsOf: url)
                player.play()
            } catch {
                print ("There is an issue with this code!")
            }
    }
    
    func configureUI(){
        let myLogo = UIImage(named: "ic_logo")
        
        myImageView.contentMode = UIView.ContentMode.scaleAspectFit
        myImageView.frame.size.width = 300
        myImageView.frame.size.height = 200
        myImageView.center = self.view.center
        myImageView.image = myLogo
        view.addSubview(myImageView)
        myImageView.alpha = 0.0
        
        
        fadeButton.anchor(left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingLeft: 30, paddingBottom: 30, paddingRight: 30,height: 55)
        fadeButton.backgroundColor = UIColor(red: 14.0/255, green: 92.0/255, blue: 137.0/255, alpha: 1.0)
        fadeButton.titleLabel!.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        fadeButton.setTitleColor(UIColor.white, for: .normal)
    }
    
    @objc func draggedView(_ sender:UIPanGestureRecognizer){
        self.view.bringSubviewToFront(myImageView)
        let translation = sender.translation(in: self.view)
        myImageView.center = CGPoint(x: myImageView.center.x + translation.x, y: myImageView.center.y + translation.y)
        sender.setTranslation(CGPoint.zero, in: self.view)
    }
     
}
