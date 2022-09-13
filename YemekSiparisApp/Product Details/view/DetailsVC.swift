//
//  DetailsVC.swift
//  YemekSiparisApp
//
//  Created by Berkay on 7.09.2022.
//

import UIKit

class DetailsVC: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var foodNameLabel: UILabel!
    @IBOutlet weak var foodStarLabel: UILabel!
    @IBOutlet weak var foodDescLabel: UILabel!
    @IBOutlet weak var totalPriceLabel: UILabel!
    @IBOutlet weak var orderCountLabel: UILabel!
    var products: Cart?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let products = products {
            foodNameLabel.text = products.yemek_adi
//            imageView.image = UIImage(named: products.yemek_resim_adi!)
            
        }
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func subtractProductButtonTapped(_ sender: Any) {
        
    }
    
    @IBAction func addProductButtonTapped(_ sender: Any) {
        
    }
    
    @IBAction func addProductToBasket(_ sender: Any) {
        
    }
    
}
