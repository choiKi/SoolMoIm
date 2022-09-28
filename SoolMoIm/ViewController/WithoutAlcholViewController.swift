//
//  OnlyFoodViewController.swift
//  SoolMoIm
//
//  Created by 최기훈 on 2022/09/27.
//

import UIKit
import SnapKit

class WithoutAlcholViewController: UIViewController {
    
    let withoutView = WithoutAlcholView()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        addSubview()
        subviewConstraints()
        navigationTitleHidden()
    }
    
    
    func addSubview() {
        view.backgroundColor = .white
        view.addSubview(withoutView.infoText1)
        view.addSubview(withoutView.infoText2)
        view.addSubview(withoutView.anjuText)
        view.addSubview(withoutView.anfuTextfield)
        view.addSubview(withoutView.alcholText)
        view.addSubview(withoutView.alcholTextfield)
        view.addSubview(withoutView.countText)
        view.addSubview(withoutView.countTextfield)
        view.addSubview(withoutView.resultButton)
        
    }
    
    func subviewConstraints() {
        withoutView.infoText1.snp.makeConstraints{ make in
            make.leading.equalToSuperview().offset(50)
            make.trailing.equalToSuperview().offset(-50)
            make.height.equalTo(75)
            make.top.equalToSuperview().offset(100)
        }
        withoutView.infoText2.snp.makeConstraints{ make in
            make.leading.equalToSuperview().offset(30)
            make.trailing.equalToSuperview().offset(-30)
            make.height.equalTo(75)
            make.top.equalTo(withoutView.infoText1.snp.bottom).offset(15)
        }
        withoutView.anjuText.snp.makeConstraints{ make in
            make.leading.equalToSuperview().offset(20)
            make.width.equalTo(50)
            make.height.equalTo(60)
            make.top.equalTo(withoutView.infoText2.snp.bottom).offset(30)
        }
        withoutView.anfuTextfield.snp.makeConstraints{ make in
            make.leading.equalTo(withoutView.anjuText.snp.right).offset(15)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(60)
            make.top.equalTo(withoutView.infoText2.snp.bottom).offset(30)
        }
        withoutView.alcholText.snp.makeConstraints{ make in
            make.leading.equalToSuperview().offset(20)
            make.width.equalTo(50)
            make.height.equalTo(60)
            make.top.equalTo(withoutView.anjuText.snp.bottom).offset(30)
        }
        withoutView.alcholTextfield.snp.makeConstraints{ make in
            make.leading.equalTo(withoutView.alcholText.snp.right).offset(15)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(60)
            make.top.equalTo(withoutView.anjuText.snp.bottom).offset(30)
        }
        withoutView.countText.snp.makeConstraints{ make in
            make.leading.equalToSuperview().offset(20)
            make.width.equalTo(50)
            make.height.equalTo(60)
            make.top.equalTo(withoutView.alcholText.snp.bottom).offset(30)
        }
        withoutView.countTextfield.snp.makeConstraints{ make in
            make.leading.equalTo(withoutView.alcholText.snp.right).offset(15)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(60)
            make.top.equalTo(withoutView.alcholText.snp.bottom).offset(30)
        }
        withoutView.resultButton.snp.makeConstraints{ make in
            make.top.equalTo(withoutView.countTextfield.snp.bottom).offset(30)
            make.leading.equalToSuperview().offset(100)
            make.trailing.equalToSuperview().offset(-100)
            make.height.equalTo(70)
        }
    }


    func navigationTitleHidden() {
        self.navigationController?.navigationBar.topItem!.title = ""
        self.navigationController?.isNavigationBarHidden = false
    }

}
