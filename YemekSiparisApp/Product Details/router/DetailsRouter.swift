//
//  DetailsRouter.swift
//  YemekSiparisApp
//
//  Created by Berkay on 7.09.2022.
//

import Foundation


class DetailRouter: PresenterToRouterDetailsProtocol {
    
    static func createModul(ref: DetailsVC) {
        let presenter = DetailPresenter()
        
        // View
        ref.detailsPresenterObjc = presenter
        
        // Presenter
        ref.detailsPresenterObjc?.detailInteractor = DetailInteractor()
        ref.detailsPresenterObjc?.detailView = ref
        
        // Interactor
        ref.detailsPresenterObjc?.detailInteractor?.detailPresenter = presenter
    }
}
