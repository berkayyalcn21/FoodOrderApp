//
//  CreateAccountInteractor.swift
//  YemekSiparisApp
//
//  Created by Berkay on 7.09.2022.
//

import Foundation
import Firebase

class CreateAccountInteractor: PresenterToInteractorCreateAccountProtocol {
    
    var createAccountPresenter: InteractorToPresenterCreateAccountProtocol?
    var createAccountError: String?
    let auth = Auth.auth()
    
    func addPerson(email: String, password: String) {
        auth.createUser(withEmail: email, password: password) { _, error in
            if error != nil {
                self.createAccountError = error?.localizedDescription
                self.createAccountPresenter?.dataTransferToPresenter(error: true)
            }else {
                self.createAccountPresenter?.dataTransferToPresenter(error: false)
            }
        }
    }
}
