//
//  KeyboardResponder.swift
//  ScrollableView
//
//  Created by Nitin Bhatt on 7/5/20.
//  Copyright © 2020 Test. All rights reserved.
//

import Foundation
import SwiftUI

struct KeyboardResponder : ViewModifier {
    @State var offset : CGFloat = 0
    func body(content:Content) -> some View {
        content.padding(.bottom,offset).onAppear{
            NotificationCenter.default.addObserver(forName:UIResponder.keyboardWillShowNotification, object: nil, queue: .main){ (noti) in
              let value = noti.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! CGRect
              let height = value.height
                let bottomInset = UIApplication.shared.windows.first?.safeAreaInsets.bottom
                self.offset = height - (bottomInset ?? 0)
            }
                      
            NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: .main) { notif in
              self.offset = 0
            }
        }
    }
}
