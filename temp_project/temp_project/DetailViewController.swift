//
//  DetailViewController.swift
//  temp_project
//
//  Created by anshul on 02/04/24.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var image: UIImageView!
    var selectImage:String? //hold the name of image to load
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = selectImage
        navigationItem.largeTitleDisplayMode = .never
        if let imageToload = selectImage{
            image.image = UIImage(named : imageToload)
        }
       
    }
    

   
}
