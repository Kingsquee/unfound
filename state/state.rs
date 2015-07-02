extern crate genmesh; // Removing this makes compilation work.

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