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
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(sharetapped))
        
        if let imageToload = selectImage{
            image.image = UIImage(named : imageToload)
        }
       
    }
    @objc func sharetapped(){
        print(selectImage!)
        guard let image = image.image?.jpegData(compressionQuality: 0.8) else{
            print("photo not found")
            return
        }
        let vc = UIActivityViewController(activityItems: [image,selectImage!], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc,animated: true     )
    }

   
}
