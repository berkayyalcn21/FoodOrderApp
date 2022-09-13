//
//  BasketVC.swift
//  YemekSiparisApp
//
//  Created by Berkay on 7.09.2022.
//

import UIKit

struct ItemsList {
    var urunAdi: String?
    var yemek_siparis_adet: Int?
}

class BasketVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var priceLabel: UILabel!
    var foods = [Cart]()
    var basketPresenterObjc: ViewToPresenterBasketProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        BasketRouter.createModule(ref: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        basketPresenterObjc?.fethFoods()
    }

    @IBAction func confirmCartButtonTapped(_ sender: Any) {
        let alert = UIAlertController(title: nil, message: "Siparişiniz alınmıştır", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Tamam", style: .default))
        present(alert, animated: true)
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        dismiss(animated: true)
    }
}


extension BasketVC: UITableViewDelegate {
    
}

extension BasketVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        foods.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let food = foods[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        cell.foodLabel.text = food.yemek_adi
        cell.pieceLabel.text = String(food.yemek_siparis_adet!)
        return cell
    }
    
}

extension BasketVC: PresenterToViewBasketProtocol {
    
    func dataTransferToView(foodsList: Array<Cart>) {
//        var itemsToDisplay = [ItemsList]()
//        for element in foodsList {
//            let itemCount = foodsList.filter({ $0.yemek_adi })
//            itemsToDisplay.append(ItemsList(urunAdi: element.yemek_adi, yemek_siparis_adet: itemCount))
//            foodsList.removeAll { !$0.yemek_adi.contains(element.yemek_adi) }
//        }
        
        self.foods = foodsList
        tableView.reloadData()
    }
}
