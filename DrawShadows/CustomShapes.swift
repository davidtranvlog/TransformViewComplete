//
//  CustomShapes.swift
//  DrawShadows
//
//  Created by Duc Tran on 5/31/15.
//  Copyright (c) 2015 Developer Inspirus. All rights reserved.
//

import UIKit

class CustomShapes: UIView
{

    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
        
        drawRectOne()
        drawRectWithoutShadow()
    }
    
    func drawRectOne()
    {
        let currentContext = UIGraphicsGetCurrentContext()
        
        CGContextSaveGState(currentContext)
        
        let offset = CGSizeMake(10, 2)
        
        CGContextSetShadowWithColor(currentContext, offset, 10, UIColor.grayColor().CGColor)
        
        let path = CGPathCreateMutable()
        let rect = CGRect(x: 55, y: 60, width: 150, height: 150)
        
        // Trasform view
        var shiftDown = CGAffineTransformMakeTranslation(100, 0)
        var decreaseSize = CGAffineTransformMakeScale(0.5, 0.5)
        
        let degree = CGFloat((45.0 * M_PI) / 180.0)
        var rotate = CGAffineTransformMakeRotation(degree)
        
        CGPathAddRect(path, &rotate, rect)
        
        CGContextAddPath(currentContext, path)
        
        UIColor(red: 0.20, green: 0.60, blue: 0.80, alpha: 1.0).setFill()
        
        CGContextDrawPath(currentContext, kCGPathFill)
        
        CGContextRestoreGState(currentContext)
    }
    
    func drawRectWithoutShadow()
    {
        let currentContext = UIGraphicsGetCurrentContext()
        
        let path = CGPathCreateMutable()
        let rect = CGRect(x: 150, y: 250, width: 100, height: 100)
        
        CGPathAddRect(path, nil, rect)
        CGContextAddPath(currentContext, path)
        
        UIColor.purpleColor().setFill()
        
        CGContextDrawPath(currentContext, kCGPathFill)
    }

}




































