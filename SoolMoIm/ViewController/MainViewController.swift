//
//  ViewController.swift
//  SoolMoIm
//
//  Created by 최기훈 on 2022/09/17.
//

import UIKit
import Lottie
import SnapKit

class MainViewController: UIViewController {

    private let animationView = AnimationView(name: "50854-cash-or-card")
    @IBOutlet weak private var lottieView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        mainAnimation()
        navigationTitleHidden()
        setMainViewTextSet()
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
           super.viewDidAppear(animated)
           self.animationView.play()
    }

    func navigationTitleHidden() {
        
    }
    
    func mainAnimation() {
        self.lottieView.addSubview(self.animationView)
        lottieView.backgroundColor = .white
        self.animationView.snp.makeConstraints { make in
                make.edges.equalToSuperview()
            }
        self.animationView.loopMode = .loop
    }
    
    func setMainViewTextSet() {
        // 타이틀
        
    }
    

}

