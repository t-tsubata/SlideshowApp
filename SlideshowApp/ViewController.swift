//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 津端 俊尚 on 2022/04/12.
//

import UIKit

final class ViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var playStopButton: UIButton!
    var imageIndex = 0
    var timer: Timer!
    let images = [UIImage(named: "spring.jpg"), UIImage(named: "summer.jpg"), UIImage(named: "autumn.jpg"), UIImage(named: "winter.jpg")]
    
    /// <#Description#>
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imageView.image = images[0]
    }
    
    /// <#Description#>
    /// - Parameter sender: <#sender description#>
    @IBAction func nextImage(_ sender: UIButton) {
        imageIndex += 1

        if imageIndex > images.count - 1 {
            imageIndex = 0
        }

        imageView.image = images[imageIndex]
    }
    
    /// <#Description#>
    /// - Parameter sender: <#sender description#>
    @IBAction func backImage(_ sender: UIButton) {
        imageIndex -= 1

        if 0 > imageIndex {
            imageIndex = images.count - 1
        }

        imageView.image = images[imageIndex]
    }
    
    /// <#Description#>
    /// - Parameter sender: <#sender description#>
    @IBAction func slideShowButton(_ sender: UIButton) {
        if (timer == nil) {
            timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(nextImage(_:)), userInfo: nil, repeats: true)
            playStopButton.setTitle("停止", for:.normal)
            nextButton.isEnabled = false
            backButton.isEnabled = false
        } else {
            timer.invalidate()
            timer = nil
            playStopButton.setTitle("再生", for:.normal)
            nextButton.isEnabled = true
            backButton.isEnabled = true
        }
    }
    
    /// <#Description#>
    /// - Parameters:
    ///   - segue: <#segue description#>
    ///   - sender: <#sender description#>
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let zoomViewController:ZoomViewController = segue.destination as! ZoomViewController
        zoomViewController.image = images[imageIndex]
    }
    
    /// <#Description#>
    /// - Parameter sender: <#sender description#>
    @IBAction func tapAction(_ sender: Any) {
        if timer != nil {
            timer.invalidate()
            timer = nil
        }
        playStopButton.setTitle("再生", for:.normal)
        nextButton.isEnabled = true
        backButton.isEnabled = true
        
        performSegue(withIdentifier: "result", sender: nil)
        
    }
    
    /// <#Description#>
    /// - Parameter segue: <#segue description#>
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
    }
}
