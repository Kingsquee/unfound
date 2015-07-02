// 'solution' a: Commenting this out makes compilation work.
extern crate foo;

// 'solution' b: Uncommenting this and the field below makes compilation work
//use foo::bar;

pub struct State {
    pub a: usize
}

impl State {
    pub fn new() -> State {
        State {
            a: 0
            //'solution' b: Uncommenting this and the 'use genmesh::generators::etc' above makes compilation work
            //a: bar()
        }
    }
}