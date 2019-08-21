//
//  ViewController.swift
//  ymlApp
//
//  Created by Nidhishree on 14/08/19.
//  Copyright © 2019 YML. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var homeScreenPageControl: UIPageControl!
    var imagenames: [String] = ["Image-0","Image-1","Image-2","Image-3"]
    var headerTitle: [String] = ["State Farm","The Home Depot","PayPal","Molekule"]
    var DescriptionLabel: [String] = ["All things insurance, all things banking, all in one app.","The ultimate power tool: A best-in-class digital experience for The Home Depot.","Payment giant goes mobile-by-design.","The world's first intelligent air purifier, & the app putting clean air in people's hands." ]
    var logoLabel: [String] = ["Logo-0","Logo-1","Logo-2","Logo-3"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.isPagingEnabled = true
        
        }
    
    
    
    }

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UIScrollViewDelegate {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
               return headerTitle.count    //to return number of cells
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellReuse", for: indexPath) as? CollectionViewCell // to specify how each cell is designed
        //        cell?.homeScreenImageView.image = UIImage(named: "Image-\(indexPath.row)")
        cell?.homeScreenImageView.image = UIImage(named: imagenames[indexPath.row])
        cell?.homeScreenHeaderLabel.text = headerTitle[indexPath.row]
        cell?.homeScreenHeaderLabel.font = UIFont.boldSystemFont(ofSize: 25.0)
        cell?.homeScreenDescriptionLabel.text = DescriptionLabel[indexPath.row]
        cell?.homeScreenDescriptionLabel.font = UIFont.systemFont(ofSize: 20.0)
        cell?.homeScreenLogoLabel.image = UIImage(named: logoLabel[indexPath.row])
        return cell ?? UICollectionViewCell()
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.bounds.size // to return cell  size as same as CV
    }

    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pagenumber = scrollView.contentOffset.x/scrollView.frame.width
        homeScreenPageControl.currentPage = Int(pagenumber)
       }
    
    
}
