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
    
    var allElements: [homeScreenElements] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.isPagingEnabled = true
        homeScreenObjects()
        configurePageControl()
    }
    
    func homeScreenObjects() {
        let hello = homeScreenElements(imagename: "", headerTitle: "Hello.", descriptionLabel: "We are a design and innovation agency, creating digital products and experiences that have a lasting impact.", logoLabel: "")
        let stateFarm = homeScreenElements(imagename: "Image-0", headerTitle: "State Farm", descriptionLabel: "All things insurance, all things banking, all in one app.", logoLabel: "Logo-0")
        let theHomeDepot = homeScreenElements(imagename: "Image-1", headerTitle: "The Home Depot", descriptionLabel: "The ultimate power tool: A best-in-class digital experience for The Home Depot.", logoLabel: "Logo-1")
        let payPal = homeScreenElements(imagename: "Image-2", headerTitle: "PayPal", descriptionLabel: "Payment giant goes mobile-by-design.", logoLabel: "Logo-2")
        let molekule = homeScreenElements(imagename: "Image-3", headerTitle: "Molekule", descriptionLabel:"The world's first intelligent air purifier, & the app putting clean air in people's hands.", logoLabel: "Logo-3")
        allElements.append(hello)
        allElements.append(stateFarm)
        allElements.append(theHomeDepot)
        allElements.append(payPal)
        allElements.append(molekule)
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UIScrollViewDelegate {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return allElements.count   //to return number of cells
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellReuse", for: indexPath) as? CollectionViewCell // to specify how each cell is designed
        let element = allElements[indexPath.row]
        
        cell?.homeScreenImageView.image = UIImage(named: element.imagename)
        
        cell?.homeScreenHeaderLabel.text = element.headerTitle
        cell?.homeScreenHeaderLabel.font = UIFont.boldSystemFont(ofSize: 25.0)
        cell?.homeScreenDescriptionLabel.text = element.descriptionLabel
        cell?.homeScreenDescriptionLabel.font = UIFont.systemFont(ofSize: 20.0)
        cell?.homeScreenLogoLabel.image = UIImage(named: element.logoLabel)
        return cell ?? UICollectionViewCell()
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
        homeScreenPageControl.numberOfPages = allElements.count
        homeScreenPageControl.currentPage = 0
        homeScreenPageControl.currentPageIndicatorTintColor = UIColor.gray
        homeScreenPageControl.pageIndicatorTintColor = UIColor.black
        
    }
    
    
}
struct  homeScreenElements {
    let imagename: String
    let headerTitle: String
    let descriptionLabel: String
    let logoLabel: String
}
