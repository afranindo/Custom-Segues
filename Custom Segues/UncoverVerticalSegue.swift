//
//  UncoverVerticalSegue.swift
//  Custom Segues
//
//  Created by Armand Grillet on 15/08/2014.
//  Copyright (c) 2014 Armand Grillet. All rights reserved.
//

import UIKit
@objc(UncoverVerticalSegue)

class UncoverVerticalSegue: UIStoryboardSegue {
    override func perform() {
        var sourceViewController = self.sourceViewController as UIViewController!
        var destinationViewController = self.destinationViewController as UIViewController!
        
        sourceViewController.presentViewController(destinationViewController, animated: false, completion: {
            destinationViewController.view.addSubview(sourceViewController.view) // We add the old view (Bottom) above the new one (Top), it looks like nothing changed.
            
            UIView.animateWithDuration(0.33, delay: 0.0, options: UIViewAnimationOptions.CurveEaseOut, animations: { () -> Void in
                /* This is the block affected by the animation.
                Duration: 0,33s
                Options: Ease-Out speed curve.
                */
                sourceViewController.view.transform = CGAffineTransformMakeTranslation(0, sourceViewController.view.frame.size.height) // We slide the old view at the bottom of the screen
                }) { (finished: Bool) -> Void in
                    // The animation is finished, we removed the old view.
                    sourceViewController.view.removeFromSuperview()
            }
        })
    }
}