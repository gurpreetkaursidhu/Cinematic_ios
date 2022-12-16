//
//  SearchMoviesViewController.swift
//  Cinematic
//
//  Created by Gurpreet Kaur on 2022-12-15.
//

import UIKit

class SearchMoviesViewController: UIViewController {

    override func viewDidLoad() {
       
       
    }
    
    init(sender: UIViewController) {
        super.init(nibName: nil, bundle: nil)
        self.viewModel.sender = sender
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
   

}
