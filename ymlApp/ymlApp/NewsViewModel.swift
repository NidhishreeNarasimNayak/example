//
//  NewsViewModel.swift
//  ymlApp
//
//  Created by Nidhishree on 26/08/19.
//  Copyright © 2019 YML. All rights reserved.
//

import Foundation

enum NewsView {
    case featured
    case design
    case ebooks
}
class NewsViewModel {
    
      var news: [NewsModel] = []
    
    func getFeatured() -> [NewsModel]{
       // var featured : [News] = [] //data source
        let adam = NewsModel(image: "featured1", category: "AGENCY / CULTURE / UNDEFINED / UNCATEGORIZED", description: "Getting to Know: Adam Talcott – Software Engineering Manager at YML", url: "https://ymedialabs.com/getting-to-know-adam-talcott")
        let oneway = NewsModel(image: "featured2", category: "Customer Experience", description: "Stuck in the “Paradox of Choice”? Use Recommendations to Build Better CX", url: "https://ymedialabs.com/recommendations-improve-customer-experience")
        let cfo = NewsModel(image: "featured3", category: "Agency / Culture / undefined", description: "Getting to Know Hamish Macphail — Chief Financial Officer at Y Media Labs", url: "https://ymedialabs.com/getting-to-know-hamish-macphail-chief-financial-officer-at-y-media-labs")
//        featured.append(adam)
//        featured.append(oneway)
//        featured.append(cfo)
        news = [adam,oneway,cfo]
        return news
    }
    
    func getDesign() -> [NewsModel]{
        //var designs : [NewsModel] = []
        let mcd = NewsModel(image: "design1", category: "Agency / Culture / Design / Leadership / Technology", description: "We Are People: What it Means to Have a People-First Approach", url: "https://ymedialabs.com/we-are-people-what-it-means-to-have-a-people-first-approach")
        let ux = NewsModel(image: "design2", category: "Design / Technology", description: "Speaking the Same Language: How UX and Data Strategy Can Work Together to Design for Voice-Based AI", url: "https://ymedialabs.com/recommendations-improve-customer-experience")
//        designs.append(mcd)
//        designs.append(ux)
        news = [mcd,ux]
        return news
    }
    
    func getEbooks() -> [NewsModel]{
        //var ebooks : [NewsModel] = []
        let chatbots = NewsModel(image: "ebook1", category: "Ebooks", description: "Chatbots in the Banking Industry – Discussing a More Efficient Future", url: "https://ymedialabs.com/chatbots-banking-industry-white-paper")
        let app = NewsModel(image: "ebook2", category: "Ebooks", description: "How to Choose Wisely Between a Native and a Hybrid Application", url: "https://ymedialabs.com/native-hybrid-application-ebook")
//        ebooks.append(chatbots)
//        ebooks.append(app)
        news = [ chatbots,app]
        return news
    }
  //  switch 
    
}

