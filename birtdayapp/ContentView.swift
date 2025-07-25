//
//  ContentView.swift
//  birtdayapp
//
//  Created by Scholar on 7/25/25.
//

import SwiftUI

import SwiftData


struct ContentView: View {
    @Query private var friends : [Friend]
    //= [Friend(name: "Aditi", birthday: .now), Friend(name: "Piyali", birthday:.now)]
        
   
    @Environment(\.modelContext) private var context
    
    @State private var newName = ""
    @State private var newBirthday = Date.now
    
    var body: some View {
        NavigationStack{
            List {
                ForEach(friends) { friend in
                    HStack{
                        HStack{
                            Text(friend.name)
                            Spacer()
                            Text(friend.birthday, format: .dateTime.month(.wide).day().year())
                        }
                    }
                }//foreach
                .onDelete(perform: deleteFriend)
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
                        context.insert(newFriend)
                    }//button
                }//vstack
                
                .padding()
                .background(.bar)
            
            }//safeareainset
        }//Navstack
    }//body
    
    func deleteFriend(at offsets: IndexSet) {
        for index in offsets{
            let friendToDelete = friends[index]
            context.delete(friendToDelete)
        }
    }
    
    
    
    
}//struct

#Preview {
    ContentView()
        .modelContainer(for: Friend.self, inMemory : true)
}//preview
