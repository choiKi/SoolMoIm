//
//  ViewController.swift
//  SoolMoIm
//
//  Created by 최기훈 on 2022/09/17.
//

import UIKit
import Lottie
import SnapKit
import Then

class MainViewController: UIViewController {

   private let mainView = MainView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        addSubView()
        subviewConstraints()
        mainView.mainAnimation()
        navigationTitleHidden()
        pressButton()
    }
    
    override func viewDidAppear(_ animated: Bool) {
           super.viewDidAppear(animated)
            mainView.animationView.play()
    }
    
    func pressButton() {
        mainView.splitTheBillBtn.addTarget(self, action: #selector(goSplitTheBill), for: .touchUpInside)
        mainView.withoutAlcoholBtn.addTarget(self, action: #selector(goWithoutAlcohol), for: .touchUpInside)
    }
    
    @objc func goSplitTheBill(sender: UIButton!) {
        let goSplitTheBillVC = SplitTheBillViewController()
        self.navigationController?.pushViewController(goSplitTheBillVC, animated: true)
    }
    
    @objc func goWithoutAlcohol(sender: UIButton!) {
        let goWithoutAlcholVC = WithoutAlcholViewController()
        self.navigationController?.pushViewController(goWithoutAlcholVC, animated: true)
    }
    @objc func goHitAndMissBtn(sender: UIButton!) {
        print(":(")
    }
    

    // SubView 관리
    func addSubView() {
        view.backgroundColor = .white
        view.addSubview(mainView.lottieView)
        view.addSubview(mainView.appTitle)
        view.addSubview(mainView.appInfo1)
        view.addSubview(mainView.appInfo2)
        view.addSubview(mainView.splitTheBillBtn)
        view.addSubview(mainView.withoutAlcoholBtn)
        view.addSubview(mainView.hitAndMissBtn)
    }
    
    func subviewConstraints() {
        mainView.lottieView.snp.makeConstraints{ make in
            make.leading.equalToSuperview().offset(50)
            make.trailing.equalToSuperview().offset(-50)
            make.top.equalToSuperview().offset(150)
            make.height.equalTo(190)
        }
        mainView.appInfo1.snp.makeConstraints{ make in
            make.height.equalTo(15)
            make.top.equalToSuperview().offset(85)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        
        mainView.appInfo2.snp.makeConstraints{ make in
            make.height.equalTo(15)
            make.top.equalToSuperview().offset(110)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        mainView.appTitle.snp.makeConstraints{ make in
            make.height.equalTo(50)
            make.top.equalToSuperview().offset(130)
            make.leading.equalToSuperview().offset(100)
            make.trailing.equalToSuperview().offset(-100)
        }
        mainView.splitTheBillBtn.snp.makeConstraints{ make in
            make.width.equalTo(view.bounds.width / 3)
            make.height.equalTo(view.bounds.width / 3)
            make.top.equalTo(mainView.lottieView).offset(200)
            make.leading.equalToSuperview().offset(view.bounds.width / 8)
        }
        mainView.withoutAlcoholBtn.snp.makeConstraints{ make in
            make.width.equalTo(view.bounds.width / 3)
            make.height.equalTo(view.bounds.width / 3)
            make.top.equalTo(mainView.lottieView).offset(200)
            make.trailing.equalToSuperview().offset(-(view.bounds.width / 8))
        }
        mainView.hitAndMissBtn.snp.makeConstraints{ make in
            // make.width.equalTo(view.bounds.width / 3)
            make.height.equalTo(view.bounds.width / 4)
            make.top.equalTo(mainView.splitTheBillBtn.snp.bottom).offset(30)
            make.leading.equalToSuperview().offset(view.bounds.width / 8)
            make.trailing.equalToSuperview().offset(-(view.bounds.width / 8))
        }
    }

    // 네비게이션 타이틀 히든
    func navigationTitleHidden() {
        self.navigationController?.navigationBar.topItem!.title = "술모임"
        self.navigationController?.isNavigationBarHidden = true
    }
}

