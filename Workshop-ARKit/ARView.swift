//
//  ContentView.swift
//  Workshop-ARKit
//
//  Created by David Romero on 2025-01-17.
//

import SwiftUI
import RealityKit

struct ARView : View {

    var body: some View {
        if #available(iOS 18.0, *) {
            RealityView { content in
                
                //Load the .usdz model asynchronously
                if let discoBall = try? await ModelEntity(named: "Disco_ball_with_colored_lights") {
                    content.add(discoBall)
                    
                    discoBall.position = [0, 0.05, 0] // Set the position of the disco ball
                    
                    // Create horizontal plane anchor for the content
                    let anchor = AnchorEntity(.plane(.horizontal, classification: .any, minimumBounds: SIMD2<Float>(0.2, 0.2)))
                    anchor.addChild(discoBall)
                    
                    // Add the horizontal plane anchor to the scene
                    content.add(anchor)
                    
                    content.camera = .spatialTracking
                }
                
                
                
            }
            .edgesIgnoringSafeArea(.all)
        } else {
            // Fallback on earlier versions
        }
    }

}

#Preview {
    ARView()
}
