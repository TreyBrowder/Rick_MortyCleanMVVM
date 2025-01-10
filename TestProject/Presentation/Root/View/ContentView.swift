//
//  ContentView.swift
//  TestProject
//
//  Created by Trey on 1/8/25.
//

import SwiftUI

struct ContentView: View {
    @State var personVM: PersonVM
    
    init(personVM: PersonVM) {
        _personVM = State(wrappedValue: personVM)
    }
    
    var body: some View {
        NavigationStack(){
            List {
                ForEach(personVM.personArr, id: \.name) { person in
                    HStack(spacing: 4) {
                        Image(systemName: "person.circle")
                            .resizable()
                            .frame(width: 64, height: 64)
                        
                        VStack(alignment: .leading){
                            Text(person.name)
                                .font(.system(size: 26, weight: .bold))
                            
                            Text(person.status)
                                .font(.system(size: 18, weight: .semibold))
                        }
                    }
                }
                .listRowSeparator(.hidden)
            }
            .listStyle(.plain)
            .navigationTitle("Characters")
        }
        .task {
            await personVM.getAllCharacter()
        }
    }
}
