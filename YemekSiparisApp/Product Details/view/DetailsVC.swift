//
//  DetailsVC.swift
//  YemekSiparisApp
//
//  Created by Berkay on 7.09.2022.
//

import UIKit
import Kingfisher
import Firebase

class DetailsVC: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var foodNameLabel: UILabel!
    @IBOutlet weak var foodStarLabel: UILabel!
    @IBOutlet weak var foodDescLabel: UILabel!
    @IBOutlet weak var totalPriceLabel: UILabel!
    @IBOutlet weak var orderCountLabel: UILabel!
    @IBOutlet weak var foodPrepareTime: UILabel!
    
    var counter = 0
    var products: Foods?
    var productInfo: ProductDetails?
    var detailsPresenterObjc: DetailPresenter?
    var foodsList = [Foods]()
    let currentUser = Auth.auth().currentUser?.email
    
    override func viewDidLoad() {
        super.viewDidLoad()

        DetailRouter.createModul(ref: self)
        
        if products != nil {
            foodNameLabel.text = products?.yemek_adi
            totalPriceLabel.text = "\(products!.yemek_fiyat!) ₺"
            let baseUrl = "http://kasimadalan.pe.hu/yemekler/resimler/"
            imageView.image = UIImage(systemName: "photo")
            if let url = URL(string: "\(baseUrl)\(products!.yemek_resim_adi!)") {
                DispatchQueue.main.async {
                    self.imageView.kf.setImage(with: url)
                }
            }
            if productInfo != nil {
                foodStarLabel.text = productInfo?.star
                foodDescLabel.text = productInfo?.desc
                foodPrepareTime.text = productInfo?.prepareTime
            }
        }
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func subtractProductButtonTapped(_ sender: Any) {
        if orderCountLabel.text == "0" {
            orderCountLabel.text = "0"
        }else {
            counter -= 1
            orderCountLabel.text = String(counter)
        }
    }
    
    @IBAction func addProductButtonTapped(_ sender: Any) {
        counter += 1
        orderCountLabel.text = String(counter)
    }
    
    @IBAction func addProductToBasket(_ sender: Any) {
        if products != nil && orderCountLabel.text != "0"{
            detailsPresenterObjc?.order(food_name: (products?.yemek_adi)!, food_image_name: (products?.yemek_resim_adi)!, food_price: Int(products?.yemek_fiyat ?? "0 ₺")!, food_order_count: counter, currentUser: currentUser!)
            orderCountLabel.text = "0"
            let alert = UIAlertController(title: nil, message: "Ürünler sepete eklendi.", preferredStyle: .alert)
            let cancel = UIAlertAction(title: "Devam Et", style: .default)
            let goBasket = UIAlertAction(title: "Sepete Git", style: .cancel) { _ in
                self.performSegue(withIdentifier: "toBasket", sender: nil)
            }
            alert.addAction(cancel)
            alert.addAction(goBasket)
            present(alert, animated: true)
        }
    }
    
}

extension DetailsVC: PresenterToViewDetailsProtocol {
    
    func dataTransferToView(foodsList: Array<Foods>) {
        self.foodsList = foodsList
    }
}
