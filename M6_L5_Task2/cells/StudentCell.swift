//
//  StudentCell.swift
//  M6_L5_Task2
//
//  Created by Bekhruz Hakmirzaev on 02/12/22.
//

import SwiftUI

struct StudentCell: View {
    @Environment(\.managedObjectContext) var moc
    var student: Student
    var body: some View {
        HStack{
            VStack(alignment: .leading, spacing: 5){
                HStack(spacing: 10){
                    Text(student.firstname!).fontWeight(.bold)
                    Text(student.lastname!).fontWeight(.bold)
                }
                HStack(spacing: 10){
                    Text(student.phone!)
                    Text("|")
                    Text(student.email!)
                }
                Text(student.address!)
            }
            Spacer()
            HStack{
                Text(student.gender!).foregroundColor(.red)
                Button(action: {
                    self.moc.delete(student)
                }, label: {
                    Image(systemName: "trash").foregroundColor(.blue)
                })
            }
        }.padding(.top, 10).padding(.bottom, 10)
    }
}

struct StudentCell_Previews: PreviewProvider {
    static var previews: some View {
        StudentCell(student: Student())
    }
}
