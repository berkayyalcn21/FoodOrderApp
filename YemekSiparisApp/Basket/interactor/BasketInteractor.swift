//
//  BasketInteractor.swift
//  YemekSiparisApp
//
//  Created by Berkay on 7.09.2022.
//

import Foundation
import Alamofire


class BasketInteractor: PresenterToInteractorBasketProtocol {
    
    var basketPresenter: InteractorToPresenterBasketProtocol?
    
    func fetch() {
        
        AF.request("http://kasimadalan.pe.hu/yemekler/sepettekiYemekleriGetir.php", method: .get).response { response in
            if let data = response.data {
                do {
                    let result = try JSONDecoder().decode(CartFoods.self, from: data)
                    if let list = result.sepet_yemekler {
                        self.basketPresenter?.dataTransferToPresenter(foodsList: list)
                        print("Veri geldi")
                    }
                }catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    func delete() {
        
    }
    
    
}
