//
//  KakaoShare.swift
//  SoolMoIm
//
//  Created by 최기훈 on 2022/09/30.
//

import Foundation
import KakaoSDKShare

// 기본 템플릿 사용 시 필요
import KakaoSDKTemplate
import KakaoSDKCommon
import UIKit
import SafariServices
// import KakaoSDKLink


class KakaoShare {
    
    let model = KakaoShareModel()
    
    var safariViewController : SFSafariViewController? // to keep instance
    
    func sendMessage() {
        
        let templateId = 83633

        // 카카오톡 설치여부 확인
        if ShareApi.isKakaoTalkSharingAvailable() {
            // 카카오톡으로 카카오톡 공유 가능
            ShareApi.shared.shareCustom(templateId: Int64(templateId), templateArgs:["title":"제목입니다.", "description":"설명입니다."]) {(sharingResult, error) in
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
            if let url = ShareApi.shared.makeCustomUrl(templateId: Int64(templateId), templateArgs:["title":"제목입니다.", "description":"설명입니다."]) {
                self.safariViewController = SFSafariViewController(url: url)
                self.safariViewController?.modalTransitionStyle = .crossDissolve
                self.safariViewController?.modalPresentationStyle = .overCurrentContext
                /*
                self.(self.safariViewController!, animated: true) {
                    print("웹 present success")
                }
                 */
            }
        }
    }
}

