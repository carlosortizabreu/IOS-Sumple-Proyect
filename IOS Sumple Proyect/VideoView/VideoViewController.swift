//
//  VideoViewController.swift
//  IOS Sumple Proyect
//
//  Created by Carlos Ortiz Abreu on 8/5/22.
//

import UIKit
import AVFoundation

class VideoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    // MARK: - viewDidAppear.
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // Video.
        let player = AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "videoP", ofType: "mov")!))
        let layer = AVPlayerLayer(player: player)
        
        layer.frame = view.bounds
        layer.videoGravity = .resizeAspect// Tamaño.
        view.layer.addSublayer(layer)
        player.volume = 0
        player.play()
       
    }
    // MARK: - ViewDidLayoutSubviews.
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
       // add the function.
       self.animate()
    }
   
    // MARK: - CAMBIO VISTA.
   func animate(){
        UIView.animate(withDuration: 5, animations: {
            
        }, completion: {done in
            if done {
                
                DispatchQueue.main.asyncAfter(deadline: .now()+2.5, execute: { // Duración, time.
                    
                    let storyMain = UIStoryboard(name: "Main", bundle: nil)
                    let vc = storyMain.instantiateViewController(withIdentifier: "ViewController") as! ViewController
                    self.present(vc,animated: true, completion: nil)
                })
            }
        })
        
    }
    
    

}
