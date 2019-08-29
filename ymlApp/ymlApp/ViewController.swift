//
//  ViewController.swift
//  ymlApp
//
//  Created by Nidhishree on 14/08/19.
//  Copyright © 2019 YML. All rights reserved.
//

import UIKit

class ViewController: BaseViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var homeScreenPageControl: UIPageControl!
    
    var mainType = MainScreenViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.isPagingEnabled = true
        
        mainType.homeScreenObjects()
        configurePageControl()
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UIScrollViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return mainType.mainScreen.count   //to return number of cells
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: CollectionViewCell.self), for: indexPath) as? CollectionViewCell { // to specify how each cell is designed
        let element = mainType.mainScreen[indexPath.row]
        
        cell.homeScreenImageView.image = UIImage(named: element.imagename)
        
        cell.homeScreenHeaderLabel.text = element.headerTitle
        //cell?.homeScreenHeaderLabel.font = UIFont.boldSystemFont(ofSize: 25.0)
        cell.homeScreenDescriptionLabel.text = element.descriptionLabel
        cell.homeScreenDescriptionLabel.font = UIFont.systemFont(ofSize: 20.0)
        cell.homeScreenLogoLabel.image = UIImage(named: element.logoLabel)
            return cell
    }
        return UICollectionViewCell()
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.bounds.size // to return cell  size as same as CV
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pagenumber = scrollView.contentOffset.x/scrollView.frame.width
        homeScreenPageControl.currentPage = Int(pagenumber)
    }
    //to set the attributes for page control
    func configurePageControl() {
        homeScreenPageControl.numberOfPages = mainType.mainScreen.count
        homeScreenPageControl.currentPage = 0
        homeScreenPageControl.currentPageIndicatorTintColor = UIColor.gray
        homeScreenPageControl.pageIndicatorTintColor = UIColor.black
    }
}
