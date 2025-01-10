//
//  ContentView.swift
//  TestProject
//
//  Created by Trey on 1/8/25.
//

import SwiftUI

struct ContentView: View {
    @State var personVM: PersonVM
    
    init(getAllPeopleUseCaseService: GetAllPeopleUseCaseProtocol) {
        _personVM = State(wrappedValue: PersonVM(service: getAllPeopleUseCaseService))
    }
    
    var body: some View {
        NavigationStack(){
            List {
                ForEach(0 ..< 25) { index in
                    HStack(spacing: 4) {
                        Image(systemName: "person.circle")
                            .resizable()
                            .frame(width: 64, height: 64)
                        
                        VStack(alignment: .leading){
                            Text("Name")
                                .font(.system(size: 26, weight: .bold))
                            
                            Text("Status")
                                .font(.system(size: 18, weight: .semibold))
                        }
                    }
                }
                .listRowSeparator(.hidden)
            }
            .listStyle(.plain)
            .navigationTitle("Characters")
        }
    }
}

#Preview {
    ContentView()
}
