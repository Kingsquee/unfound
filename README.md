This is a simplified version of Worldsong's architecture, which demonstrates a linking issue I'm dealing with.

./state/state.rs:
```
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
```

./process/process.rs:
```
extern crate state;
use state::State;

extern crate genmesh;
use genmesh::generators::{Plane, SharedVertex};

pub fn execute(state: &mut State) {
    let plane = Plane::subdivide(256, 256);
    state.a = plane.shared_vertex_count();
    println!("{}", state.a);
}
```

./kernel/kernel.rs:
```
extern crate state;
extern crate process;

use state::State;

fn main() {
    let mut state = State::new();
    process::execute(&mut state);
}
```

./build.sh
```
[.../]$ ./build.sh
Compiling state
   Compiling genmesh v0.2.1
   Compiling state v0.1.0 (.../state)
Compiling process
Compiling kernel
error: linking with `cc` failed: exit code: 1
note: "cc" "-Wl,--as-needed" "-m64" "-L" "/usr/local/lib/rustlib/x86_64-unknown-linux-gnu/lib" "-o" "kernel" "kernel.o" "-Wl,--whole-archive" "-lmorestack" "-Wl,--no-whole-archive" "-Wl,--gc-sections" "-pie" "-nodefaultlibs" "-L" ".../process" "-lprocess" "-L" ".../state/target/debug" "-lstate" "-L" "/usr/local/lib/rustlib/x86_64-unknown-linux-gnu/lib" "-lstd-4e7c5e5c" "-L" "./../state/target/debug/" "-L" "./../state/target/debug/deps/" "-L" "./../process" "-L" "/usr/local/lib/rustlib/x86_64-unknown-linux-gnu/lib" "-L" ".../kernel/.rust/lib/x86_64-unknown-linux-gnu" "-L" ".../kernel/lib/x86_64-unknown-linux-gnu" "-Wl,--whole-archive" "-Wl,-Bstatic" "-Wl,--no-whole-archive" "-Wl,-Bdynamic" "-ldl" "-lpthread" "-lrt" "-lgcc_s" "-lpthread" "-lc" "-lm" "-lcompiler-rt"
note: .../process/libprocess.so: undefined reference to `plane::Plane::subdivide::hc36fcf3d140f510azRa'
.../process/libprocess.so: undefined reference to `plane::Plane.SharedVertex$LT$$LP$f32$C$$u20$f32$RP$$GT$::shared_vertex_count::h6d8003af9d6060b16Va'
collect2: error: ld returned 1 exit status

error: aborting due to previous error
That should have printed 66049. Try removing the 'extern crate genmesh;' from state.rs, and run this again.
```