//
//  DetailScreen.swift
//  M6_L5_Task2
//
//  Created by Bekhruz Hakmirzaev on 02/12/22.
//

import SwiftUI

struct DetailScreen: View {
    @Environment(\.presentationMode) var presentation
    @Environment(\.managedObjectContext) var moc
    @State var firstname = ""
    @State var lastname = ""
    @State var gender = ""
    @State var phone = ""
    @State var email = ""
    @State var address = ""
    let genders = ["Male", "Female"]
    
    func saveStudent(firstname: String, lastname: String, gender: String, phone: String, email: String, address: String){
        let student = Student(context: self.moc)
        student.firstname = firstname
        student.lastname = lastname
        student.email = email
        student.phone = phone
        student.gender = gender
        student.address = address
        try? self.moc.save()
    }
    
    var body: some View {
        NavigationView{
            Form{
                Section{
                    TextField("Firstname", text: $firstname)
                    TextField("Lastname", text: $lastname)
                    Picker("Gender", selection: $gender){
                        ForEach(genders, id: \.self){
                            Text($0)
                        }
                    }
                }
                Section{
                    TextField("Phone", text: $phone)
                    TextField("Email", text: $email)
                    TextField("Address", text: $address)
                }
            }
            .navigationBarItems(trailing:
                Button(action: {
                saveStudent(firstname: firstname, lastname: lastname, gender: gender, phone: phone, email: email, address: address)
                presentation.wrappedValue.dismiss()
            }, label: {
                Text("Add")
            })
            )
            .navigationBarTitle("Add Student", displayMode: .inline)
        }
    }
}

struct DetailScreen_Previews: PreviewProvider {
    static var previews: some View {
        DetailScreen()
    }
}

