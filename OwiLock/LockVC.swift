//
//  LockVC.swift
//  OwiLock
//
//  Created by Owais Akram on 15/02/2019.
//  Copyright © 2018 Owais Akram. All rights reserved.
//

import UIKit
import AudioToolbox // for vibration

class LockVC: UIViewController {
    
    // MARK: Variables
    var password:String = "0000"
    var enteredPassword:String = ""
    
    // MARK: Outlets
    @IBOutlet weak var shakeView: UIView!
    
    // 4 dots for telling how many inputs have been entered
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view3: UIView!
    @IBOutlet weak var view4: UIView!
    
    // Buttons (1-9)
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn3: UIButton!
    @IBOutlet weak var btn4: UIButton!
    @IBOutlet weak var btn5: UIButton!
    @IBOutlet weak var btn6: UIButton!
    @IBOutlet weak var btn7: UIButton!
    @IBOutlet weak var btn8: UIButton!
    @IBOutlet weak var btn9: UIButton!
    @IBOutlet weak var btn0: UIButton!
    @IBOutlet weak var btnBiometric: UIButton!
    @IBOutlet weak var btnBackspace: UIButton!
    
    // MARK: View Loads
    override func viewDidLoad() {
        super.viewDidLoad()
        
        _ = configureUI() // configure the view
    }
    
    // MARK: Actions
    @IBAction func btnDigitPressed(_ sender: UIButton) {
        
        // we have already set the tags with buttons in Main.storyboard
        
            if sender.tag == 0 //
            {
                self.enteredPassword +=  "0"
            }
            else if sender.tag == 1
            {
                self.enteredPassword +=  "1"
            }
            else if sender.tag == 2
            {
                self.enteredPassword +=  "2"
            }
            else if sender.tag == 3
            {
                self.enteredPassword +=  "3"
            }
            else if sender.tag == 4
            {
                self.enteredPassword +=  "4"
            }
            else if sender.tag == 5
            {
                self.enteredPassword +=  "5"
            }
            else if sender.tag == 6
            {
                self.enteredPassword +=  "6"
            }
            else if sender.tag == 7
            {
                self.enteredPassword +=  "7"
            }
            else if sender.tag == 8
            {
                self.enteredPassword +=  "8"
            }
            else if sender.tag == 9
            {
                self.enteredPassword +=  "9"
            }
            else if sender.tag == 11
            {
                self.alert(message: "Implementation coming soon...", title: "Forgot Password !")
            }
            else if sender.tag == 12 // Backspace
            {
                //print("Before Removing: \t \(self.enteredPassword)")
                _ = self.enteredPassword.removeLast()
                //print("After Removing: \t \(self.enteredPassword)")
        }
            
            if self.enteredPassword.count == 0
            {
                btnBackspace.isHidden = true
                view1.backgroundColor = UIColor.clear
                view2.backgroundColor = UIColor.clear
                view3.backgroundColor = UIColor.clear
                view4.backgroundColor = UIColor.clear
            }
            else if self.enteredPassword.count == 1
            {
                btnBackspace.isHidden = false
                view1.backgroundColor = UIColor.white
                view2.backgroundColor = UIColor.clear
                view3.backgroundColor = UIColor.clear
                view4.backgroundColor = UIColor.clear
            }
            else if self.enteredPassword.count == 2
            {
                btnBackspace.isHidden = false
                view1.backgroundColor = UIColor.white
                view2.backgroundColor = UIColor.white
                view3.backgroundColor = UIColor.clear
                view4.backgroundColor = UIColor.clear
            }
            else if self.enteredPassword.count == 3
            {
                btnBackspace.isHidden = false
                view1.backgroundColor = UIColor.white
                view2.backgroundColor = UIColor.white
                view3.backgroundColor = UIColor.white
                view4.backgroundColor = UIColor.clear
            }
            else if self.enteredPassword.count == 4
            {
                btnBackspace.isHidden = false
                view1.backgroundColor = UIColor.white
                view2.backgroundColor = UIColor.white
                view3.backgroundColor = UIColor.white
                view4.backgroundColor = UIColor.white
            }
        
        if self.enteredPassword.count < 4
        {
            // continue getting input from user
        }
        else
        {
            // 4 digits have been entered match it with the saved password now
            if self.enteredPassword == self.password // Correct Password
            {
                resetFields()
                self.alert(message: "Yaaay !", title: "Correct Password !")
            }
            else // Incorrect Password
            {
                resetFields()
                shakeView.shake()
                
                // to vibrate physical device on wrong password
                AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
            }
        }
    }
    
    // MARK: Functions
    
    func resetFields()
    {
        self.enteredPassword = ""
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.view1.backgroundColor = UIColor.clear
            self.view2.backgroundColor = UIColor.clear
            self.view3.backgroundColor = UIColor.clear
            self.view4.backgroundColor = UIColor.clear
            self.btnBackspace.isHidden = true
        }
    }
    
    
    func configureUI()
    {
        self.resetFields()
        btnBackspace.isHidden = true
        // setting the corner radius
        view1.layer.cornerRadius = view1.frame.height / 2
        view2.layer.cornerRadius = view2.frame.height / 2
        view3.layer.cornerRadius = view3.frame.height / 2
        view4.layer.cornerRadius = view4.frame.height / 2
        
        view1.layer.borderColor = UIColor.white.cgColor
        view2.layer.borderColor = UIColor.white.cgColor
        view3.layer.borderColor = UIColor.white.cgColor
        view4.layer.borderColor = UIColor.white.cgColor
        
        view1.layer.borderWidth = 1
        view2.layer.borderWidth = 1
        view3.layer.borderWidth = 1
        view4.layer.borderWidth = 1
        
        view1.clipsToBounds = true
        view2.clipsToBounds = true
        view3.clipsToBounds = true
        view4.clipsToBounds = true
        
        btn1.layer.cornerRadius = btn1.frame.height / 2
        btn2.layer.cornerRadius = btn2.frame.height / 2
        btn3.layer.cornerRadius = btn3.frame.height / 2
        btn4.layer.cornerRadius = btn4.frame.height / 2
        btn5.layer.cornerRadius = btn5.frame.height / 2
        btn6.layer.cornerRadius = btn6.frame.height / 2
        btn7.layer.cornerRadius = btn7.frame.height / 2
        btn8.layer.cornerRadius = btn8.frame.height / 2
        btn9.layer.cornerRadius = btn9.frame.height / 2
        btn0.layer.cornerRadius = btn0.frame.height / 2
        btnBiometric.layer.cornerRadius = btnBiometric.frame.height / 2
        btnBackspace.layer.cornerRadius = btnBiometric.frame.height / 2
        
        
        btn1.layer.borderColor = UIColor.white.cgColor
        btn2.layer.borderColor = UIColor.white.cgColor
        btn3.layer.borderColor = UIColor.white.cgColor
        btn4.layer.borderColor = UIColor.white.cgColor
        btn5.layer.borderColor = UIColor.white.cgColor
        btn6.layer.borderColor = UIColor.white.cgColor
        btn7.layer.borderColor = UIColor.white.cgColor
        btn8.layer.borderColor = UIColor.white.cgColor
        btn9.layer.borderColor = UIColor.white.cgColor
        btn0.layer.borderColor = UIColor.white.cgColor
        btnBiometric.layer.borderColor = UIColor.white.cgColor
        btnBackspace.layer.borderColor = UIColor.white.cgColor
        
        btn1.layer.borderWidth = 1
        btn2.layer.borderWidth = 1
        btn3.layer.borderWidth = 1
        btn4.layer.borderWidth = 1
        btn5.layer.borderWidth = 1
        btn6.layer.borderWidth = 1
        btn7.layer.borderWidth = 1
        btn8.layer.borderWidth = 1
        btn9.layer.borderWidth = 1
        btn0.layer.borderWidth = 1
        btnBiometric.layer.borderWidth = 1
        btnBackspace.layer.borderWidth = 1
        
        btn1.clipsToBounds = true
        btn2.clipsToBounds = true
        btn3.clipsToBounds = true
        btn4.clipsToBounds = true
        btn5.clipsToBounds = true
        btn6.clipsToBounds = true
        btn7.clipsToBounds = true
        btn8.clipsToBounds = true
        btn9.clipsToBounds = true
        btn0.clipsToBounds = true
        btnBiometric.clipsToBounds = true
        btnBackspace.clipsToBounds = true
        
    } // ConfigureUI ends
} // Class LockVC ends


// MARK: UIViewController Extensions

public extension UIViewController {
    
    func alert(message: String, title: String ) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(OKAction)
        self.present(alertController, animated: true, completion: nil)
    }
}

// MARK: UIView Extensions

public extension UIView {
    
    func shake() {
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.07
        animation.repeatCount = 3
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x: self.center.x - 6, y: self.center.y))
        animation.toValue = NSValue(cgPoint: CGPoint(x: self.center.x + 6, y: self.center.y))
        self.layer.add(animation, forKey: "position")
    }
}
