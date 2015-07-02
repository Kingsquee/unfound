./state/state.rs references a library (in this case, foo), but doesn't use it
```
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
```

./process/process.rs also references the library, but uses it
```
extern crate state;
use state::State;

extern crate foo;
use foo::bar;

pub fn execute(state: &mut State) {
    state.a = bar();
    println!("{}", state.a);
}
```

./kernel/kernel.rs just links them together
```
extern crate state;
extern crate process;

use state::State;

fn main() {
    let mut state = State::new();
    process::execute(&mut state);
}
```

when we execute ./build.sh (calls rustc/cargo and links the libraries with LD_LIBRARY_PATH)
```
[kingsley@thinkpad cargo]$ ./build.sh
Compiling state
   Compiling foo v0.1.0 (file://.../cargo/state)
   Compiling state v0.1.0 (file://.../cargo/state)
Compiling process
Compiling kernel
error: linking with `cc` failed: exit code: 1
note: "cc" "-Wl,--as-needed" "-m64" "-L" "/usr/local/lib/rustlib/x86_64-unknown-linux-gnu/lib" "-o" "kernel" "kernel.o" "-Wl,--whole-archive" "-lmorestack" "-Wl,--no-whole-archive" "-Wl,--gc-sections" "-pie" "-nodefaultlibs" "-L" ".../cargo/process" "-lprocess" "-L" ".../cargo/state/target/debug" "-lstate" "-L" "/usr/local/lib/rustlib/x86_64-unknown-linux-gnu/lib" "-lstd-4e7c5e5c" "-L" "./../state/target/debug/" "-L" "./../state/target/debug/deps/" "-L" "./../process/" "-L" "/usr/local/lib/rustlib/x86_64-unknown-linux-gnu/lib" "-L" ".../cargo/kernel/.rust/lib/x86_64-unknown-linux-gnu" "-L" ".../cargo/kernel/lib/x86_64-unknown-linux-gnu" "-Wl,--whole-archive" "-Wl,-Bstatic" "-Wl,--no-whole-archive" "-Wl,-Bdynamic" "-ldl" "-lpthread" "-lrt" "-lgcc_s" "-lpthread" "-lc" "-lm" "-lcompiler-rt"
note: .../cargo/process/libprocess.so: undefined reference to `bar::h0727e0debb361b1deaa'
collect2: error: ld returned 1 exit status

error: aborting due to previous error
That should have printed 12...
```

If we remove 'extern crate foo;' from state.rs, it will build fine.
```
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

Interestingly, if we *use* foo in state.rs, it will also build fine!
```
extern crate foo;

use foo::bar;

pub struct State {
    pub a: usize
}

impl State {
    pub fn new() -> State {
        State {
            a: bar()
        }
    }
}
```

Why this occurs, I have no idea, but apparently plugin=true is not enough™. Help would be greatly appreciated.