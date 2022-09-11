//
//  LoginProtocols.swift
//  YemekSiparisApp
//
//  Created by Berkay on 7.09.2022.
//

import Foundation

// Main Protocols
protocol ViewToPresenterLoginProtocol {
    
    var loginInteractor: PresenterToInteractorLoginProtocol? {get set}
    var loginView: PresenterToViewLoginProtocol? {get set}
    func login(email: String, password: String)
}

protocol PresenterToInteractorLoginProtocol {
    
    var loginPresenter: InteractorToPresenterLoginProtocol? {get set}
    var loginContol: String? {get set}
    func loginPerson(email: String, password: String)
}

// Transfer Protocols
protocol InteractorToPresenterLoginProtocol {
    func dataTransferToPresenter(isSuccess: Bool)
}

protocol PresenterToViewLoginProtocol {
    func dataTransferToView(isSuccess: Bool)
}

// Router
protocol PresenterToRouterLoginProtocol {
    static func createModule(ref: LoginVC)
}
 
