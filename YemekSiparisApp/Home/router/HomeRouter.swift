//
//  HomeRouter.swift
//  YemekSiparisApp
//
//  Created by Berkay on 7.09.2022.
//

import Foundation


class HomeRouter: PresenterToRouterHomeProtocol {
    
    static func createModule(ref: HomeVC) {
        let presenter = HomePresenter()
        
        // View
        ref.homePresenterObjc = presenter
        
        // Presenter
        ref.homePresenterObjc?.homeInteractor = HomeInteractor()
        ref.homePresenterObjc?.homeView = ref
        
        // Interactor
        ref.homePresenterObjc?.homeInteractor?.homePresenter = presenter
    }
}
