//
//  ViewController.swift
//  ncx-Alfieri
//
//  Created by luca d'angelo on 30/03/22.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {
    
    @IBOutlet weak var dismissUIButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let imageConfiguration = UIImage.SymbolConfiguration(pointSize: 50, weight: .medium, scale: .default)
        let image = UIImage(systemName: "xmark.circle.fill", withConfiguration: imageConfiguration)
        dismissUIButton.setImage(image, for: .normal)
        dismissUIButton.tintColor = UIColor.label
        // Do any additional setup after loading the vi
    }
    
    @IBSegueAction func embed(_ coder: NSCoder) -> UIViewController? {
        return UIHostingController(coder: coder, rootView: downloadingView())
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

   
}
