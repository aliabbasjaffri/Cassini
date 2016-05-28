//
//  extensionUIViewController.swift
//  Cassini
//
//  Created by Ali Abbas Jaffri on 28/05/2016.
//  Copyright © 2016 Ali Abbas Jaffri. All rights reserved.
//

import UIKit


extension UIViewController
{
    var contentViewController : UIViewController
    {
        if let navigationController = self as? UINavigationController
        {
            return navigationController.visibleViewController ?? self
        }
        else
        {
            return self
        }
    }
}

