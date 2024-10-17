//
//  CustomTextField.swift
//  ChatGeniusAI
//
//  Created by Apple on 14/10/2024.
//

import SwiftUI

struct AuthTextField: View {
    var placeHolderText: String
    var keyboardType: UIKeyboardType
    var fieldModel : Binding<FieldModel>
    var isPasswordFieldType : Bool
    
    var body: some View {
        VStack(alignment:.leading){
            HStack{
                if isPasswordFieldType {
                    SecureField("", text: fieldModel.value,
                              prompt:
                                Text(placeHolderText)
                        .font(.system(size: 18))
                        .foregroundStyle(.gray)
                    )
                    .keyboardType(keyboardType)
                    .autocorrectionDisabled(true)
                    .textInputAutocapitalization(.never)
                }
                else {
                    TextField("", text: fieldModel.value,
                              prompt:
                                Text(placeHolderText)
                        .font(.system(size: 18))
                        .foregroundStyle(.gray)
                    )
                    .keyboardType(keyboardType)
                    .autocorrectionDisabled(true)
                    .textInputAutocapitalization(.never)
                }
            }
            .padding(.vertical,15)
            .padding(.horizontal,15)
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 4))
            .foregroundStyle(.black)
            
            if let error =  fieldModel.error.wrappedValue {
                Text(error)
                    .foregroundStyle(.red)
                    .font(.system(size: 15))
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal,0)
            }
        }
    }
}
