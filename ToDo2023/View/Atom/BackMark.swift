//
//  BackMark.swift
//  ToDo2023
//
//  Created by Takeru Sakakibara on 2022/06/13.
//
import SwiftUI

struct back: View {
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        
        Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }, label: {
            Text("×")
                .font(.title2)
                .foregroundColor(.black)
                .frame(width: 30, height: 30)
                .background(Color(.lightGray))
                .cornerRadius(15)
                .padding()
        })
        .padding(.trailing)
        .padding(.top)
    }
}
