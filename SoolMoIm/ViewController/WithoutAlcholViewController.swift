//
//  OnlyFoodViewController.swift
//  SoolMoIm
//
//  Created by 최기훈 on 2022/09/27.
//

import UIKit

class WithoutAlcholViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        addSubview()
        navigationTitleHidden()
    }
    
    
    func addSubview() {
        view.backgroundColor = .white
    }


    func navigationTitleHidden() {
        self.navigationController?.navigationBar.topItem!.title = ""
        self.navigationController?.isNavigationBarHidden = false
    }

}
