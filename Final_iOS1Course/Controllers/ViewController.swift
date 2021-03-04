//
//  ViewController.swift
//  Final_iOS1Course
//
//  Created by Kalbek Saduakassov on 04.03.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    var items = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        someStuffWithCollectionVC()
        configureUI()
    }
    
    fileprivate func someStuffWithCollectionVC() {
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        let nib = UINib(nibName: "CollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "Cell")
    }
    
    fileprivate func configureUI() {
        for i in 1..<10 {
            items.append("\(i)")
        }
    }
    
    @IBAction func open(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "secondVC") as! SecondViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    

}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
        cell.titleLabel.text = "\(items[indexPath.row])"
        cell.delegate = self
        return cell
    }
    
    
}

extension ViewController: AddItemDelegate {
    func addItem(_ data: String) {
        print("addItem is called")
        let alert = UIAlertController(title: "You have successfully added the item", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default) { _ in
            SecondViewController.items.append(data)
        }
        alert.addAction(action)
        present(alert, animated: true)
       
    }
    
    
}

