//
//  AboutUsViewController.swift
//  ymlApp
//
//  Created by Nidhishree on 29/08/19.
//  Copyright © 2019 YML. All rights reserved.
//

import UIKit

class AboutUsViewController: BaseViewController {
//    
//    @IBAction func rightArrowButton(_ sender: Any) {
//       collectionView.scrollToItem(at: i, at: <#T##UICollectionView.ScrollPosition#>, animated: <#T##Bool#>)
//    }
    @IBOutlet weak var collectionView: UICollectionView!
    
    let aboutType = AboutUsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
extension AboutUsViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return aboutType.acessImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: AboutUsCVCell.self), for: indexPath) as? AboutUsCVCell{
            cell.imageView.image = UIImage(named: aboutType.acessImages[indexPath.row].image)
            collectionView.scrollToItem(at: indexPath, at: .right, animated: true)
            return cell
        }
    
    return UICollectionViewCell()
    
}
}
