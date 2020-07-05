//
//  ContentView.swift
//  ScrollableView
//
//  Created by Nitin Bhatt on 7/5/20.
//  Copyright © 2020 Test. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var offset : CGFloat = 0
    var body: some View {
        
        GeometryReader { geometry in
        ScrollView(.vertical,showsIndicators: false){
                VStack(spacing: 0){
                     VStack(alignment: .leading){
                        LabelView(value: "First Name")
                        TextFieldView()
                     }.padding(.all,10)
                                   
                     VStack(alignment: .leading){
                        LabelView(value: "Last Name")
                        TextFieldView()
                     }.padding(.all,10)
                    
                     VStack(alignment: .leading){
                        LabelView(value: "Address")
                        TextFieldView()
                     }.padding(.all,10)

                    VStack(alignment: .leading){
                        LabelView(value: "City")
                        TextFieldView()
                    }.padding(.all,10)

                    VStack(alignment: .leading){
                        LabelView(value: "State")
                        TextFieldView()
                    }.padding(.all,10)

                    VStack(alignment: .leading){
                        LabelView(value: "Country")
                        TextFieldView()
                    }.padding(.all,10)
                    }.frame(width:geometry.size.width,height: geometry.size.height)
        }.animation(.spring()).modifier(KeyboardResponder())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct LabelView: View {
    
    var value = String()
    var body: some View {
        Text(value).padding([.top,.leading],5).foregroundColor(Color.black)
    }
}

struct TextFieldView: View {
   @State var value = String()
    var body: some View {
        TextField("", text: $value).frame(height: 40).border(Color.black,width: 0.5).padding([.leading,.trailing,.bottom],5).disableAutocorrection(true)
    }
}
