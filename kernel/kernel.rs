extern crate state;
extern crate process;

use state::State;

fn main() {
    let mut state = State::new();
    process::execute(&mut state);
}