//
//  CassiniViewController.swift
//  Cassini
//
//  Created by Ali Abbas Jaffri on 28/05/2016.
//  Copyright © 2016 Ali Abbas Jaffri. All rights reserved.
//

import UIKit

class CassiniViewController: UIViewController
{
    private struct StoryBoard
    {
        static let ImageSegue = "showImage"
    }
    
    private let imageLinks =
    [
        "Earth" : "http://www.nasa.gov/sites/default/files/wave_earth_mosaic_3.jpg",
        "Cassini" : "http://www.jpl.nasa.gov/images/cassini/20090202/pia03883-full.jpg" ,
        "Saturn" : "http://www.nasa.gov/sites/default/files/saturn_collage.jpg"
    ]
    
    // MARK: - Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        if segue.identifier == StoryBoard.ImageSegue
        {
            if let imageViewController = segue.destinationViewController.contentViewController as? ImageViewController
            {
                let imageName = (sender as? UIButton)?.currentTitle
                imageViewController.imageURL = NSURL(string:imageLinks[imageName!]!)
                imageViewController.title = imageName
            }
        }
    }
}
