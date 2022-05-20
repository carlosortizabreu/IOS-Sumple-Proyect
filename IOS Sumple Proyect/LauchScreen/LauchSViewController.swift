//
//  LauchSViewController.swift
//  IOS Sumple Proyect
//
//  Created by Carlos Ortiz Abreu on 3/5/22.
//

import UIKit

class LauchSViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
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
                
                DispatchQueue.main.asyncAfter(deadline: .now()+1.5, execute: { // Duración, time.
                    
                    let storyMain = UIStoryboard(name: "Main", bundle: nil)
                    let vc = storyMain.instantiateViewController(withIdentifier: "ViewController") as! ViewController
                    self.present(vc,animated: true, completion: nil)
                })
            }
        })
        
    }
    

    
    
    
    
    
    
    
    /*
    
    */

}
