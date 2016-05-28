//
//  ImageViewController.swift
//  Cassini
//
//  Created by Ali Abbas Jaffri on 27/05/2016.
//  Copyright © 2016 Ali Abbas Jaffri. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController
{
    let stanford = "http://comm.stanford.edu/wp-content/uploads/2013/01/stanford-campus.png"
    
    @IBOutlet weak var scrollView: UIScrollView!
    {
        didSet
        {
            scrollView?.contentSize = imageView.frame.size
        }
    }
    
    private var imageView = UIImageView()
    private var image : UIImage?
    {
        get
        {
            return imageView.image!
        }
        set
        {
            imageView.image = newValue
            imageView.sizeToFit()
            scrollView?.contentSize = imageView.frame.size
        }
    }
    
    var imageURL : NSURL?
    {
        didSet
        {
            image = nil
            fetchImage()
        }
    }
    
    private func fetchImage()
    {
        if let url = imageURL
        {
            if let imageData = NSData(contentsOfURL: url)
            {
                image = UIImage(data: imageData)
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.addSubview(imageView)
    }

}
