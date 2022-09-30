//
//  LoginViewController.swift
//  SoolMoIm
//
//  Created by 최기훈 on 2022/09/29.
//

import UIKit
import SnapKit
import Foundation
import Then


class LoginViewController: UIViewController {
    
    let loginButton = UIButton().then{
        $0.setTitle("카카오로 로그인하기", for: .normal)
        $0.layer.cornerRadius = 20
        $0.setImage(UIImage(named: "kakaoIcon"), for: .normal)
        $0.imageView?.contentMode = .scaleAspectFit
        $0.addTarget(self, action: #selector(loginButtonClicked), for: .touchUpInside)
        $0.semanticContentAttribute = .forceRightToLeft
    }
    

    
    lazy var kakaoAuthVM: KakaoAuthVM = { KakaoAuthVM() }()
    
    let alreadyLogin: Bool = UserDefaults.standard.bool(forKey: "AlreadyLogin")

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        addSubView()
        makeConstraints()
        alreadyLogined()
        navigationTitleHidden()
    }
    
    // 로그인 구현 뷰
    
    @objc func loginButtonClicked() {
        kakaoAuthVM.handleKakaoLogin()
        
        let newViewController = MainViewController()
        self.navigationController?.pushViewController(newViewController, animated: true)

    }
    
    func alreadyLogined() {
        
        if alreadyLogin {
            
            let newViewController = MainViewController()
            self.navigationController?.pushViewController(newViewController, animated: true)
            
        }
        
    }
    
    func addSubView() {
        view.backgroundColor = .white
        view.addSubview(loginButton)
    }
    
    func makeConstraints() {
        loginButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-100)
            make.height.equalTo(100)
            make.leading.equalToSuperview().offset(100)
            make.trailing.equalToSuperview().offset(-100)
        }
    }
    // 네비게이션 타이틀 히든
    func navigationTitleHidden() {
        self.navigationController?.navigationBar.topItem!.title = ""
        self.navigationController?.isNavigationBarHidden = true
        self.navigationItem.setHidesBackButton(true, animated: true)
    }
    
}



#if DEBUG

import SwiftUI

struct ViewControllerPresentable: UIViewControllerRepresentable {
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    func makeUIViewController(context: Context) -> some UIViewController {
        LoginViewController()
    }
}

struct ViewControllerPrepresentable_PreviewProvider: PreviewProvider {
    static var previews: some View {
        ViewControllerPresentable()
    }
}

#endif
