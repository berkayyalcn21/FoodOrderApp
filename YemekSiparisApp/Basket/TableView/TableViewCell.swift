//
//  TableViewCell.swift
//  YemekSiparisApp
//
//  Created by Berkay on 10.09.2022.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var pieceLabel: UILabel!
    @IBOutlet weak var foodLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }

}
