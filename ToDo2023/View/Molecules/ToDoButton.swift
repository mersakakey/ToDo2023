//
//  ToDoButton.swift
//  ToDo2023
//
//  Created by Takeru Sakakibara on 2023/05/08.
//

import SwiftUI

struct ToDoButton: View {


    @EnvironmentObject var todoModel: ToDoModel
    @State var selectedTab: TaskStatus
    var backColor = Color.blue
    var title = "ToDo"
    
    var filteredTaskList: [Task] {
        todoModel.taskList.filter {
            $0.status == selectedTab
        }
    }
    
//    var ViewTaskList: [Optional<Task>]
//    = [
//        self.filteredTaskList[0]
//
//    ]


  //  var rows:Int
  // @ViewBuilder
    
    var body: some View {
        
        
     //   let len: Int = leng(tasks:filteredTaskList)
        
        
        ZStack(alignment: .top){
        GeometryReader { geometry in

            RoundedRectangle(cornerRadius: 40)
                .fill(backColor)
                .opacity(0.8)
        }.aspectRatio(4/3, contentMode: .fit)
            
            VStack{
            Text(title).font(.largeTitle)
                .foregroundColor(.white)
                .frame(height:50)
                
                
                List{
                    
                    
                    ForEach(filteredTaskList.prefix(4)) { task in
                    
                        HStack {
                            Text(task.name)
                                .font(.title3)
                                .fontWeight(.bold)
                                .foregroundColor(Color(.black))

                            Text(task.description)
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                                .padding(.leading, 6)
                            Text(task.kijitsu)
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                                .padding(.leading, 6)
                        }


                }
                }
                .aspectRatio(5/3, contentMode: .fit)
                .onAppear {
                    UITableView.appearance().backgroundColor = .clear
                  }
                .onDisappear {
                    UITableView.appearance().backgroundColor = .clear
                  }
                
                
                
            
            }
        }
    
    }

}


struct ToDoButton_Previews: PreviewProvider {
    static var previews: some View {
        ToDoButton(selectedTab: .ToDo).environmentObject(ToDoModel())

    }
}

func leng(tasks:[Task]) ->Int{
    let t = tasks.count
    var l = 0
    
    if(t>=5){
        l = 4
    }else{
        l = t
    }
    
    return l
}
