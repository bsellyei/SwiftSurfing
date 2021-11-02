//
//  RatingSummaryView.swift
//  SwiftSurfing
//
//  Created by Séllyei Bence on 2021. 10. 25..
//

import SwiftUI

struct RatingSummaryView: View {
    @Binding var ctx: RatingSummaryViewContext
    
    var scaleFactor = 0.57
    
    var body: some View {
        GeometryReader { geometry in
            HStack {
                Text("\(ctx.average)")
                    .font(.system(size: geometry.size.height > geometry.size.width ? geometry.size.width * 0.3 : geometry.size.height * 0.3))
                
                VStack {
                    HStack {
                        Text("5")
                        Image(systemName: "star.fill")
                        
                        Rectangle()
                            .frame(width: geometry.size.width * CGFloat(scaleFactor) * (CGFloat(ctx.fiveRatingPercent) + CGFloat(0.5)), height: 10)
                            .foregroundColor(.gray)
                        
                        Spacer()
                    }
                    
                    HStack {
                        Text("4")
                        Image(systemName: "star.fill")
                        
                        Rectangle()
                            .frame(width: geometry.size.width * CGFloat(scaleFactor) * (CGFloat(ctx.fourRatingPercent) + CGFloat(0.5)), height: 10)
                            .foregroundColor(.gray)
                        
                        Spacer()
                    }
                    
                    HStack {
                        Text("3")
                        Image(systemName: "star.fill")
                        
                        Rectangle()
                            .frame(width: geometry.size.width * CGFloat(scaleFactor) * (CGFloat(ctx.threeRatingPercent) + CGFloat(0.5)), height: 10)
                            .foregroundColor(.gray)
                        
                        Spacer()
                    }
                    
                    HStack {
                        Text("2")
                        Image(systemName: "star.fill")
                        
                        Rectangle()
                            .frame(width: geometry.size.width * CGFloat(scaleFactor) * (CGFloat(ctx.twoRatingPercent) + CGFloat(0.5)), height: 10)
                            .foregroundColor(.gray)
                        
                        Spacer()
                    }
                    
                    HStack {
                        Text("1")
                        Image(systemName: "star.fill")
                        
                        Rectangle()
                            .frame(width: geometry.size.width * CGFloat(scaleFactor) * (CGFloat(ctx.oneRatingPercent) + CGFloat(0.5)), height: 10)
                            .foregroundColor(.gray)
                        
                        Spacer()
                    }
                }
            }
            .padding()
        }
    }
}

struct RatingSummaryView_Previews: PreviewProvider {
    static var previews: some View {
        var ctx = RatingSummaryViewContext(average: 4, oneRatingPercent: 0.0, twoRatingPercent: 0.1, threeRatingPercent: 0.2, fourRatingPercent: 0.3, fiveRatingPercent: 0.4)
        
        //RatingSummaryView(ctx: ctx)
    }
}
