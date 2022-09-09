//
//  CreateAccountInteractor.swift
//  YemekSiparisApp
//
//  Created by Berkay on 7.09.2022.
//

import Foundation
import Firebase

class CreateAccountInteractor: PresenterToInteractorCreateAccountProtocol {
    
    let auth = Auth.auth()
    func addPerson(email: String, password: String) {
        auth.createUser(withEmail: email, password: password)
    }
}
