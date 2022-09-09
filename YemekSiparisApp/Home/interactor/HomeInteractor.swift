//
//  HomeInteractor.swift
//  YemekSiparisApp
//
//  Created by Berkay on 7.09.2022.
//

import Foundation
import Alamofire
import UIKit


class HomeInteractor: PresenterToInteractorHomeProtocol {
    
    var homePresenter: InteractorToPresenterHomeProtocol?
    
    func getAllFoods() {
        AF.request("http://kasimadalan.pe.hu/yemekler/tumYemekleriGetir.php", method: .get).response { response in
            if let data = response.data {
                do {
                    let result = try JSONDecoder().decode(FoodsResult.self, from: data)
                    if let list = result.yemekler {
                        self.homePresenter?.dataTransferToPresenter(foodsList: list)
                    }
                }catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    func searchFood(food_id: String) {
        
    }
    
    
}
