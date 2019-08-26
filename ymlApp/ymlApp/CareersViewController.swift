//
//  CareersViewController.swift
//  ymlApp
//
//  Created by Nidhishree on 26/08/19.
//  Copyright © 2019 YML. All rights reserved.
//

import UIKit
import  AVKit
import HCVimeoVideoExtractor
class CareersViewController: UIViewController {
    
    @IBOutlet weak var videoView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewDidAppear(_ animated: Bool) {
        guard let videoURL = URL(string: "https://player.vimeo.com/video/274575267")
                   else {
                       return
               }
        
        HCVimeoVideoExtractor.fetchVideoURLFrom(url: videoURL, completion: { ( video:HCVimeoVideo?, error:Error?) -> Void in
            if let err = error {
                print("Error = \(err.localizedDescription)")
                return
            }
            guard let vid = video else {
                print("Invalid video object")
                return
            }
            print("Title = \(vid.title), url = \(vid.videoURL), thumbnail = \(vid.thumbnailURL)")
            if let videoURL = vid.videoURL[.Quality540p] {
                let player = AVPlayer(url: videoURL)
                let playerLayer = AVPlayerLayer(player: player)
                playerLayer.frame = self.videoView.frame
                self.view.layer.addSublayer(playerLayer)
                player.play()
              
            }
        })
}

}
extension CareersViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: CareersTableViewCell.self)) as? CareersTableViewCell {
            return cell
        }
        return CareersTableViewCell()
    }
    
    
}
