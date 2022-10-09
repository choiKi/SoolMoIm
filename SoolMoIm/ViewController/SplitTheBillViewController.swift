//
//  SplitTheBillViewController.swift
//  SoolMoIm
//
//  Created by 최기훈 on 2022/09/17.
//

import UIKit
import Lottie
import SnapKit
import Then
import KakaoSDKShare
import KakaoSDKTemplate
import SafariServices


class SplitTheBillViewController: UIViewController {
    
    private let splitTheBillView = SplitTheBillView()

    let templateId: Int64 = 83633
    var safariViewController : SFSafariViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        splitTheBillView.totalAmountTextField.text = ""
        splitTheBillView.participantTextField.text = ""
        addSubview()
        subviewConstraints()
        navigationTitleHidden()
        block()
        pressCalculate()
        shareBtn()
    }
    
    func block() {
        
        splitTheBillView.totalAmountTextField.addTarget(self, action: #selector(blockPressBtn(sender:)), for: .editingChanged)
        splitTheBillView.participantTextField.addTarget(self, action: #selector(blockPressBtn(sender:)), for: .editingChanged)
    }
    
    @objc func blockPressBtn(sender: Any?) {
        if splitTheBillView.totalAmountTextField.text == "" || splitTheBillView.participantTextField.text == "" {
            splitTheBillView.resultButton.backgroundColor = .white
            splitTheBillView.resultButton.layer.borderColor = UIColor.darkGray.cgColor
            splitTheBillView.resultButton.layer.borderWidth = 1
            splitTheBillView.resultButton.setTitle("모두 입력하세요", for: .normal)
            splitTheBillView.resultButton.setTitleColor(UIColor.gray, for: .normal)
            splitTheBillView.resultButton.isEnabled = false
        } else if splitTheBillView.totalAmountTextField.text == "0" || splitTheBillView.participantTextField.text == "0" {
            splitTheBillView.resultButton.backgroundColor = .white
            splitTheBillView.resultButton.layer.borderColor = UIColor.darkGray.cgColor
            splitTheBillView.resultButton.layer.borderWidth = 1
            splitTheBillView.resultButton.setTitle("꽁술 개이득!", for: .normal)
            splitTheBillView.resultButton.setTitleColor(UIColor.gray, for: .normal)
            splitTheBillView.resultButton.isEnabled = false
        } else {
            splitTheBillView.resultButton.setTitle("계산 시작", for: .normal)
            splitTheBillView.resultButton.titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
            splitTheBillView.resultButton.backgroundColor = .green
            splitTheBillView.resultButton.setTitleColor(UIColor.white, for: .normal)
            splitTheBillView.resultButton.layer.borderColor = UIColor.green.cgColor
            splitTheBillView.resultButton.isEnabled = true
        }
    }
    
    func pressCalculate() {
        splitTheBillView.resultButton.addTarget(self, action: #selector(startCalculate), for: .touchDown)
    }
    
    @objc func startCalculate(sender: Any?) {
        // 옳은 결과면 결과보여주고, 옳은 결과가 아니라면 에러페이지
        checkCompatibility(ta: Int(splitTheBillView.totalAmountTextField.text!)!, ptc: Int(splitTheBillView.participantTextField.text!)!)
    }
    
    func checkCompatibility(ta: Int!, ptc: Int!)  {
        let ta = Int(splitTheBillView.totalAmountTextField.text!)!
        let ptc = Int(splitTheBillView.participantTextField.text!)!
        
        guard ta >= ptc else {
            // 경고1
            print("1")
            splitTheBillView.customAlert.showAlert(with: "계산 불가",
                                message: "총액과 총원을 정확히 입력하세요",
                                on: self)
            return
        }
        calculateAnimation()
        viewResult()
        // viewResult
    }
    
    func calculateAnimation() {
        splitTheBillView.lottieView.addSubview(splitTheBillView.animationView)
        
        splitTheBillView.animationView.snp.makeConstraints { make in
                make.edges.equalToSuperview()
            }
        splitTheBillView.animationView.play()
    }
    func viewResult(){
        
        let ta = Int(splitTheBillView.totalAmountTextField.text!)!
        let ptc = Int(splitTheBillView.participantTextField.text!)!
        var result = ta / ptc
        // lottie 끝나고 시작했음 좋겠다.
        splitTheBillView.result.text = "\(result) 원"
        print(result)
        
    }
    func shareBtn() {
        splitTheBillView.shareBtn.addTarget(self, action: #selector(shareBtnClicked), for: .touchDown)
    }
    @objc func shareBtnClicked() {
        print("push")
        if ShareApi.isKakaoTalkSharingAvailable() {
            // 카카오톡으로 카카오톡 공유 가능
            ShareApi.shared.shareCustom(templateId: templateId, templateArgs:["title":"제목입니다.", "description":"설명입니다."]) {(sharingResult, error) in
                if let error = error {
                    print(error)
                }
                else {
                    print("shareCustom() success.")
                    if let sharingResult = sharingResult {
                        UIApplication.shared.open(sharingResult.url, options: [:], completionHandler: nil)
                    }
                }
            }
        }
        else {
            // 카카오톡 미설치: 웹 공유 사용 권장
            // Custom WebView 또는 디폴트 브라우져 사용 가능
            // 웹 공유 예시 코드
            if let url = ShareApi.shared.makeCustomUrl(templateId: templateId, templateArgs:["title":"제목입니다.", "description":"설명입니다."]) {
                self.safariViewController = SFSafariViewController(url: url)
                self.safariViewController?.modalTransitionStyle = .crossDissolve
                self.safariViewController?.modalPresentationStyle = .overCurrentContext
                self.present(self.safariViewController!, animated: true) {
                    print("웹 present success")
                }
            }
        }
    }
    
    // View 관련
    
    func addSubview() {
        view.backgroundColor = .white
        view.addSubview(splitTheBillView.lottieView)
        view.addSubview(splitTheBillView.stbInfo1)
        view.addSubview(splitTheBillView.totalAmount)
        view.addSubview(splitTheBillView.totalAmountTextField)
        view.addSubview(splitTheBillView.participant)
        view.addSubview(splitTheBillView.participantTextField)
        view.addSubview(splitTheBillView.resultButton)
        view.addSubview(splitTheBillView.result)
        view.addSubview(splitTheBillView.shareBtn)
    }
    
    func subviewConstraints() {
        splitTheBillView.lottieView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.top.equalToSuperview().offset(250)
            make.bottom.equalToSuperview().offset(-10)
        }
        splitTheBillView.stbInfo1.snp.makeConstraints{ make in
            make.width.equalToSuperview()
            make.height.equalTo(80)
            make.top.equalToSuperview().offset(80)
        }
        splitTheBillView.totalAmount.snp.makeConstraints{ make in
            make.width.equalTo(view.bounds.width / 1.5)
            make.height.equalTo(25)
            make.leading.equalToSuperview().offset(40)
            make.top.equalTo(splitTheBillView.stbInfo1.snp.bottom).offset(20)
        }
        splitTheBillView.totalAmountTextField.snp.makeConstraints{ make in
            make.width.equalTo(splitTheBillView.totalAmount)
            make.height.equalTo(splitTheBillView.totalAmount)
            make.leading.equalTo(splitTheBillView.totalAmount).offset(30)
            make.top.equalTo(splitTheBillView.totalAmount.snp.bottom).offset(12)
            
        }
        splitTheBillView.participant.snp.makeConstraints{ make in
            make.width.equalTo(splitTheBillView.totalAmount)
            make.height.equalTo(splitTheBillView.totalAmount)
            make.leading.equalTo(splitTheBillView.totalAmount)
            make.top.equalTo(splitTheBillView.totalAmountTextField.snp.bottom).offset(20)
        }
        splitTheBillView.participantTextField.snp.makeConstraints{ make in
            make.width.equalTo(splitTheBillView.participant)
            make.height.equalTo(splitTheBillView.totalAmount)
            make.leading.equalTo(splitTheBillView.totalAmount).offset(30)
            make.top.equalTo(splitTheBillView.participant.snp.bottom).offset(12)
        }
        splitTheBillView.resultButton.snp.makeConstraints{ make in
            make.height.equalTo(70)
            make.leading.equalToSuperview().offset(100)
            make.trailing.equalToSuperview().offset(-100)
            make.top.equalTo(splitTheBillView.participantTextField.snp.bottom).offset(30)
        }
        splitTheBillView.result.snp.makeConstraints{ make in
            make.leading.equalToSuperview().offset(100)
            make.trailing.equalToSuperview().offset(-100)
            make.top.equalTo(splitTheBillView.resultButton.snp.bottom).offset(50)
            make.height.equalTo(100)
        }
        splitTheBillView.shareBtn.snp.makeConstraints{ make in
            make.leading.equalToSuperview().offset(100)
            make.trailing.equalToSuperview().offset(-100)
            make.top.equalTo(splitTheBillView.result.snp.bottom).offset(30)
            make.height.equalTo(40)
        }
    }
    
    func navigationTitleHidden() {
        self.navigationController?.navigationBar.topItem!.title = ""
        self.navigationController?.isNavigationBarHidden = false
    }
    
}

/*
extension SplitTheBillViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let text = textField.text else { return true }
        let trimmedText = text.trimmingCharacters(in: .whitespaces)
        // resultLabel.text = trimmedText
        textField.resignFirstResponder()
        return true
    }
}
*/
