//
//  ZoomViewController.swift
//  SlideshowApp
//
//  Created by 津端 俊尚 on 2022/04/14.
//

import UIKit

class ZoomViewController: UIViewController {
    @IBOutlet weak var image: UIImageView!
    var imageIndex:Int = 0
    let images = [UIImage(named: "spring.jpg"), UIImage(named: "summer.jpg"), UIImage(named: "autumn.jpg"), UIImage(named: "winter.jpg")]
    
    /// <#Description#>
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        // 上記では、x, y を 0 と宣言していたが、
        // 1画面目のViewControllerから遷移するときにprepareForSegueで
        // x, yの値を新たに代入されたので両方共 1 が入っている
        image.image = images[imageIndex]
    }
}
