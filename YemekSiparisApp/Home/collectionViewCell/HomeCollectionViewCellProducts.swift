//
//  HomeCollectionViewCellProducts.swift
//  YemekSiparisApp
//
//  Created by Berkay on 8.09.2022.
//

import UIKit

protocol BagButtonsProtocol {
    
    func addButtonDataTransfer(indexPath: IndexPath)
    func subtractButtonDataTransfer(indexPath: IndexPath)
}

class HomeCollectionViewCellProducts: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var foodNameLabel: UILabel!
    @IBOutlet weak var foodPriceLabel: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    
    var itemsProtocol: BagButtonsProtocol?
    var indexPath: IndexPath?
    
    @IBAction func addButtonTapped(_ sender: Any) {
        itemsProtocol?.addButtonDataTransfer(indexPath: indexPath!)
    }
    
    @IBAction func subtractButtonTapped(_ sender: Any) {
        itemsProtocol?.subtractButtonDataTransfer(indexPath: indexPath!)
    }
    
}
