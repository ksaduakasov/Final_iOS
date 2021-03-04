//
//  SecondViewController.swift
//  Final_iOS1Course
//
//  Created by Kalbek Saduakassov on 04.03.2021.
//

import UIKit

class SecondViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    static var items = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        someStuffWithCollectionVC()
    }
    
    fileprivate func someStuffWithCollectionVC() {
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        let nib = UINib(nibName: "FavCollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "FavCell")
    }
    
}

extension SecondViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return SecondViewController.items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FavCell", for: indexPath) as! FavCollectionViewCell
        cell.titleLabel.text = SecondViewController.items[indexPath.row]
        cell.delegate = self
        return cell
    }
    
    
}

extension SecondViewController: DeleteItemDelegate {
    func deleteItem(_ data: String) {
        let alert = UIAlertController(title: "You are going to delete the item # \(data)", message: "Are you sure?", preferredStyle: .alert)
        let action1 = UIAlertAction(title: "No", style: .default) { _ in
            self.dismiss(animated: true, completion: nil)
        }
        let action2 = UIAlertAction(title: "Yes", style: .default) { _ in
            let index = SecondViewController.items.firstIndex(of: data)
            SecondViewController.items.remove(at: index!)
            self.collectionView.reloadData()
        }
        alert.addAction(action1)
        alert.addAction(action2)
        present(alert, animated: true)
        
    }
    
    
}









