//
//  ContentView.swift
//  OLDBitterBeater
//
//  Created by Dan Payne on 1/8/23.
//

import SwiftUI

struct SheetView: View {
  @Environment(\.dismiss) var dismiss
  @State private var activities = ["Clean the bathroom", "Take a brief walk", "Clean out the fridge", "Find a new podcast", "Dance around the room like an idiot", "Vacuum a random room"]
  
  var body: some View {
    ZStack {
      VStack {
        Spacer()
        Text("Don't be so hard on yourself!")
        Text("Finding the right person takes time!")
        Spacer()
        
        let ind = Int.random(in: 0..<activities.count)
        
        Text("Just to take our mind off of things, why don't we ")
        Text("\(activities[ind])!")
        Spacer()
        Button("Thanks!") {
          
          dismiss()
        }
        .font(.title)
        .foregroundColor(.white)
        .padding()
        .background(Color(.systemBlue))
        .clipShape(Capsule())
        .padding()
      }
    }
  }
}

struct SheetViewEE: View {
  @Environment(\.dismiss) var dismiss
  @State private var activities = ["Clean the bathroom!", "Take a brief walk!", "Clean out the fridge!", "Find a new podcast", "Dance around the room like an idiot", "Vacuum a random room"]
  var body: some View {
    ZStack {
      VStack {
        Spacer()
        Text("Actually, it's probably not everyone else")
        Text("Maybe we work on you for a bit?")
        Spacer()
        
        let ind = Int.random(in: 0..<activities.count)
        
        Text("Let's \(activities[ind])!")
        Spacer()
        Button("Thanks!") {
          
          dismiss()
        }
        .font(.title)
        .foregroundColor(.white)
        .padding()
        .background(Color(.systemBlue))
        .clipShape(Capsule())
        .padding()
      }
    }
  }
}




struct ContentView: View {
  
  @State private var meSheet = false
  @State private var everyoneElseSheet = false
  
  var body: some View {
    ZStack {
      
      VStack {
        Spacer()
        Text("Who are you frustrated with?")
          .font(.title2)
          .bold()
          .padding()
        Spacer()
        HStack {
          Button(action: {meSheet.toggle()}) {
            Text("Myself")
          } .frame(width: 150, height: 75)
            .padding()
            .background(Color(.systemBlue))
            .foregroundColor(.white)
            .clipShape(Capsule())
            .sheet(isPresented: $meSheet) {
              SheetView()
            }
          
          Spacer()
          
          Button(action: {everyoneElseSheet.toggle()}) {
            Text("Everyone Else")
          } .frame(width: 150, height: 75)
            .padding()
            .background(Color(.systemBlue))
            .foregroundColor(.white)
            .clipShape(Capsule())
            
            .sheet(isPresented: $everyoneElseSheet) {
              SheetViewEE()
            }
          
        }
        
        .padding()
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
