//
//  FavCollectionViewCell.swift
//  Final_iOS1Course
//
//  Created by Kalbek Saduakassov on 04.03.2021.
//

import UIKit

protocol DeleteItemDelegate {
    func deleteItem(_ data: String)
}

class FavCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    
    var delegate: DeleteItemDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func deleteTapped(_ sender: Any) {
        delegate?.deleteItem(titleLabel.text!)
    }
}
