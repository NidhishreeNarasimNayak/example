//
//  CareersViewController.swift
//  ymlApp
//
//  Created by Nidhishree on 26/08/19.
//  Copyright © 2019 YML. All rights reserved.
//

import UIKit
import  AVKit
import AVFoundation
import HCVimeoVideoExtractor

class CareersViewController: BaseViewController {
    var viewModel = CareerViewModel()
    @IBOutlet weak var videoView: UIView!
    @IBOutlet weak var tableView: UITableView!
    var player: AVPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        debugPrint("Careers Tab called")
        viewModel.loadPositionsFromJson() { () -> Void in
            self.tableView.reloadData()
        }
        addGestureToVideo()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        viewModel.playVideo({(videoURL: URL) -> Void in
            self.player = AVPlayer(url: videoURL)
            let playerLayer = AVPlayerLayer(player: self.player)
            playerLayer.frame = self.videoView.frame
            self.view.layer.addSublayer(playerLayer)
            self.player.play()
        })
    }
    
    func addGestureToVideo(){
        videoView.backgroundColor = .white
        let playPauseTapGesture = UITapGestureRecognizer(target: self, action: #selector(playPauseVideo))
        videoView.addGestureRecognizer(playPauseTapGesture)
    }
    
    @objc func playPauseVideo(_ sender: UITapGestureRecognizer)
    {
        if player.rate != 0{
            player.pause()
        }
        else{
            player.play()
        }
    }
}

extension CareersViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.jsonItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: CareersTableViewCell.self)) as? CareersTableViewCell {
            //cell.contentView.backgroundColor = .yellow
            cell.domainLabel.text = viewModel.jsonItems[indexPath.row].domain
            cell.positionLabel.text  = viewModel.jsonItems[indexPath.row].position
            cell.locationLabel.text = viewModel.jsonItems[indexPath.row].location
            return cell
        }
        return CareersTableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
