//
//  CreateAccountRouter.swift
//  YemekSiparisApp
//
//  Created by Berkay on 7.09.2022.
//

import Foundation


class CreateAccountRouter: PresenterToRouterCreateAccountProtocol {
    
    static func createModule(ref: CreateAccountVC) {
        
//        ref.createAccountPresenterObject = CreateAccountPresenter()
//        ref.createAccountPresenterObject?.createAccountInteractor = CreateAccountInteractor()
        
        let presenter = CreateAccountPresenter()

        // View
        ref.createAccountPresenterObject = presenter

        // Presenter
        ref.createAccountPresenterObject?.createAccountInteractor = CreateAccountInteractor()
        ref.createAccountPresenterObject?.createAccountView = ref

        // Interactor
        ref.createAccountPresenterObject?.createAccountInteractor?.createAccountPresenter = presenter
    }
}
