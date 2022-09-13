//
//  HomeCollectionViewCellProducts.swift
//  YemekSiparisApp
//
//  Created by Berkay on 8.09.2022.
//

import UIKit

protocol BagButtonsProtocol {
    
    func detailButtonTapped(indexPath: IndexPath)
}

class HomeCollectionViewCellProducts: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var foodNameLabel: UILabel!
    @IBOutlet weak var foodPriceLabel: UILabel!
    
    var itemsProtocol: BagButtonsProtocol?
    var indexPath: IndexPath?
    
    @IBAction func detailButtonTapped(_ sender: Any) {
        itemsProtocol?.detailButtonTapped(indexPath: indexPath!)
    }
    
}
