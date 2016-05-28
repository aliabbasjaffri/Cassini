//
//  ImageViewController.swift
//  Cassini
//
//  Created by Ali Abbas Jaffri on 27/05/2016.
//  Copyright © 2016 Ali Abbas Jaffri. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController, UIScrollViewDelegate
{
    let stanford = "http://comm.stanford.edu/wp-content/uploads/2013/01/stanford-campus.png"
    
    
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    @IBOutlet weak var scrollView: UIScrollView!
    {
        didSet
        {
            scrollView?.contentSize = imageView.frame.size
            scrollView.delegate = self
            scrollView.minimumZoomScale = 0.25
            scrollView.maximumZoomScale = 2.5
        }
    }
    
    private var imageView = UIImageView()
    private var image : UIImage?
    {
        get
        {
            return imageView.image
        }
        set
        {
            imageView.image = newValue
            imageView.sizeToFit()
            scrollView?.contentSize = imageView.frame.size
            spinner?.stopAnimating()
        }
    }
    
    var imageURL : NSURL?
    {
        didSet
        {
            image = nil
            if view.window != nil
            {
                fetchImage()
            }
        }
    }
    
    private func fetchImage()
    {
        if let url = imageURL
        {
            spinner?.startAnimating()
            
            dispatch_async(dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0))
            {
                let contentsOfURL = NSData(contentsOfURL: url)
                
                dispatch_async(dispatch_get_main_queue())
                {
                    if url == self.imageURL
                    {
                        if let imageData = contentsOfURL
                        {
                            self.image = UIImage(data: imageData)
                        }
                        else
                        {
                            self.spinner?.stopAnimating()
                        }
                    }
                }
            }
        }
    }
    
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.addSubview(imageView)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        if image == nil
        {
            fetchImage()
        }
    }

}
