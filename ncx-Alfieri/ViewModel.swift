//
//  ViewModel.swift
//  ncx-Alfieri
//
//  Created by luca d'angelo on 30/03/22.
//

import Foundation
import SwiftUI

class ViewModel : ObservableObject {
    
    static let shared = ViewModel ()
    @Published var downloadAmount: CGFloat = 0.0
    @Published var isDownloaded : Bool = false
//    @Published var isPresenting : Bool = false
    

    
    
 
    
}
