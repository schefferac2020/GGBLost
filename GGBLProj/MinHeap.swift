//
//  MinHeap.swift
//  GGBLProj
//
//  Created by Drew Scheffer on 5/21/22.
//

import Foundation

class MinHeap{
    var heap: [Vertex] = [];
    
    //Inserts a vertex into the min heap
    func insert(new_element: Vertex) -> Void {
        heap.append(new_element)
        var k = heap.count - 1;
    
        //Sift up while not at top and it's smaller than the parent
        while (k > 0 && heap[k].priority < heap[Int((k-1)/2)].priority){
            //swap the values
            swap_idx(ind1: k, ind2: Int((k-1)/2))
            k = Int((k-1)/2)
        }
    }
    
    //Extract the element on the top of the heap
    //NOTE: Assumes at least 1 element in heap
    func extract() -> Int {
        //Swap last element with first element
        swap_idx(ind1: 0, ind2: heap.count - 1)
        let res = heap.popLast()
        
        var k = 0
        //Sift Down
        while (2*k + 1 < heap.count){
            var ind = 2*k + 1; //Start out as left child
            if (ind + 1 < heap.count && heap[ind+1].priority < heap[ind].priority){
                ind += 1; //We want to swap with right instead if it's smaller than left
            }
            //if k is smaller than both, we want to break
            if (heap[k].priority <= heap[ind].priority){
                break;
            }
            swap_idx(ind1: k, ind2: ind)
            k = ind;
        }
        return res!.idx
    }
    
    func count() -> Int {
        return heap.count;
    }
    
    
    //Swaps index of heap array
    private func swap_idx(ind1: Int, ind2: Int){
        let temp: Vertex = heap[ind1]
        heap[ind1] = heap[ind2]
        heap[ind2] = temp
    }
}
