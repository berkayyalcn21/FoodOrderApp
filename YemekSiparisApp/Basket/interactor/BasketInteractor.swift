//
//  BasketInteractor.swift
//  YemekSiparisApp
//
//  Created by Berkay on 7.09.2022.
//

import Foundation
import Alamofire
import Firebase


class BasketInteractor: PresenterToInteractorBasketProtocol {
    
    var basketPresenter: InteractorToPresenterBasketProtocol?
    
    func fetch() {
        let currentUser = Auth.auth().currentUser?.email
        let params: Parameters = ["kullanici_adi": currentUser!]
        AF.request("http://kasimadalan.pe.hu/yemekler/sepettekiYemekleriGetir.php", method: .post, parameters: params).response { response in
            if let data = response.data {
                do {
                    let result = try JSONDecoder().decode(CartFoods.self, from: data)
                    if let list = result.sepet_yemekler {
                        self.basketPresenter?.dataTransferToPresenter(foodsList: list)
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
