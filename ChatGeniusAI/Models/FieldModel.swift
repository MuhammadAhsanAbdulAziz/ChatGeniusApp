//
//  FieldModel.swift
//  ChatGeniusAI
//
//  Created by Apple on 16/10/2024.
//

import Foundation


struct FieldModel {
    var value : String
    var error : String?
    var fieldType: FieldType
    
    init(value: String, error: String? = nil, fieldType: FieldType) {
        self.value = value
        self.error = error
        self.fieldType = fieldType
    }
    
    mutating func onValidate() -> Bool {
        error = fieldType.validate(value: value)
        return error == nil
    }
    
    mutating func onSubmitError() {
        error = fieldType.validate(value: value)
    }
}
