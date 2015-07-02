extern crate state;
use state::State;

extern crate foo;
use foo::bar;

pub fn execute(state: &mut State) {
    state.a = bar();
    println!("{}", state.a);
}