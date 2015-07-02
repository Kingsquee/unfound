extern crate state;
use state::State;

extern crate genmesh;
use genmesh::generators::{Plane, SharedVertex};

pub fn execute(state: &mut State) {
    let plane = Plane::subdivide(256, 256);
    state.a = plane.shared_vertex_count();
    println!("{}", state.a);
}