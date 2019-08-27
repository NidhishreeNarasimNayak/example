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
        
        switch newsSegmentControl.selectedSegmentIndex {
        case 0: newsType.news = newsType.getFeatured()
       
        case 1: newsType.news = newsType.getDesign()
        
        case 2: newsType.news = newsType.getEbooks()
        
        default:
            break
        }
         newsTableView.reloadData()
    }
}

extension NewsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsType.news.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "newsCell", for: indexPath) as? NewsTableViewCell
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


//new
//model
//class News
//{
//    let image: String
//    let category: String
//    let description: String
//    let url: String
//    init(image: String, category: String, description: String, url: String) {
//        self.image = image
//        self.category = category
//        self.description = description
//        self.url = url
//    }
//    func getImage() -> String{
//        return image
//    }
//    func getCategory() -> String{
//        return category
//    }
//    func getDescription() -> String{
//        return description
//    }
//    func getUrl() -> String{
//        return url
//    }
    //view model
//     func getFeatured() -> [News]{
//        var featured : [News] = []
//        let adam = News(image: "featured1", category: "AGENCY / CULTURE / UNDEFINED / UNCATEGORIZED", description: "Getting to Know: Adam Talcott – Software Engineering Manager at YML", url: "https://ymedialabs.com/getting-to-know-adam-talcott")
//        let oneway = News(image: "featured2", category: "Customer Experience", description: "Stuck in the “Paradox of Choice”? Use Recommendations to Build Better CX", url: "https://ymedialabs.com/recommendations-improve-customer-experience")
//        let cfo = News(image: "featured3", category: "Agency / Culture / undefined", description: "Getting to Know Hamish Macphail — Chief Financial Officer at Y Media Labs", url: "https://ymedialabs.com/getting-to-know-hamish-macphail-chief-financial-officer-at-y-media-labs")
//        featured.append(adam)
//        featured.append(oneway)
//        featured.append(cfo)
//        return featured
//    }
//     func getDesign() -> [News]{
//        var designs : [News] = []
//        let mcd = News(image: "design1", category: "Agency / Culture / Design / Leadership / Technology", description: "We Are People: What it Means to Have a People-First Approach", url: "https://ymedialabs.com/we-are-people-what-it-means-to-have-a-people-first-approach")
//        let ux = News(image: "design2", category: "Design / Technology", description: "Speaking the Same Language: How UX and Data Strategy Can Work Together to Design for Voice-Based AI", url: "https://ymedialabs.com/recommendations-improve-customer-experience")
//        designs.append(mcd)
//        designs.append(ux)
//        return designs
//    }
//     func getEbooks() -> [News]{
//        var ebooks : [News] = []
//        let chatbots = News(image: "ebooks1", category: "Ebooks", description: "Chatbots in the Banking Industry – Discussing a More Efficient Future", url: "https://ymedialabs.com/chatbots-banking-industry-white-paper")
//        let app = News(image: "ebook2", category: "Ebooks", description: "How to Choose Wisely Between a Native and a Hybrid Application", url: "https://ymedialabs.com/native-hybrid-application-ebook")
//        ebooks.append(chatbots)
//        ebooks.append(app)
//        return ebooks
//    }
//}


