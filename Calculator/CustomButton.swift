//
//  CustomButton.swift
//  Calculator
//
//  Created by 공지원 on 23/11/2018.
//  Copyright © 2018 공지원. All rights reserved.
//

import UIKit

//스토리보드 버튼들의 모서리를 둥글게 만들어주는 커스텀 클래스 
class CustomButton: UIButton {
    override func awakeFromNib() {
        self.layer.cornerRadius = 5.0
    }
}
