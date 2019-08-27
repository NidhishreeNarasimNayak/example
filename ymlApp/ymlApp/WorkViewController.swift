//
//  WorkViewController.swift
//  ymlApp
//
//  Created by Nidhishree on 21/08/19.
//  Copyright © 2019 YML. All rights reserved.
//

import UIKit

class WorkViewController: UIViewController {
    
    @IBOutlet weak var workTableView: UITableView!
    var workType = WorkViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        workType.workScreen = workType.workScreenObjects()
    }
}

extension WorkViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return workType.workScreen.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "workCell", for: indexPath) as? WorkTableViewCell
        let element = workType.workScreen[indexPath.row]
        cell?.workScreenImage.image = UIImage(named: element.imagename)
        cell?.workScreenTitle.text = element.headertitle
        cell?.workScreenDescription.text = element.description
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let transitionToVc = self.storyboard?.instantiateViewController(withIdentifier: "WorkWebViewViewController") as! WorkWebViewViewController
        transitionToVc.url = URL(string: workType.workScreen[indexPath.row].url)
        self.navigationController?.pushViewController(transitionToVc, animated: true)
    }
}

