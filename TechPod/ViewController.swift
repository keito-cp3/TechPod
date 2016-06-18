//
//  ViewController.swift
//  TechPod
//
//  Created by 松井恵人 on 2016/06/11.
//  Copyright © 2016年 松井恵人. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var table: UITableView!
    
    var songNameArray = [String]()
    
    var fileNameArray = [String]()
    
    var imageNameArray = [String]()
    
    var audioPlayer: AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // テーブルビューのデータソースメソッドはViewControllerクラスに書くよという設定
        table.dataSource = self
        
        songNameArray = ["カノン","エリーゼのために","G線上のエリア"]
        
        table.delegate = self
        
        fileNameArray = ["cannon","elise","aria"]
        
        imageNameArray = ["Pachelbel.jpg","Beethoven.jpg","Bach.jpg"]
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // セルの数を指定
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songNameArray.count
    }
    // ID付きのセルを取得してセル付属のtableLabelに「テスト」と表示
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell")! as UITableViewCell
        
        cell.textLabel?.text = songNameArray[indexPath.row]
        
        cell.imageView?.image = UIImage(named: imageNameArray[indexPath.row])
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let audioPath = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource(fileNameArray[indexPath.row], ofType: "mp3")!)
        do {
            try self.audioPlayer = AVAudioPlayer(contentsOfURL: audioPath, fileTypeHint:nil)
        }  catch let err as NSError {
            print("\(err.debugDescription)")
        }
        audioPlayer.prepareToPlay()
        audioPlayer.play()
        
        
        
        
        
    }


}

