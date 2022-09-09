//
//  CreateAccountVC.swift
//  YemekSiparisApp
//
//  Created by Berkay on 7.09.2022.
//

import UIKit

class CreateAccountVC: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var againPasswordTextField: UITextField!
    @IBOutlet weak var kvkkButton: UIButton!
    var createAccountPresenterObject: ViewToPresenterCreateAccountProtocol?
    var kvkkIsComplete: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        CreateAccountRouter.createModule(ref: self)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }

    @IBAction func backButtonTapped(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func alreadyAccountButtonTapped(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func kvkkButtonTapped(_ sender: Any) {
        if kvkkIsComplete {
            kvkkButton.setImage(UIImage(systemName: "checkmark.circle.fill"), for: .normal)
        }else {
            kvkkButton.setImage(UIImage(systemName: "checkmark.circle"), for: .normal)
            kvkkIsComplete = true
        }
        
    }
    
    @IBAction func registerButtonTapped(_ sender: Any) {
    
        let alert = UIAlertController()
        if emailTextField.text != "" && passwordTextField.text != "" && againPasswordTextField.text != "" {
            if passwordTextField.text == againPasswordTextField.text {
                if passwordTextField.text!.count > 5 && againPasswordTextField.text!.count > 5 {
                    if kvkkIsComplete {
                        self.createAccountPresenterObject?.add(email: self.emailTextField.text!, password: self.passwordTextField.text!)
                        self.dismiss(animated: true)
                    }else {
                        alert.title = "UYARI"
                        alert.message = "KVKK Koşullarını kabul ediniz."
                        alert.addAction(UIAlertAction(title: "Tamam", style: .default))
                        present(alert, animated: true)
                    }
                }else {
                    alert.title = "UYARI"
                    alert.message = "Şifreniz minimum 6 haneli olmalıdır!"
                    alert.addAction(UIAlertAction(title: "Tamam", style: .default))
                    present(alert, animated: true)
                }
            }else {
                alert.title = "UYARI"
                alert.message = "Şifreniz aynı olmalı!"
                alert.addAction(UIAlertAction(title: "Tamam", style: .default))
                present(alert, animated: true)
            }
        }else {
            alert.title = "UYARI"
            alert.message = "Lütfen boş alan bırakmayınız."
            alert.addAction(UIAlertAction(title: "Tamam", style: .default))
            present(alert, animated: true)
        }
    }
    
}

