//
//  BasketPresenter.swift
//  YemekSiparisApp
//
//  Created by Berkay on 7.09.2022.
//

import Foundation
import Alamofire


class BasketPresenter: ViewToPresenterBasketProtocol {
    
    var basketInteractor: PresenterToInteractorBasketProtocol?
    var basketView: PresenterToViewBasketProtocol?
    
    func fethFoods() {
        basketInteractor?.fetch()
    }
    
    func deleteFood() {
        
    }

    
}


extension BasketPresenter: InteractorToPresenterBasketProtocol {
    
    func dataTransferToPresenter(foodsList: Array<Cart>) {
        basketView?.dataTransferToView(foodsList: foodsList)
    }
}
