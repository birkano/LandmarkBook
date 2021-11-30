//
//  imageViewController.swift
//  LandmarkBook
//
//  Created by Birkan Pusa on 30.11.2021.
//

import UIKit

class imageViewController: UIViewController {

    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var landmarkLabel: UILabel!
    
    var selectedLandmarkName = ""
    var selectedLandmarkImage = UIImage()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        landmarkLabel.text = selectedLandmarkName
        imageView.image = selectedLandmarkImage

    }
    



}
