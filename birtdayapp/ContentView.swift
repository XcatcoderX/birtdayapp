//
//  ContentView.swift
//  birtdayapp
//
//  Created by Scholar on 7/25/25.
//

import SwiftUI

struct ContentView: View {
    @State private var friends : [Friend] = [Friend(name: "Aditi", birthday: .now), Friend(name: "Piyali", birthday:.now)]
        
    @State private var newBirthday = Date.now
    @State private var newName = ""
    
    var body: some View {
        NavigationStack{
            List(friends, id: \.name) { friend in
                HStack{
                    Text(friend.name)
                    Spacer()
                    Text(friend.birthday, format:
                            .dateTime.month(.wide).day()
                            .year())
                }
                
                
                
                
                
                
                
            }//list
            .navigationTitle("Birthdays")
            .safeAreaInset(edge: .bottom){
                VStack(alignment: .center, spacing: 20) {
                    Text("New birthday")
                        .font(.headline)
                   
                    
                    DatePicker(selection: $newBirthday){
                        TextField("Name", text: $newName)
                            .textFieldStyle(.roundedBorder)
                       
                    }//datepicker
                    
                    
                    Button("Save"){
                        let newFriend = Friend(name: newName,
                                birthday: newBirthday)
                        friends.append(newFriend)
                        
                    }//button
                }//vstack
                
                .padding()
                .background(.bar)
            
            }//safeareainset
        }//Navstack
    }//body
}//struct

#Preview {
    ContentView()
}//preview
