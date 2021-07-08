//
//  ContentView.swift
//  myFirstProject
//
//  Created by Rusu, Vlad on 7/7/21.
//

import SwiftUI

struct ContentView: View {
  
  @State var title = "Play"
  @State var player1 = "three"
  @State var player2 = "two"
  @State var score1 = 0
  @State var score2 = 0
  
  
  func generateDices() -> (String,Int)
  {
    let val = Int.random(in: 1...6)
    var diceText: String
    switch val {
      case 1:
      diceText="one"
      case 2:
        diceText="two"
      case 3:
        diceText="three"
      case 4:
        diceText="four"
      case 5:
        diceText="five"
      case 6:
        diceText="six"
      default:
        diceText="error"
        
    }
    return (diceText,val)
    

  }
  
    var body: some View {
       
        ZStack {
            Image("photo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .ignoresSafeArea()
          
          VStack {
            Text(title)
              .font(.title2)
              .foregroundColor(Color.white)
              .bold()
              .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            HStack{
              Spacer()
              Image(player1)
              Spacer()
              Image(player2)
              Spacer()
              
            }
            
            
            
            HStack{
              Spacer()
              VStack{
              Text("Player 1")
                .font(.title2)
                .foregroundColor(Color.white)
                .bold()
                .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                Text(String(score1))
                  .font(.title)
                  .foregroundColor(Color.white)
                  .bold()
                  .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                
                
              }
              
              //button instance with closure
              VStack {
                Button("Play",action: {
                  //Generate 2 random numbers for the dices
                  var val1,val2 : Int
                  (player1,val1) = generateDices()
                  (player2,val2) = generateDices()
                  if val1 > val2
                  {score1 += 1}
                  else
                  if val1 < val2
                  {score2 += 1}
              if score1 >= 5
                  {title="Player 1 won"}
              if score2 >= 5
                  {title="Player 2 won"}
                })
                .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .foregroundColor(/*@START_MENU_TOKEN@*/Color.orange/*@END_MENU_TOKEN@*/)
                .blur(radius: /*@START_MENU_TOKEN@*/0.5/*@END_MENU_TOKEN@*/)
              }
             
              
              Spacer()
              //second player name and score
              VStack{
              Text("Player 2")
                .font(.title2)
                .foregroundColor(Color.white)
                .bold()
                .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                
              Text(String(score2))
                  .font(.title)
                  .foregroundColor(Color.white)
                  .bold()
                  .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                
              }
              Spacer()
              
            }
              
          }
          
               
         
        }
       
        
    }
  
  
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                
           
        }
    }
}
