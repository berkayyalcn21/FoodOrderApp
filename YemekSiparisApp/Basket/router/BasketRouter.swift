//
//  BasketRouter.swift
//  YemekSiparisApp
//
//  Created by Berkay on 7.09.2022.
//

import Foundation


class BasketRouter: PresenterToRouterBasketProtocol {
    
    static func createModule(ref: BasketVC) {
        let presenter = BasketPresenter()
        
        // View
        ref.basketPresenterObjc = presenter
        
        // Presenter
        ref.basketPresenterObjc?.basketInteractor = BasketInteractor()
        ref.basketPresenterObjc?.basketView = ref
        
        // Interactor
        ref.basketPresenterObjc?.basketInteractor?.basketPresenter = presenter
    }
}
