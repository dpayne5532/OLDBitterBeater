//
//  ContentView.swift
//  OLDBitterBeater
//
//  Created by Dan Payne on 1/8/23.
//

import SwiftUI

struct SheetView: View {
  @Environment(\.dismiss) var dismiss
  @State private var activities = [
    "Clean the bathroom",
    "Take a brief walk",
    "Clean out the fridge",
    "Find a new podcast",
    "Dance around the room like an idiot",
    "Vacuum a random room",
    "Go for a drive",
    "Take a quick shower",
    "Clip our toenails",
    "Wipe down the countertops",
    "Call your mother"
  ]
  
  var body: some View {
    ZStack {
      VStack {
        Spacer()
        Text("Don't be so hard on yourself!")
        Text("Finding the right person takes time!")
        Spacer()
        
        let ind = Int.random(in: 0..<activities.count)
        
        Text("Just to take our mind off of things, let's ")
        Text("\(activities[ind])!")
          .multilineTextAlignment(.center)
          .font(.title2)
          .padding()
        Spacer()
        Button(action: {
          dismiss()
        }) {
          Text("Dismiss")
            .font(.title)
            .frame(width: 150, height: 75)
            .foregroundColor(.white)
            .padding()
            .background(Color("obbPurp"))
            .clipShape(Capsule())
            .padding()
        }
        
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
          .font(.title2)
        Text("Maybe we work on you for a bit?")
          .font(.title2)
        Spacer()
        
        let ind = Int.random(in: 0..<activities.count)
        
        Text("Let's")
          .font(.title3)
          .multilineTextAlignment(.center)
        Text("\(activities[ind])!")
          .multilineTextAlignment(.center)
          .font(.title2)
          .padding()
        Spacer()
        
        
        Button(action: {
          dismiss()
        }) {
          Text("Dismiss")
            .font(.title)
            .frame(width: 150, height: 75)
            .foregroundColor(.white)
            .padding()
            .background(Color("obbPurp"))
            .clipShape(Capsule())
            .padding()
        }
        
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
        Image("logo")
          .resizable()
          .frame(width: 400, height: 300)
          .scaledToFit()
          .clipShape(Capsule())
        
        Spacer()
        Text("Who are you \n frustrated with?")
          .multilineTextAlignment(.center)
          .font(.largeTitle)
          .bold()
          .padding()
        Spacer()
        HStack {
          Button(action: {meSheet.toggle()}) {
            Text("Myself")
              .font(.title3)
              .frame(width: 150, height: 75)
              .padding()
              .background(Color("obbPurp"))
              .foregroundColor(.white)
              .clipShape(Capsule())
          }
          .sheet(isPresented: $meSheet) {
            SheetView()
          }
          
          Spacer()
          
          Button(action: {everyoneElseSheet.toggle()}) {
            Text("Everyone Else")
              .font(.title3)
              .frame(width: 150, height: 75)
              .padding()
              .background(Color("obbPurp"))
              .foregroundColor(.white)
              .clipShape(Capsule())
          }
          
          .sheet(isPresented: $everyoneElseSheet) {
            SheetViewEE()
          }
          
        }
        
        .padding()
        Text("")
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
