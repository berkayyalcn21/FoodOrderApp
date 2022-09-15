//
//  DetailsProtocols.swift
//  YemekSiparisApp
//
//  Created by Berkay on 7.09.2022.
//

import Foundation

// Main Protocols
protocol ViewToPresenterDetailsProtocol {
    
    var detailInteractor: PresenterToInteractorDetailsProtocol? {get set}
    var detailView: PresenterToViewDetailsProtocol? {get set}
    func order(food_name: String, food_image_name: String, food_price: Int, food_order_count: Int, currentUser: String)
}

protocol PresenterToInteractorDetailsProtocol {
    
    var detailPresenter: InteractorToPresenterDetailsProtocol? {get set}
    func addOrder(food_name: String, food_image_name: String, food_price: Int, food_order_count: Int, currentUser: String)
}

// Transfer Protocols
protocol InteractorToPresenterDetailsProtocol {
    
    func dataTransferToPresenter(foodsList: Array<Foods>)
}

protocol PresenterToViewDetailsProtocol {
    
    func dataTransferToView(foodsList: Array<Foods>)
}

// Router
protocol PresenterToRouterDetailsProtocol {
    static func createModul(ref: DetailsVC)
}
