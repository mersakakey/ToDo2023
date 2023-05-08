//
//  taskRow.swift
//  ToDo2023
//
//  Created by Takeru Sakakibara on 2022/05/30.
//

import SwiftUI

//var task : Task

struct taskRow: View {
    var body: some View {
        GeometryReader { geometry in

            RoundedRectangle(cornerRadius: 40)
                .fill(Color.white)
                .overlay(
                    HStack{
                    Text("Done")
                    .font(.system(size: geometry.size.width*0.1, weight: .black, design: .default))
                    }
                        )
                    
        }.aspectRatio(4, contentMode: .fit)
    
    }

}


struct taskRow_Previews: PreviewProvider {
    static var previews: some View {
        taskRow()
    }
}
