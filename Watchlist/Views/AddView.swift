//
//  AddView.swift
//  Watchlist
//
//  Created by Julien Onorato on 09/01/2023.
//

import SwiftUI

struct AddView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel: MovieViewModel
    @State var textFieldText: String = ""
    @State var ratingPicker: Int = 0
    
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Name of the movie", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(10)
                
                Picker("Rate the movie", selection: $ratingPicker, content: {
                    Text("⭐️").tag(0)
                    Text("⭐️⭐️").tag(1)
                    Text("⭐️⭐️⭐️").tag(2)
                    Text("⭐️⭐️⭐️⭐️").tag(3)
                    Text("⭐️⭐️⭐️⭐️⭐️").tag(4)
                })
                
                Button(action: saveButtonPressed, label: {
                    Text("Save".uppercased())
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                })
            }
            .padding(14)
        }
        .navigationTitle("Add an Movie")
        .alert(isPresented: $showAlert, content: getAlert)
    }
    
    func saveButtonPressed() {
        if textIsAppropriate() {
            listViewModel.addItem(title: textFieldText, rating: ratingPicker + 1)
            presentationMode.wrappedValue.dismiss()
        }
    }
    
    func textIsAppropriate() -> Bool {
        if textFieldText.count < 2 {
            alertTitle = "Movie needs to be at least 2 characters long"
            showAlert.toggle()
            return false
        }
        return true
    }
    
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }

}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView()
            .environmentObject(MovieViewModel())
    }
}
