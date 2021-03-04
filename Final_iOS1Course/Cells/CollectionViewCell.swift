//
//  CollectionViewCell.swift
//  Final_iOS1Course
//
//  Created by Kalbek Saduakassov on 04.03.2021.
//

import UIKit

protocol AddItemDelegate {
    func addItem(_ data: String)
}

class CollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    
    public var delegate: AddItemDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
//        self.delegate = self
        // Initialization code
    }

    @IBAction func addItem(_ sender: Any) {
        print("addTapped")
        delegate?.addItem(titleLabel.text!)
        
    }
}
