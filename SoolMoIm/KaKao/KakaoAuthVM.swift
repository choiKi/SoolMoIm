//
//  KakaoAuthVM.swift
//  SoolMoIm
//
//  Created by 최기훈 on 2022/09/30.
//

import Foundation
import Combine
import KakaoSDKAuth
import KakaoSDKUser

class KakaoAuthVM: ObservableObject{
    
    var subscriptions = Set<AnyCancellable>()
    var logined: Bool = false
    
    init() {
        print("init")
    }
    
    func handleKakaoLogin() {
        print("KakaoAuthVM - called")
        
        if (UserApi.isKakaoTalkLoginAvailable()) {
            UserApi.shared.loginWithKakaoTalk {(oauthToken, error) in
                if let error = error {
                    print(error)
                }
                else {
                    print("loginWithKakaoTalk() success.")
                    UserDefaults.standard.set(true , forKey: "AlreadyLogin")
                    //do something
                    _ = oauthToken
                }
            }
        } else { // 카톡 미 설치시
            UserApi.shared.loginWithKakaoAccount {(oauthToken, error) in
                    if let error = error {
                        print(error)
                    }
                    else {
                        print("loginWithKakaoAccount() success.")
                        UserDefaults.standard.set(true , forKey: "AlreadyLogin")
                        //do something
                        _ = oauthToken
                    }
                }
        }
    }
}
