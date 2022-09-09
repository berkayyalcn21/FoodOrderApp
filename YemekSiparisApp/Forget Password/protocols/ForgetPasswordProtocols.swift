//
//  ForgetPasswordProtocols.swift
//  YemekSiparisApp
//
//  Created by Berkay on 7.09.2022.
//

import Foundation


protocol ViewToPresenterForgetPasswordProtocol {
    
    var forgetPasswordInteractor: PresenterToInteractorForgetPasswordProtocol? {get set}
    func reset(email: String)
}

protocol PresenterToInteractorForgetPasswordProtocol {
    func resetPassword(email: String)
}

protocol PresenterToRouterForgetPasswordProtocol {
    static func createModul(ref: ForgetPasswordVC)
}
