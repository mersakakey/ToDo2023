//
//  NewButton.swift
//  ToDo2023
//
//  Created by Takeru Sakakibara on 2023/05/08.
//

import SwiftUI

struct NewButton: View {
    var body: some View {

        GeometryReader { geometry in

            RoundedRectangle(cornerRadius: 40)
                .fill(Color.red)
                .opacity(0.8)
                .overlay(            Text("New")
                    .font(.system(size: geometry.size.width*0.3, weight: .black, design: .default))
                    .foregroundColor(.white)
                )
        }.aspectRatio(2, contentMode: .fit)
            

                
        }

}

/*
struct NewButton_Previews: PreviewProvider {
    static var previews: some View {

    }
}
*/

