//
//  DoneButton.swift
//  ToDo2023
//
//  Created by Takeru Sakakibara on 2023/05/08.
//

import SwiftUI

struct DoneButton: View {
    var body: some View {
        GeometryReader { geometry in

            RoundedRectangle(cornerRadius: 20)
                .fill(Color.green)
                .opacity(0.8)
                .overlay(            Text("Done")
                    .font(.system(size: geometry.size.width*0.3, weight: .black, design: .default))
                    .foregroundColor(.white)
                )
        }.aspectRatio(1.5, contentMode: .fit)
    
    }

}


struct DoneButton_Previews: PreviewProvider {
    static var previews: some View {
        DoneButton()
    }
}
