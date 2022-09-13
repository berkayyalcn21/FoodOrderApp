//
//  HomeProtocols.swift
//  YemekSiparisApp
//
//  Created by Berkay on 7.09.2022.
//

import Foundation

// Main Protocols
protocol ViewToPresenterHomeProtocol {
    
    var homeInteractor: PresenterToInteractorHomeProtocol? {get set}
    var homeView: PresenterToViewHomeProtocol? {get set}
    func allFoods()
    func search(food_name: String)
    func order(food_name: String, food_image_name: String, food_price: Int, food_order_count: Int, currentUser: String)
}

protocol PresenterToInteractorHomeProtocol {
    
    var homePresenter: InteractorToPresenterHomeProtocol? {get set}
    func getAllFoods()
    func searchFood(food_name: String)
    func addOrder(food_name: String, food_image_name: String, food_price: Int, food_order_count: Int, currentUser: String)
}

// Transfer Protocols
protocol InteractorToPresenterHomeProtocol {
    
    func dataTransferToPresenter(foodsList: Array<Foods>)
}

protocol PresenterToViewHomeProtocol {
    
    func dataTransferToView(foodsList: Array<Foods>)
}

// Router
protocol PresenterToRouterHomeProtocol {
    
    static func createModule(ref: HomeVC)
}
