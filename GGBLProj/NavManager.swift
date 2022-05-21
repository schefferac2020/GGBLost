//
//  Search.swift
//  GGBLProj
//
//  Created by Drew Scheffer on 5/21/22.
//

import Foundation
class NavManager {
    var verticies: [Vertex] = [
        Vertex(idx: 0, x: 0, y: 0, connected: [1, 2]),
        Vertex(idx: 1, x: 5, y: 0, connected: [0, 3, 4, 6]),
        Vertex(idx: 2, x: 0, y: 5, connected: [0, 3, 6]),
        Vertex(idx: 3, x: 5, y: 5, connected: [1, 2, 5, 6]),
        Vertex(idx: 4, x: 20, y: 5, connected: [1, 5, 6]),
        Vertex(idx: 5, x: 20, y: 10, connected: [3, 4, 6]),
        Vertex(idx: 6, x: 20, y: 0, connected: [0, 1, 2, 3, 4, 5]),
    ]
    
    let priority_queue = MinHeap()
    
    let start_ind = 0;
    let end_ind = 6;
    
    func loadVerticies(){
        //TODO: Maybe
    }
    
    //Runs the A Star Algorithm on the Verticies
    //Returns: Path of vertices
    func RunAStar() -> [Int] {
        verticies[start_ind].dist_to_start = 0.0
        priority_queue.insert(new_element: verticies[start_ind])
        
        
        var message = "iterating";
        while (message == "iterating"){
            message = iterate_graph_search()
        }
        
        if message == "succeeded" {
            return get_final_path()
        }
        
        return []
        
    }
    
    //MARK: - Private
    
    private func get_final_path() -> [Int]{
        var path: [Int] = []
        var current_ind = end_ind
        path.append(current_ind)
        
        while (verticies[current_ind].parent != nil){
            current_ind = verticies[current_ind].parent!
            path.append(current_ind)
            
        }
        
        path.reverse()
        return path
        
    }
    
    private func iterate_graph_search() -> String {
        if (priority_queue.count() == 0){
            return "failed"
        }
        
        let curr_node_ind: Int = priority_queue.extract()
        verticies[curr_node_ind].visited = true
        
        //Check to see if this is the goal node
        if (curr_node_ind == end_ind){
            return "succeeded";
        }
        
        let neighbor_inds = verticies[curr_node_ind].connected
        for neighbor_ind in neighbor_inds {
            if (verticies[neighbor_ind].visited == true){
                continue
            }
            
            let dist_to_neighbor = get_dist_between(v1: verticies[curr_node_ind], v2: verticies[neighbor_ind])
            if (verticies[neighbor_ind].dist_to_start > verticies[curr_node_ind].dist_to_start + dist_to_neighbor){
                verticies[neighbor_ind].parent = verticies[curr_node_ind].idx
                verticies[neighbor_ind].dist_to_start = verticies[curr_node_ind].dist_to_start + dist_to_neighbor
                verticies[neighbor_ind].priority = verticies[neighbor_ind].dist_to_start + get_dist_between(v1: verticies[neighbor_ind], v2: verticies[end_ind])
                priority_queue.insert(new_element: verticies[neighbor_ind])
            }
        }

        return "iterating"
    }
    
    private func get_dist_between(v1: Vertex, v2: Vertex) -> Double {
        let first = Double((v1.x - v2.x)*(v1.x - v2.x))
        let second = Double((v1.y - v2.y)*(v1.y - v2.y))
        return sqrt(first + second)
    }
}
