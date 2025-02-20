//
//  ContentView.swift
//  Watch Todo App dd Watch App
//
//  Created by user269332 on 2/19/25.
//

import SwiftUI

struct ContentView: View {
    
    //var
    @State private var notes: [Note] = [Note]() //empty list of notees
    @State private var text: String = "" // empty string
    
    @AppStorage("lineCount") var lineCount: Int = 1
    //func to save the notes
    func save() {
        // write the code to store the notes in internal storahe
        //dump(notes) //line by line debug
        do {
            //convert the data to JSON
            let data = try JSONEncoder().encode(notes)
           
            //get the path -> where the notes will be saved
            let url = getDocumentsDirectory().appendingPathComponent(
                "notes")
            
            //write the data to the path
            try data.write(to: url)
        }catch {
            print("Failed to save the notes")
        }
        
    }
    //func to load the notes
    func load() {
        DispatchQueue.main.async {
            do {
                let url = getDocumentsDirectory()
                    .appendingPathComponent("notes")
                let data = try Data(contentsOf: url)
                
                notes = try JSONDecoder().decode([Note].self, from: data)
            }catch {
                //nothing
            }
        }
    }
    
    //get the path -> where the notes will be saved
    func getDocumentsDirectory() -> URL {
        let path = FileManager.default.urls(
            for: .documentDirectory,
            in: .userDomainMask
        )
        
        return path[0]
    }
    //func to delete the note
    func delete(offsets: IndexSet) {
        withAnimation {
            notes.remove(atOffsets: offsets)
            save() //update the saved notes lists
        }
    }
    
    //get the path -> where you store the notes
    
    var body: some View {
        NavigationView {
            VStack {
                HStack(alignment: .center, spacing: 4) {
                    TextField("Add a note", text: $text)
                    Button {
                        print("Saving note")
                        guard text.isEmpty == false else {return}
                        let note = Note(id: UUID(), text: text)
                        notes.append(note)
                        text = "" //clear the previous notes
                        save() //to save the notes in internal storage
                    } label: {
                        Image(systemName: "plus.circle")
                            .font(.system(size: 42, weight: .semibold))
                    }.fixedSize()
                        .buttonStyle(PlainButtonStyle())
                        .foregroundStyle(.accent)
                }
                Spacer()
                
                //list
                if notes.count >= 1 {
                    List {
                        ForEach(0..<notes.count, id: \.self) {
                            i in
                            NavigationLink {
                                DetailView(
                                    note: notes[i],
                                    count: notes.count,
                                    index: i)
                            } label: {
                                HStack {
                                        //vertical divider
                                    Capsule()
                                        .frame(width: 4)
                                        .foregroundStyle(.accent)
                                    Text(self.notes[i].text)
                                        .lineLimit(
                                            lineCount
                                        ) //this will be changed in the settings screen
                                        .padding(.leading, 5)
                                }
                            }
                        }.onDelete(perform: delete)
                    }
                } else {
                    Spacer()
                    Image(systemName: "note.text")
                        .resizable()
                        .scaledToFit()
                        .foregroundStyle(.gray)
                        .padding(20)
                    Spacer()
                }
                
                Text("Count: \(notes.count)")
            }
            .navigationTitle("Notes")
            .onAppear {
                load() //load all the notes
            }
        }
    }
}

#Preview {
    ContentView()
}
