//
//  SettingsView.swift
//  Watch Todo App dd Watch App
//
//  Created by user269332 on 2/20/25.
//

import SwiftUI

//to change the line limit of the app
//by default we set it to 1 in the content view.
struct SettingsView: View {
    @AppStorage("lineCount") var lineCount: Int = 1 //default
    
    @State private var value: Float = 1.0
    @FocusState private var isFocused: Bool //for digital crown
    
    //update the line count.
    func update() {
        lineCount = Int(value)
    }
    
    var body: some View {
        VStack(spacing: 8) {
            HeaderView(title: "Settings")
            
            Text("LINES: \(lineCount)")
            
            //slider to change the line count $value
            //create our own custom binding
            
            Slider(value: Binding(get: {
                self.value
            }, set: { newValue in
                self.value = newValue
                self.update()
            }), in: 1...4, step: 1)
                .tint(.accent)
                .focused($isFocused)
        }.onAppear {
            value = Float(lineCount) //we can change the slider based on lineCount when we open the settings page
            isFocused = true
        }
    }
}

#Preview {
    SettingsView()
}
