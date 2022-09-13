//
//  HomePresenter.swift
//  YemekSiparisApp
//
//  Created by Berkay on 7.09.2022.
//

import Foundation


class HomePresenter: ViewToPresenterHomeProtocol {
    
    var homeInteractor: PresenterToInteractorHomeProtocol?
    var homeView: PresenterToViewHomeProtocol?
    
    func allFoods() {
        homeInteractor?.getAllFoods()
    }
    
    func search(food_name: String) {
        
    }
    
    func order(food_name: String, food_image_name: String, food_price: Int, food_order_count: Int, currentUser: String) {
        homeInteractor?.addOrder(food_name: food_name, food_image_name: food_image_name, food_price: food_price, food_order_count: food_order_count, currentUser: currentUser)
    }
    
}

extension HomePresenter: InteractorToPresenterHomeProtocol {
    
    func dataTransferToPresenter(foodsList: Array<Foods>) {
        homeView?.dataTransferToView(foodsList: foodsList)
    }
}
