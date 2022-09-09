//
//  Interactor.swift
//  YemekSiparisApp
//
//  Created by Berkay on 7.09.2022.
//

import Foundation
import UIKit
import Firebase


class LoginInteractor: PresenterToInteractorLoginProtocol {
    
    var loginPresenter: InteractorToPresenterLoginProtocol?
    var loginContol: String?
    
    func loginPerson(email: String, password: String) {
        
        let auth = Auth.auth()
        auth.signIn(withEmail: email, password: password) { authResult, error in
            if error != nil {
                print("Başarız")
                self.loginContol = error?.localizedDescription
            }else {
                print("Başarılı")
            }
        }
    }
    
    
    
    
    
}
