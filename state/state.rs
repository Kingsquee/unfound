// 'solution' a: Commenting this out makes compilation work.
extern crate genmesh;

// 'solution' b: Uncommenting this and the field below makes compilation work
// use genmesh::generators::{Plane, SharedVertex};

pub struct State {
    pub a: usize
}

impl State {
    pub fn new() -> State {
        State {
            a: 0
            //'solution' b: Uncommenting this and the 'use genmesh::generators::etc' above makes compilation work
            //a: Plane::subdivide(256, 256).shared_vertex_count()
        }
    }
}