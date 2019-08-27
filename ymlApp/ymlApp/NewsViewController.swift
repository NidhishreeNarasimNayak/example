//
//  NewsViewController.swift
//  ymlApp
//
//  Created by Nidhishree on 23/08/19.
//  Copyright © 2019 YML. All rights reserved.
//

import UIKit

class NewsViewController: UIViewController {
    
    @IBOutlet weak var newsTableView: UITableView!
    @IBOutlet weak var newsSegmentControl: UISegmentedControl!
    
    let newsType = NewsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newsType.news = newsType.getFeatured()
    }
    
    @IBAction func indexChanged(_ sender: Any) {

        newsType.segmentAction(select: newsSegmentControl.selectedSegmentIndex)
         newsTableView.reloadData()
    }
}

extension NewsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsType.news.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "newsCell", for: indexPath) as? NewsTableViewCell
        cell?.selectionStyle = .none
        let element = newsType.news[indexPath.row]
        cell?.newsScreenImageView.image = UIImage(named: element.image)
        cell?.newsScreenTitleLabel.text = element.category
        cell?.newsScreenDescriptionLabel.text = element.description
        return cell ?? UITableViewCell()
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return   UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let newWebViewVC = self.storyboard?.instantiateViewController(withIdentifier: String(describing: WorkWebViewViewController.self)) as? WorkWebViewViewController
        {
            newWebViewVC.url = URL(string: newsType.news[indexPath.row].url)
            self.navigationController?.pushViewController(newWebViewVC, animated: true)
        }
    }
}





