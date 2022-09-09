//
//  HomeVC.swift
//  YemekSiparisApp
//
//  Created by Berkay on 7.09.2022.
//

import UIKit
import SwiftUI

class HomeVC: UIViewController {
    
    @IBOutlet weak var collectionViewSlider: UICollectionView!
    @IBOutlet weak var collectionViewProducts: UICollectionView!
    let sliderImages = [
        "slider-1",
        "slider-2",
        "slider-3",
        "slider-4"
    ]
    var homePresenterObjc: ViewToPresenterHomeProtocol?
    var foodsList = [Foods]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionViewSlider.delegate = self
        collectionViewSlider.dataSource = self
        collectionViewProducts.delegate = self
        collectionViewProducts.dataSource = self
        HomeRouter.createModule(ref: self)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)

        let desing = UICollectionViewFlowLayout()
        desing.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        desing.minimumLineSpacing = 10
        desing.minimumInteritemSpacing = 10
        let width = collectionViewProducts.frame.size.width
        let cellWidth = (width - 30) / 2
        desing.itemSize = CGSize(width: cellWidth, height: cellWidth * 1.5)
        collectionViewProducts.collectionViewLayout = desing
    }
    
    override func viewWillAppear(_ animated: Bool) {
        homePresenterObjc?.allFoods()
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
}


extension HomeVC: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case collectionViewSlider:
            return sliderImages.count
        case collectionViewProducts:
            return foodsList.count
        default:
            return 0
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case collectionViewSlider:
            let image = sliderImages[indexPath.row]
            let item = collectionView.dequeueReusableCell(withReuseIdentifier: "item", for: indexPath) as! HomeCollectionViewCell
            item.imageView.image = UIImage(named: image)
            item.sliderPageControl.numberOfPages = sliderImages.count
            return item
        case collectionViewProducts:
            let food = foodsList[indexPath.row]
            let baseUrl = "http://kasimadalan.pe.hu/yemekler/resimler/"
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! HomeCollectionViewCellProducts
            let url = URL(string: "\(baseUrl)\(food.yemek_resim_adi!)")
            if let data = try? Data(contentsOf: url!) {
                cell.imageView.image = UIImage(data: data)
            }
            cell.foodNameLabel.text = food.yemek_adi
            cell.foodPriceLabel.text = "\(food.yemek_fiyat!) ₺"
            return cell
        default:
            return UICollectionViewCell()
        }
    }
}

extension HomeVC: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
}


extension HomeVC: PresenterToViewHomeProtocol {
    
    func dataTransferToView(foodsList: Array<Foods>) {
        self.foodsList = foodsList
        DispatchQueue.main.async {
            self.collectionViewProducts.reloadData()
        }
    }
}
