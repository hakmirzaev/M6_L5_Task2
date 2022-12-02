//
//  ContentView.swift
//  M6_L5_Task2
//
//  Created by Bekhruz Hakmirzaev on 02/12/22.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @FetchRequest(entity: Student.entity(), sortDescriptors: []) var students: FetchedResults<Student>
    @Environment(\.managedObjectContext) var moc
    @State var isModel = false
    var body: some View {
        NavigationView{
            List{
                ForEach(students, id: \.id) { student in
                    StudentCell(student: student)
                }
                
            }
            .listStyle(PlainListStyle())
            .navigationBarItems(trailing:
                Button(action: {
                isModel = true
            }, label: {
                Text("Add")
            }).sheet(isPresented: $isModel, content: {
                DetailScreen().environment(\.managedObjectContext, self.moc)
            })
            )
            .navigationBarTitle("Student List", displayMode: .inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
