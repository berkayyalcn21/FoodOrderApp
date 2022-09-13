//
//  BasketVC.swift
//  YemekSiparisApp
//
//  Created by Berkay on 7.09.2022.
//

import UIKit

class ItemsList {
    
    var foodName: String?
    var foodOrderCount: Int?
    var food_id: [String]?
    
    init(foodName: String, foodOrderCount: Int, food_id: [String]) {
        self.foodName = foodName
        self.foodOrderCount = foodOrderCount
        self.food_id = food_id
    }
}

class BasketVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var priceLabel: UILabel!
    var foods = [ItemsList]()
    var basketPresenterObjc: ViewToPresenterBasketProtocol?
    var filteredFoodArray = [ItemsList]()
    
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
        cell.foodLabel.text = food.foodName
        cell.pieceLabel.text = String(food.foodOrderCount!)
        return cell
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Sil") { contexttualAction, view, bool in
            let food = self.foods[indexPath.row]
            if let foodId = food.food_id {
                for i in foodId {
                    self.basketPresenterObjc?.deleteFood(food_id: i)
                }
            }
        }
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
    
}

extension BasketVC: PresenterToViewBasketProtocol {
    
    func dataTransferToView(foodsList: Array<Cart>) {

        var uniqueSepet = Set<String>()
        var filteredArray = [ItemsList]()
        
        for food in foodsList {
            uniqueSepet.insert(food.yemek_adi!)
        }
        
        for uniqueName in uniqueSepet {
            let sameNames = foodsList.filter {
                $0.yemek_adi == uniqueName
            }
            var total = 0
            var newFoodId: [String] = []
            for food in sameNames {
                total += Int(food.yemek_siparis_adet!)!
                newFoodId.append(food.sepet_yemek_id!)
            }
            filteredArray.append(ItemsList(foodName: uniqueName, foodOrderCount: total, food_id: newFoodId))
            self.foods = filteredArray
        }

        tableView.reloadData()
    }
}
