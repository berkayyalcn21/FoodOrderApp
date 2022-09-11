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
            kvkkIsComplete = false
            kvkkButton.setImage(UIImage(systemName: "checkmark.circle.fill"), for: .normal)
        }else {
            kvkkButton.setImage(UIImage(systemName: "checkmark.circle"), for: .normal)
            kvkkIsComplete = true
        }
    }
    
    @IBAction func registerButtonTapped(_ sender: Any) {
        if emailTextField.text != "" && passwordTextField.text != "" && againPasswordTextField.text != "" {
            if passwordTextField.text == againPasswordTextField.text {
                createAccountPresenterObject?.add(email: emailTextField.text!, password: passwordTextField.text!)
            }else {
                standartAlert(nil, "Parola tekrarı aynı olmalıdır", .alert, "Tamam", .default)
            }
        }else {
            standartAlert(nil, "Lütfen boş alan bırakmayınız.", .alert, "Tamam", .default)
        }
    }
    
}

extension CreateAccountVC: PresenterToViewCreateAccountProtocol {
    
    func dataTransferToView(error: Bool) {
        if error {
            standartAlert(nil, createAccountPresenterObject?.createAccountInteractor?.createAccountError, .alert, "Tamam", .default)
        }else {
            let alert = UIAlertController(title: nil, message: "Kayıt başarılı", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Tamam", style: .default, handler: { _ in
                self.dismiss(animated: true)
            }))
            present(alert, animated: true)
        }
    }
}


extension CreateAccountVC {
    func standartAlert(_ title: String?, _ messsage: String?, _ preferredStyle: UIAlertController.Style, _ buttonTitle: String?, _ buttonStyle: UIAlertAction.Style) {
        let alert = UIAlertController(title: title, message: messsage, preferredStyle: preferredStyle)
        alert.addAction(UIAlertAction(title: buttonTitle, style: buttonStyle))
        self.present(alert, animated: true)
    }
}
