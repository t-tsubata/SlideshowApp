//
//  ZoomViewController.swift
//  SlideshowApp
//
//  Created by 津端 俊尚 on 2022/04/14.
//

import UIKit

class ZoomViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    var image:UIImage?
    
    /// <#Description#>
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        imageView.image = image
    }
}
