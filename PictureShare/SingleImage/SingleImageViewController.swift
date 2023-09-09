//
//  ImageViewController.swift
//  PictureShare
//
//  Created by Alexandr on 07.09.2023.
//

import UIKit

class SingleImageViewController: UIViewController {
    
    var image: UIImage! {
        didSet {
            guard isViewLoaded else { return }
            imageView.image = image
        }
    }
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = image
    }

}
