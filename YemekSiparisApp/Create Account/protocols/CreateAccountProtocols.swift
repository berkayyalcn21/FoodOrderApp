//
//  CreateAccountProtocols.swift
//  YemekSiparisApp
//
//  Created by Berkay on 7.09.2022.
//

import Foundation

// Main Protocols
protocol ViewToPresenterCreateAccountProtocol {
    
    var createAccountInteractor: PresenterToInteractorCreateAccountProtocol? {get set}
    var createAccountView: PresenterToViewCreateAccountProtocol? {get set}
    func add(email: String, password: String)
}

protocol PresenterToInteractorCreateAccountProtocol {
    
    var createAccountPresenter: InteractorToPresenterCreateAccountProtocol? {get set}
    var createAccountError: String? {get set}
    func addPerson(email: String, password: String)
}

// Transfer Protocols
protocol InteractorToPresenterCreateAccountProtocol {
    func dataTransferToPresenter(error: Bool)
}

protocol PresenterToViewCreateAccountProtocol {
    func dataTransferToView(error: Bool)
}


// Router
protocol PresenterToRouterCreateAccountProtocol {
    static func createModule(ref: CreateAccountVC)
}
