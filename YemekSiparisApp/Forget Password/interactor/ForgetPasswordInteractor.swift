//
//  ForgetPasswordInteractor.swift
//  YemekSiparisApp
//
//  Created by Berkay on 7.09.2022.
//

import Foundation
import Firebase


class ForgerPasswordInteractor: PresenterToInteractorForgetPasswordProtocol {
    
    let auth = Auth.auth()
    func resetPassword(email: String) {
        auth.sendPasswordReset(withEmail: email)
    }
}
