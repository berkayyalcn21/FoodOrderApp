//
//  CreateAccountPresenter.swift
//  YemekSiparisApp
//
//  Created by Berkay on 7.09.2022.
//

import Foundation


class CreateAccountPresenter: ViewToPresenterCreateAccountProtocol {
    
    var createAccountInteractor: PresenterToInteractorCreateAccountProtocol?
    
    func add(email: String, password: String) {
        createAccountInteractor?.addPerson(email: email, password: password)
    }
}

