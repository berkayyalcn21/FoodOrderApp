//
//  DetailsPresenter.swift
//  YemekSiparisApp
//
//  Created by Berkay on 7.09.2022.
//

import Foundation


class DetailPresenter: ViewToPresenterDetailsProtocol {
    
    var detailInteractor: PresenterToInteractorDetailsProtocol?
    var detailView: PresenterToViewDetailsProtocol?

    
    func order(food_name: String, food_image_name: String, food_price: Int, food_order_count: Int, currentUser: String) {
        detailInteractor?.addOrder(food_name: food_name, food_image_name: food_image_name, food_price: food_price, food_order_count: food_order_count, currentUser: currentUser)
    }
    
    
}


extension DetailPresenter: InteractorToPresenterDetailsProtocol {
    
    func dataTransferToPresenter(foodsList: Array<Foods>) {
        detailView?.dataTransferToView(foodsList: foodsList)
    }
}
