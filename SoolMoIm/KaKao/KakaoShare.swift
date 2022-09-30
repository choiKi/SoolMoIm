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

// import KakaoSDKLink


class KakaoShare {
    
    let model = KakaoShareModel()
    
    
    /*
    let templateId = 83633

    var kakaoButtonAction: () -> Void = {
        // templatable은 메시지 만들기 항목 참고
        let title = "돈 보내주세요!"

        let feedTemplateJsonStringData =
          """
          {
              "object_type": "feed",
              "content": {
                  "title": "딸기 치즈 케익",
                  "description": "#케익 #딸기 #삼평동 #카페 #분위기 #소개팅",
                  "image_url": "http://mud-kage.kakao.co.kr/dn/Q2iNx/btqgeRgV54P/VLdBs9cvyn8BJXB3o7N8UK/kakaolink40_original.png",
                  "link": {
                      "mobile_web_url": "https://developers.kakao.com",
                      "web_url": "https://developers.kakao.com"
                  }
              },
              "buttons": [
                  {
                      "title": "앱으로 보기",
                      "link": {
                          "android_execution_params": "key1=value1&key2=value2",
                          "ios_execution_params": "key1=value1&key2=value2"
                      }
                  }
              ]
          }
          """.data(using: .utf8)!

        // templatable은 메시지 만들기 항목 참고
        if let templatable = try? SdkJSONDecoder.custom.decode(FeedTemplate.self, from: feedTemplateJsonStringData) {
          LinkApi.shared.defaultLink(templatable: templatable) { linkResult, error in
            if let error = error {
              print(error)
            }
            else {
              print("defaultLink() success.")

              if let linkResult = linkResult {
                UIApplication.shared.open(linkResult.url, options: [:], completionHandler: nil)
              }
            }
          }
        }
      }
    */
}

