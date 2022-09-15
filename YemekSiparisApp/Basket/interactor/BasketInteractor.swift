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
    let currentUser = Auth.auth().currentUser?.email
    
    func fetch() {
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
    
    func delete(food_id: String) {
        let params: Parameters = ["sepet_yemek_id": food_id, "kullanici_adi": currentUser!]
        AF.request("http://kasimadalan.pe.hu/yemekler/sepettenYemekSil.php", method: .post, parameters: params).response { response in
            if let data = response.data {
                do {
                    let result = try JSONSerialization.jsonObject(with: data)
                    print(result)
                    
                }catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    
}
