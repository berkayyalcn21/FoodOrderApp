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
    
    func search(food_id: String) {
        
    }
    
}

extension HomePresenter: InteractorToPresenterHomeProtocol {
    
    func dataTransferToPresenter(foodsList: Array<Foods>) {
        homeView?.dataTransferToView(foodsList: foodsList)
    }
}
