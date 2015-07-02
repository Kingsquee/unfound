extern crate foo;

pub struct State {
    pub a: usize
}

impl State {
    pub fn new() -> State {
        State {
            a: 0
        }
    }
}