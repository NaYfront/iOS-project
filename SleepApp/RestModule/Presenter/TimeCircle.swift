//
//  TimeCircle.swift
//  SleepApp
//
//  Created by Arslan Rashidov on 02.05.2022.
//

import UIKit

class TimeCircle: UIControl {

    var minimumValue: Float = 0

    var maximumValue: Float = 288

    var value: Float = 0
    
    var isContinuous = true
    
    private let renderer = TimeCircleRenderer()
    
    var restViewPresenter: RestViewPresenterProtocol!
    
    var lineWidth: CGFloat {
      get { return renderer.lineWidth }
      set { renderer.lineWidth = newValue }
    }

    var startAngle: CGFloat {
      get { return renderer.startAngle }
      set { renderer.startAngle = newValue }
    }

    var endAngle: CGFloat {
      get { return renderer.endAngle }
      set { renderer.endAngle = newValue }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    private func commonInit() {
        renderer.updateBounds(bounds)
        renderer.color = tintColor
        renderer.setPointerAngle(renderer.startAngle, animated: false)

        layer.addSublayer(renderer.trackLayer)
        layer.addSublayer(renderer.pointerLayer)
        
        let gestureRecognizer = RotationGestureRecognizer(target: self, action: #selector(TimeCircle.handleGesture(_:)))
        addGestureRecognizer(gestureRecognizer)
    }
    
    func setValue(_ newValue: Float, animated: Bool = false) {
        value = min(maximumValue, max(minimumValue, newValue))

        let angleRange = endAngle - startAngle
        let valueRange = maximumValue - minimumValue
        let angleValue = CGFloat(value - minimumValue) / CGFloat(valueRange) * angleRange + startAngle
        renderer.setPointerAngle(angleValue, animated: animated)
    }
    
    @objc private func handleGesture(_ gesture: RotationGestureRecognizer) {
        let midPointAngle = (2 * CGFloat(Double.pi) + startAngle - endAngle) / 2 + endAngle
        var boundedAngle = gesture.touchAngle
        if boundedAngle > midPointAngle {
            boundedAngle -= 2 * CGFloat(Double.pi)
        } else if boundedAngle < (midPointAngle - 2 * CGFloat(Double.pi)) {
            boundedAngle -= 2 * CGFloat(Double.pi)
        }
        
        boundedAngle = min(endAngle, max(startAngle, boundedAngle))

        let angleRange = endAngle - startAngle
        let valueRange = maximumValue - minimumValue
        let angleValue = Float(boundedAngle - startAngle) / Float(angleRange) * valueRange + minimumValue
        
        setValue(angleValue)
        restViewPresenter.changePreferableWakeTime(newValue: value)
    }
}

private class TimeCircleRenderer {
    var color: UIColor = UIColor.clear {
        didSet {
            trackLayer.strokeColor = UIColor.darkGray.cgColor
            pointerLayer.strokeColor = color.cgColor
        }
    }

    var lineWidth: CGFloat = 50 {
        didSet {
            trackLayer.lineWidth = lineWidth
            updateTrackLayerPath()
            updatePointerLayerPath()
        }
    }

    var startAngle: CGFloat = CGFloat(-Double.pi) {
        didSet {
            updateTrackLayerPath()
        }
    }

    var endAngle: CGFloat = CGFloat(Double.pi) {
        didSet {
            updateTrackLayerPath()
        }
    }

    private (set) var pointerAngle: CGFloat = CGFloat(-Double.pi) * 11 / 8

    func setPointerAngle(_ newPointerAngle: CGFloat, animated: Bool = false) {
        CATransaction.begin()
        CATransaction.setDisableActions(true)
        
        pointerLayer.transform = CATransform3DMakeRotation(newPointerAngle, 0, 0, 1)
        
        if animated {
          let midAngleValue = (max(newPointerAngle, pointerAngle) - min(newPointerAngle, pointerAngle)) / 2
            + min(newPointerAngle, pointerAngle)
          let animation = CAKeyframeAnimation(keyPath: "transform.rotation.z")
          animation.values = [pointerAngle, midAngleValue, newPointerAngle]
          animation.keyTimes = [0.0, 0.5, 1.0]
            animation.timingFunctions = [CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)]
          pointerLayer.add(animation, forKey: nil)
        }

        CATransaction.commit()

        pointerAngle = newPointerAngle
    }
    
    let trackLayer = CAShapeLayer()
    let pointerLayer = CAShapeLayer()
    
    init() {
        trackLayer.fillColor = UIColor.clear.cgColor
        pointerLayer.fillColor = UIColor.systemOrange.cgColor
    }
    
    private func updateTrackLayerPath() {
        let bounds = trackLayer.bounds
        let center = CGPoint(x: bounds.midX, y: bounds.midY)
        let offset = lineWidth / 2
        let radius = min(bounds.width, bounds.height) / 2 - offset
        
        let ring = UIBezierPath(arcCenter: center, radius: CGFloat(radius), startAngle: startAngle,
                              endAngle: endAngle, clockwise: true)
        
        trackLayer.path = ring.cgPath
    }

    private func updatePointerLayerPath() {
        let bounds = trackLayer.bounds
        let center = CGPoint(x: bounds.width - lineWidth / 2, y: bounds.midY)
        let radius = lineWidth / 2
      
        let pointer = UIBezierPath(arcCenter: center, radius: CGFloat(radius), startAngle: startAngle,
                                   endAngle: endAngle, clockwise: true)
        
        pointer.move(to: CGPoint(x: bounds.width - CGFloat(lineWidth) / 2, y: bounds.midY))
        
        pointerLayer.strokeColor = UIColor.clear.cgColor
        
        pointerLayer.path = pointer.cgPath
    }
    
    func updateBounds(_ bounds: CGRect) {
      trackLayer.bounds = bounds
      trackLayer.position = CGPoint(x: bounds.midX, y: bounds.midY)
      updateTrackLayerPath()

      pointerLayer.bounds = trackLayer.bounds
      pointerLayer.position = trackLayer.position
        
      updatePointerLayerPath()
    }
}

private class RotationGestureRecognizer: UIPanGestureRecognizer {
    private(set) var touchAngle: CGFloat = 0
    
    override init(target: Any?, action: Selector?) {
      super.init(target: target, action: action)

      maximumNumberOfTouches = 1
      minimumNumberOfTouches = 1
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent) {
      super.touchesBegan(touches, with: event)
      updateAngle(with: touches)
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent) {
      super.touchesMoved(touches, with: event)
      updateAngle(with: touches)
    }
    
    private func updateAngle(with touches: Set<UITouch>) {
      guard
        let touch = touches.first,
        let view = view
      else {
        return
      }
      let touchPoint = touch.location(in: view)
        
      touchAngle = angle(for: touchPoint, in: view)
    }

    private func angle(for point: CGPoint, in view: UIView) -> CGFloat {
      let centerOffset = CGPoint(x: point.x - view.bounds.midX, y: point.y - view.bounds.midY)
      return atan2(centerOffset.y, centerOffset.x)
    }
}
