//
//  ForgetPasswordVC.swift
//  YemekSiparisApp
//
//  Created by Berkay on 7.09.2022.
//

import UIKit

class ForgetPasswordVC: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    var forgerPasswordPresenterObject: ViewToPresenterForgetPasswordProtocol? 
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        ForgerPasswordRouter.createModul(ref: self)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }

    @IBAction func sendButtonTapped(_ sender: Any) {
        forgerPasswordPresenterObject?.reset(email: emailTextField.text!)
        let alert = UIAlertController(title: "BİLGİ", message: "Lütfen mail kutunuzu kontrol edin.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Tamam", style: .default, handler: { _ in
            self.dismiss(animated: true)
        }))
        present(alert, animated: true)
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        dismiss(animated: true)
    }
    
    
    
    
}
