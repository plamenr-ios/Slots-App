//
//  ContentView.swift
//  Slots
//
//  Created by Plamen Rupkolski on 14.05.20.
//  Copyright © 2020 Plamen Rupkolski. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var symbols = ["apple", "star", "cherry"]
    @State private var numbers = [0, 1, 2]
    @State private var numbersSecondRow = [0, 1, 2]
    @State private var numbersThirdRow = [0, 1, 2]
    @State private var backgrounds = [Color.white, Color.white, Color.white, Color.white, Color.white, Color.white, Color.white, Color.white, Color.white]
    
    
    @State private var credits = 1000
    @State private var spins = 0;
    @State private var wins = 0;
    @State private var winnings = 0;
    private var betAmount = 10
    
    var body: some View {
       
        ZStack{
            //Background
            Rectangle().foregroundColor(Color(red: 200/255, green:143/255, blue: 32/255))
                .edgesIgnoringSafeArea(.all)
            
            Rectangle()
                .foregroundColor(Color(red: 228/255, green:195/255, blue: 76/255))
                .rotationEffect(Angle(degrees: 45))
                .edgesIgnoringSafeArea(.all)
            
            VStack{
//                                Title
                HStack{

                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)

                    Text("SLOTS")
                        .bold()
                        .foregroundColor(.white)

                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                }.scaleEffect(2).padding(.all, 10)
                Spacer()
                //Credits
                Text("Credits: " + String(credits))
                    .foregroundColor(.black)
                    .padding(.all, 10) .background(Color.white.opacity(0.5))
                    .cornerRadius(20)
                
                //Cards
                HStack{
                    //First row
                    Spacer()
                    
                    CardView(symbol: $symbols[numbers[0]],
                             background: $backgrounds[0])
                    
                    CardView(symbol: $symbols[numbers[1]],
                             background: $backgrounds[1])
                    
                    CardView(symbol: $symbols[numbers[2]],
                             background: $backgrounds[2])
                    
                    
                    Spacer()
                }
                
                HStack{
                    //Second row
                    Spacer()
                    CardView(symbol: $symbols[numbersSecondRow[0]], background: $backgrounds[3])
                    
                    CardView(symbol: $symbols[numbersSecondRow[1]], background: $backgrounds[4])
                    
                    CardView(symbol: $symbols[numbersSecondRow[2]], background: $backgrounds[5])
                    Spacer()
                    
                }
                
                HStack{
                    //Third row
                    Spacer()
                    CardView(symbol: $symbols[numbersThirdRow[0]], background: $backgrounds[6])
                                   
                    CardView(symbol: $symbols[numbersThirdRow[1]], background: $backgrounds[7])
                                   
                    CardView(symbol: $symbols[numbersThirdRow[2]], background: $backgrounds[8])
                    Spacer()
                                   
                }
                Button(action: {
                    //Default white background color
                    self.backgrounds[0] = Color.white
                     self.backgrounds[1] = Color.white
                     self.backgrounds[2] = Color.white
                     self.backgrounds[3] = Color.white
                     self.backgrounds[4] = Color.white
                     self.backgrounds[5] = Color.white
                     self.backgrounds[6] = Color.white
                     self.backgrounds[7] = Color.white
                     self.backgrounds[8] = Color.white
                    var timesWon = 0;
                    
                    self.spins += 1
                    
                    //First Row Randomizer
                    self.numbers[0] = Int.random(in:0...self.symbols.count - 1)
                    self.numbers[1] = Int.random(in:0...self.symbols.count - 1)
                    self.numbers[2] = Int.random(in:0...self.symbols.count - 1)
                    
                    //Second row randomizer
                    self.numbersSecondRow[0] = Int.random(in:0...self.symbols.count - 1)
                    self.numbersSecondRow[1] = Int.random(in:0...self.symbols.count - 1)
                    self.numbersSecondRow[2] = Int.random(in:0...self.symbols.count - 1)
                    
                    //Third row randomizer
                    self.numbersThirdRow[0] = Int.random(in:0...self.symbols.count - 1)
                    self.numbersThirdRow[1] = Int.random(in:0...self.symbols.count - 1)
                    self.numbersThirdRow[2] = Int.random(in:0...self.symbols.count - 1)
                    
                    
                    //Check first row
                    if self.numbers[0] == self.numbers[1] && self.numbers[1] == self.numbers[2]{
                        
//                        //Won
//                        self.credits += self.betAmount * 5
//                        self.wins += 1
//                        self.winnings += self.betAmount * 5
                        timesWon += 1
                        
                        //Update backgrounds to green
                        self.backgrounds[0] = Color.green
                        self.backgrounds[1] = Color.green
                        self.backgrounds[2] = Color.green
                        
                    }
                    //Check second row
                    if self.numbersSecondRow[0] == self.numbersSecondRow[1] && self.numbersSecondRow[2] == self.numbersSecondRow[1]{
                        
                        //Won
                        timesWon += 1
                        
                        //Update backgrounds to green
                        self.backgrounds[3] = Color.green
                        self.backgrounds[4] = Color.green
                        self.backgrounds[5] = Color.green
                    }
                    //Check Third row
                    if self.numbersThirdRow[0] == self.numbersThirdRow[1] && self.numbersThirdRow[1] == self.numbersThirdRow[2]{
                        
                        //Won
                        timesWon += 1
                        
                        //Update backgrounds to green
                        self.backgrounds[6] = Color.green
                        self.backgrounds[7] = Color.green
                        self.backgrounds[8] = Color.green
                    }
                    //Check from top left to bottom right
                    if self.numbers[0] == self.numbersSecondRow[1] && self.numbersSecondRow[1] == self.numbersThirdRow[2]{
                        
                        //Won
                        timesWon += 1
                        
                        //Update backgrounds to green
                        self.backgrounds[0] = Color.green
                        self.backgrounds[4] = Color.green
                        self.backgrounds[8] = Color.green
                    }
                    //Check from top right to bottom left
                    if self.numbers[2] == self.numbersSecondRow[1] && self.numbersThirdRow[0] == self.numbersSecondRow[1]{
                        
                        //Won
                        timesWon += 1
                        
                        //Update backgrounds to green
                        self.backgrounds[2] = Color.green
                        self.backgrounds[4] = Color.green
                        self.backgrounds[6] = Color.green
                    }
                    
                    if timesWon >= 1{
                        self.credits += self.betAmount * 2 * timesWon
                        self.wins += 1
                        self.winnings += self.betAmount * 2 * timesWon
                    }
                    else{
                        self.credits -= self.betAmount
                        self.winnings -= self.betAmount
                    }
                    
                }) {
                    Text("Spin")
                        .bold()
                        .foregroundColor(.white)
                        .padding(.all, 10)
                        .padding([.leading, .trailing], 30)
                        .background(Color.pink)
                        .cornerRadius(20)
                }
                Text("10 credits")
                    .bold()
                Spacer()
                HStack{
                    Text("Spins: \n\t" + String(self.spins))
                        .bold()
                        .foregroundColor(.black)
                        .padding(.all, 10)
                        .background(Color.white.opacity(0.5))
                        .cornerRadius(20)
                    
                    Spacer()
                    Text("Total winnings: " + String(self.winnings))
                        .bold()
                        .foregroundColor(.black)
                        .padding(.all, 20)
                        .background(Color.white.opacity(0.5))
                        .cornerRadius(20)
                    Spacer()
                    Text("Wins: \n\t" + String(self.wins))
                        .bold()
                        .foregroundColor(.black)
                        .padding(.all, 10)
                        .background(Color.white.opacity(0.5))
                    .cornerRadius(20)
               
                }
                .padding(.leading)
                
                
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
