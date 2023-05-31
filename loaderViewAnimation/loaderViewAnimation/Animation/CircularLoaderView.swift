//
//  CircularLoaderView.swift
//  loaderViewAnimation
//
//  Created by Максим Нурутдинов on 31.05.2023.
//

import UIKit

class CircularLoaderView: UIView {
    
    let сircularPathLayer = CAShapeLayer()
    let сircularRadius: CGFloat = 20
    
    var  progress: CGFloat {
        get {
            сircularPathLayer.strokeEnd
        }
        set {
            if newValue > 1 {
                сircularPathLayer.strokeEnd = 1
                
            } else if newValue < 0 {
                сircularPathLayer.strokeEnd = 0
            } else {
                сircularPathLayer.strokeEnd = newValue
            }
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        сircularPathLayer.frame = bounds
        сircularPathLayer.path = сircularPath().cgPath
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        progress = 0
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        сircularPathLayer.frame = bounds
        сircularPathLayer.lineWidth = 2
        сircularPathLayer.fillColor = UIColor.clear.cgColor
        сircularPathLayer.strokeColor = UIColor.orange.cgColor
        layer.addSublayer(сircularPathLayer)
    }
    
    func circularFrame() -> CGRect {
        var circularFrame = CGRect(x: 0, y: 0, width: 2 * сircularRadius, height: 2 * сircularRadius)
        
        let сircularPathBounds = сircularPathLayer.bounds
        circularFrame.origin.x = сircularPathBounds.midX - circularFrame.midX
        circularFrame.origin.y = сircularPathBounds.midY - circularFrame.midY
        return circularFrame
    }
    
    func сircularPath() -> UIBezierPath {
        UIBezierPath(ovalIn: circularFrame())
    }
}
