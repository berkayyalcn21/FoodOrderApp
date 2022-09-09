//
//  LoginVC.swift
//  YemekSiparisApp
//
//  Created by Berkay on 6.09.2022.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    var loginPresenterObject: ViewToPresenterLoginProtocol?
    var isSuccess: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        LoginRouter.createModule(ref: self)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }

    @IBAction func registerButtonTapped(_ sender: Any) {
        performSegue(withIdentifier: "toRegister", sender: nil)
    }
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        if emailTextField.text != "" && passwordTextField.text != "" {
            loginPresenterObject?.login(email: emailTextField.text!, password: passwordTextField.text!)
            
            if loginPresenterObject?.loginInteractor?.loginContol != nil {
                let alert = UIAlertController(title: nil, message: loginPresenterObject?.loginInteractor?.loginContol, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Tamam", style: .default))
                present(alert, animated: true)
                
            }else {
                self.performSegue(withIdentifier: "toHome", sender: nil)
            }
            
        }else {
            let alert = UIAlertController(title: "Hata", message: "Boş alan bırakmayınız!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Tamam", style: .default))
            present(alert, animated: true)
        }
    }
    
    @IBAction func forgetPasswordButtonTapped(_ sender: Any) {
        performSegue(withIdentifier: "toForgetPassword", sender: nil)
    }
    
}

extension LoginVC: PresenterToViewLoginProtocol {
    
    func dataTransferToView(isSuccess: String) {
        self.isSuccess = isSuccess
    }
}
