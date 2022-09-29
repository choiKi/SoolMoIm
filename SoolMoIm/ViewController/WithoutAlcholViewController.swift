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
        withoutView.anfuTextfield.text = ""
        withoutView.alcholTextfield.text = ""
        withoutView.countTextfield.text = ""
        withoutView.countTextfield2.text = ""
        
        addSubview()
        subviewConstraints()
        block()
        navigationTitleHidden()
        pressCalculate()
    }
    
    
    func block() {
        withoutView.anfuTextfield.addTarget(self, action: #selector(blockPressBtn(sender:)), for: .editingChanged)
        withoutView.alcholTextfield.addTarget(self, action: #selector(blockPressBtn(sender:)), for: .editingChanged)
        withoutView.countTextfield.addTarget(self, action: #selector(blockPressBtn(sender:)), for: .editingChanged)
        withoutView.countTextfield2.addTarget(self, action: #selector(blockPressBtn(sender:)), for: .editingChanged)
    }
    
    @objc func blockPressBtn(sender: Any?) {
        if withoutView.anfuTextfield.text == "" || withoutView.alcholTextfield.text == "" || withoutView.countTextfield.text == "" || withoutView.countTextfield.text == "" {
            withoutView.resultButton.backgroundColor = .white
            withoutView.resultButton.layer.borderColor = UIColor.darkGray.cgColor
            withoutView.resultButton.layer.borderWidth = 1
            withoutView.resultButton.setTitle("모두 입력하세요", for: .normal)
            withoutView.resultButton.setTitleColor(UIColor.gray, for: .normal)
            withoutView.resultButton.isEnabled = false
        } else if withoutView.anfuTextfield.text == "0" || withoutView.alcholTextfield.text == "0" ||  withoutView.countTextfield.text == "0" || withoutView.countTextfield.text == "0" {
            withoutView.resultButton.backgroundColor = .white
            withoutView.resultButton.layer.borderColor = UIColor.darkGray.cgColor
            withoutView.resultButton.layer.borderWidth = 1
            withoutView.resultButton.setTitle("모두 입력하세요", for: .normal)
            withoutView.resultButton.setTitleColor(UIColor.gray, for: .normal)
            withoutView.resultButton.isEnabled = false
        } else {
            withoutView.resultButton.setTitle("계산 시작", for: .normal)
            withoutView.resultButton.titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
            withoutView.resultButton.backgroundColor = .green
            withoutView.resultButton.setTitleColor(UIColor.white, for: .normal)
            withoutView.resultButton.layer.borderColor = UIColor.green.cgColor
            withoutView.resultButton.isEnabled = true
        }
    }
    
    func pressCalculate() {
        withoutView.resultButton.addTarget(self, action: #selector(startCalculate), for: .touchDown)
    }
    
    @objc func startCalculate(sender: Any?) {
        // 옳은 결과면 결과보여주고, 옳은 결과가 아니라면 에러페이지
        checkCompatibility(anju: Int(withoutView.anfuTextfield.text!)!,
                           alchol: Int(withoutView.alcholTextfield.text!)!,
                           count: Int(withoutView.countTextfield.text!)!,
                           count2: Int(withoutView.countTextfield2.text!)!)
    }
    
    func checkCompatibility(anju: Int!, alchol: Int!, count: Int!, count2: Int!)  {
        
        let anju = Int(withoutView.anfuTextfield.text!)!
        let alchol = Int(withoutView.alcholTextfield.text!)!
        let count = Int(withoutView.countTextfield.text!)!
        let count2 = Int(withoutView.countTextfield2.text!)!
        
        guard anju > alchol else {
            withoutView.customAlert.showAlert(with: "계산 불가",
                                              message: "총 술값을 정확히 입력하세요",
                                              on: self)
            return
        }
        guard anju > count else {
            withoutView.customAlert.showAlert(with: "계산 불가",
                                              message: "입력을 다시 확인하세요",
                                              on: self)
            return
        }
        guard count >= count2 else {
            withoutView.customAlert.showAlert(with: "계산 불가",
                                              message: "입력을 다시 확인하세요",
                                              on: self)
            return
        }
        
        // calculateAnimation()
         viewResult()

    }
    func viewResult(){
        
        let anju = Int(withoutView.anfuTextfield.text!)!
        let alchol = Int(withoutView.alcholTextfield.text!)!
        let count = Int(withoutView.countTextfield.text!)!
        let count2 = Int(withoutView.countTextfield2.text!)!
        
        let result1 = anju / count   //  일단 총 계산 값
        let result2 = anju - alchol  //  안주값만
        let result3 = result2 / count // 술 안마신 사람이 내야할 값
        let result4 = alchol / (count - count2) // 술 마신사람이 술 값만 n빵
        let result5 = result3 + result4  // 술 마신 사람이 내야할 값
        
        
        withoutView.result1.text = "술 값빼고 \(result3) 원"
        withoutView.result2.text = "술 값 포함 \(result5) 원"
        print(result3)
        print(result5)
        
        /*
        var result = ta / ptc
        // lottie 끝나고 시작했음 좋겠다.
        splitTheBillView.result.text = "\(result) 원"
        print(result)
         */
        
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
        view.addSubview(withoutView.countText2)
        view.addSubview(withoutView.countTextfield2)
        view.addSubview(withoutView.resultButton)
        view.addSubview(withoutView.result1)
        view.addSubview(withoutView.result2)
    }
    
    func subviewConstraints() {
        withoutView.infoText1.snp.makeConstraints{ make in
            make.leading.equalToSuperview().offset(50)
            make.trailing.equalToSuperview().offset(-50)
            make.height.equalTo(30)
            make.top.equalToSuperview().offset(80)
        }
        withoutView.infoText2.snp.makeConstraints{ make in
            make.leading.equalToSuperview().offset(30)
            make.trailing.equalToSuperview().offset(-30)
            make.height.equalTo(75)
            make.top.equalTo(withoutView.infoText1.snp.bottom).offset(15)
        }
        withoutView.anjuText.snp.makeConstraints{ make in
            make.leading.equalToSuperview().offset(20)
            make.width.equalTo(80)
            make.height.equalTo(60)
            make.top.equalTo(withoutView.infoText2.snp.bottom).offset(20)
        }
        withoutView.anfuTextfield.snp.makeConstraints{ make in
            make.leading.equalToSuperview().offset(115)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(60)
            make.top.equalTo(withoutView.infoText2.snp.bottom).offset(20)
        }
        withoutView.alcholText.snp.makeConstraints{ make in
            make.leading.equalToSuperview().offset(20)
            make.width.equalTo(80)
            make.height.equalTo(60)
            make.top.equalTo(withoutView.anjuText.snp.bottom).offset(30)
        }
        withoutView.alcholTextfield.snp.makeConstraints{ make in
            make.leading.equalToSuperview().offset(115)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(60)
            make.top.equalTo(withoutView.anjuText.snp.bottom).offset(30)
        }
        
        withoutView.countText.snp.makeConstraints{ make in
            make.leading.equalToSuperview().offset(10)
            make.width.equalTo(60)
            make.height.equalTo(60)
            make.top.equalTo(withoutView.alcholText.snp.bottom).offset(30)
        }
        withoutView.countTextfield.snp.makeConstraints{ make in
            make.leading.equalToSuperview().offset(80)
            make.trailing.equalToSuperview().offset(-240)
            make.height.equalTo(60)
            make.top.equalTo(withoutView.alcholText.snp.bottom).offset(30)
        }
        
        withoutView.countText2.snp.makeConstraints{ make in
            make.leading.equalTo(withoutView.countTextfield.snp.trailing).offset(10)
            make.width.equalTo(80)
            make.height.equalTo(60)
            make.top.equalTo(withoutView.alcholText.snp.bottom).offset(30)
        }
        withoutView.countTextfield2.snp.makeConstraints{ make in
            make.leading.equalTo(withoutView.countText2.snp.trailing).offset(10)
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
        withoutView.result1.snp.makeConstraints { make in
            make.top.equalTo(withoutView.resultButton.snp.bottom).offset(15)
            make.height.equalTo(70)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
        withoutView.result2.snp.makeConstraints { make in
            make.top.equalTo(withoutView.result1.snp.bottom).offset(7)
            make.height.equalTo(70)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
    }


    func navigationTitleHidden() {
        self.navigationController?.navigationBar.topItem!.title = ""
        self.navigationController?.isNavigationBarHidden = false
    }

}
