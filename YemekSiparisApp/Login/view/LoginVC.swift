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
        }else {
            standartAlert(nil, "Boş alan bırakmayınız!", .alert, "Tamam", .default)
        }
    }
    
    @IBAction func forgetPasswordButtonTapped(_ sender: Any) {
        performSegue(withIdentifier: "toForgetPassword", sender: nil)
    }
    
}

extension LoginVC: PresenterToViewLoginProtocol {
    
    func dataTransferToView(isSuccess: Bool) {
        if isSuccess {
            self.performSegue(withIdentifier: "toHome", sender: nil)
        }else {
            standartAlert(nil, loginPresenterObject?.loginInteractor?.loginContol, .alert, "Tamam", .default)
        }
    }
}

extension LoginVC {
    func standartAlert(_ title: String?, _ messsage: String?, _ preferredStyle: UIAlertController.Style, _ buttonTitle: String, _ buttonStyle: UIAlertAction.Style) {
        let alert = UIAlertController(title: title, message: messsage, preferredStyle: preferredStyle)
        alert.addAction(UIAlertAction(title: buttonTitle, style: buttonStyle))
        self.present(alert, animated: true)
    }
}
