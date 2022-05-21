//
//  Vertex.swift
//  GGBLProj
//
//  Created by Drew Scheffer on 5/21/22.
//

import Foundation

struct Vertex {
    var idx: Int;
    var x: Int;
    var y: Int;
    var connected: [Int]; // Array of indexes
    
    var parent: Int?;
    var visited: Bool = false;
    var priority: Double = 0;
    var dist_to_start: Double = 1000000;
}
