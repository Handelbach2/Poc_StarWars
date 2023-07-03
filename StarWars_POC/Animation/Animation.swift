//
//  Animation.swift
//  StarWars_POC
//
//  Created by Fabian Labra on 03/07/23.
//

import UIKit


extension UIViewController {
        
    func generateStars() {
            let starCount = 200 // Cantidad de estrellas que deseas generar
            
            for _ in 0..<starCount {
                let starSize = CGFloat.random(in: 1...3) // Tamaño aleatorio de la estrella
                let starView = StarView(frame: CGRect(x: CGFloat.random(in: 0...view.bounds.width),
                                                      y: CGFloat.random(in: 0...view.bounds.height),
                                                      width: starSize,
                                                      height: starSize))
                view.addSubview(starView)
                
                animateStar(starView)
            }
        }
    
    func animateStar(_ starView: UIView) {
            let animationDuration = TimeInterval.random(in: 5...5000) // Duración de la animación
            let animationDelay = TimeInterval.random(in: 0...5) // Retardo aleatorio antes de comenzar la animación
            
            UIView.animate(withDuration: animationDuration, delay: animationDelay, options: [.curveLinear], animations: {
                starView.frame.origin.y = -starView.frame.size.height
            }, completion: { _ in
                starView.removeFromSuperview()
            })
        }
}
