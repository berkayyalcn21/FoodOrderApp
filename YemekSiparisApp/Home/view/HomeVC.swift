
//
//  HomeVC.swift
//  YemekSiparisApp
//
//  Created by Berkay on 7.09.2022.
//

import UIKit
import SwiftUI
import Kingfisher
import Firebase

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
    var filteredFoodList = [Foods]()
    var currentUser = Auth.auth().currentUser?.email
    var orderCount = 0
    var lastOrderedFoodName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Delegates
        collectionViewSlider.delegate = self
        collectionViewSlider.dataSource = self
        collectionViewProducts.delegate = self
        collectionViewProducts.dataSource = self
        HomeRouter.createModule(ref: self)
        
        // For closed keyboard
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)

        // Products collectionView size settings
        let desing = UICollectionViewFlowLayout()
        desing.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        desing.minimumLineSpacing = 10
        desing.minimumInteritemSpacing = 10
        let width = collectionViewProducts.frame.size.width
        let cellWidth = (width - 30) / 2
        desing.itemSize = CGSize(width: cellWidth, height: cellWidth * 1.5)
        collectionViewProducts.collectionViewLayout = desing
    }
    
    // Lifecycle
    override func viewWillAppear(_ animated: Bool) {
        homePresenterObjc?.allFoods()
    }
    
    // Close keyboard func
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    // Go to basket button
    @IBAction func basketButtonTapped(_ sender: Any) {
        performSegue(withIdentifier: "toBasket", sender: nil)
    }
    
    // Logout from app
    @IBAction func exitButtonFromApp(_ sender: Any) {
        let alert = UIAlertController(title: nil, message: "Çıkmak istediğine emin misin?", preferredStyle: .alert)
        let cancelButton = UIAlertAction(title: "Vazgeç", style: .cancel)
        let okayButton = UIAlertAction(title: "Evet", style: .destructive) { _ in
            do {
                try Auth.auth().signOut()
                self.performSegue(withIdentifier: "toLogin", sender: nil)
            }catch {
                print(error.localizedDescription)
            }
            
        }
        alert.addAction(cancelButton)
        alert.addAction(okayButton)
        self.present(alert, animated: true)
    }
    
}

// CollectionView delegate import
extension HomeVC: UICollectionViewDelegate, UICollectionViewDataSource, BagButtonsProtocol {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    // Rows size
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
    
    // Rows data settings
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        // Slider collectionView
        case collectionViewSlider:
            let image = sliderImages[indexPath.row]
            let item = collectionView.dequeueReusableCell(withReuseIdentifier: "item", for: indexPath) as! HomeCollectionViewCell
            item.imageView.image = UIImage(named: image)
            item.sliderPageControl.numberOfPages = sliderImages.count
            return item
        // Product collectionView
        case collectionViewProducts:
            let food = foodsList[indexPath.row]
            let baseUrl = "http://kasimadalan.pe.hu/yemekler/resimler/"
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! HomeCollectionViewCellProducts
            cell.imageView.image = UIImage(systemName: "photo")
            if let url = URL(string: "\(baseUrl)\(food.yemek_resim_adi!)") {
                DispatchQueue.main.async {
                    cell.imageView.kf.setImage(with: url)
                }
            }
            cell.foodNameLabel.text = food.yemek_adi
            cell.foodPriceLabel.text = "\(food.yemek_fiyat!) ₺"
            cell.itemsProtocol = self
            cell.indexPath = indexPath
            return cell
        default:
            return UICollectionViewCell()
        }
    }
    
    // Add button product to basket
    func addButtonDataTransfer(indexPath: IndexPath) {
        let food = foodsList[indexPath.row]
        if let temp = lastOrderedFoodName, !(lastOrderedFoodName?.isEmpty ?? false) {
            if (food.yemek_adi != temp) {
                orderCount = 0
                self.lastOrderedFoodName = food.yemek_adi
            }
        }
        else {
            self.lastOrderedFoodName = food.yemek_adi
        }
        orderCount += 1
        homePresenterObjc?.order(food_name: food.yemek_adi!, food_image_name: food.yemek_resim_adi!, food_price: Int(food.yemek_fiyat!)!, food_order_count: orderCount, currentUser: currentUser!)
    }
    
    // Subtract button product to basket
    func subtractButtonDataTransfer(indexPath: IndexPath) {
        let food = foodsList[indexPath.row]
        print(food.yemek_id!)
    }
    
    
}

// CollectionView size settings
extension HomeVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
}

// Data transfer from BasketPresenter
extension HomeVC: PresenterToViewHomeProtocol {
    
    func dataTransferToView(foodsList: Array<Foods>) {
        self.foodsList = foodsList
        self.collectionViewProducts.reloadData()
    }
}

extension HomeVC: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//        filteredFoodList = foodsList.contains(
    }
}
