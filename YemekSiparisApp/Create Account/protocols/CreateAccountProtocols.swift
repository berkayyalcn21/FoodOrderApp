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
    func add(email: String, password: String)
}

protocol PresenterToInteractorCreateAccountProtocol {
    
    func addPerson(email: String, password: String)
}


// Router
protocol PresenterToRouterCreateAccountProtocol {
    static func createModule(ref: CreateAccountVC)
}
