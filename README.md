My solutions to the problems at https://projecteuler.net/

Don't look if you haven't solved the problems yet. Even if you have, this probably isn't very interesting. 

[![My Badge](https://projecteuler.net/profile/gordo11231.png??)](https://projecteuler.net/progress=gordo11231)

## Structure

Each problem lives under `problems/problem-XXXX/` (zero-padded to four digits), with a `README.md` holding the problem statement and one subdirectory per language attempted. Any input data file the problem needs (e.g. `in.txt`, `p089_roman.txt`) sits at the problem root, one level above the language subdirectories, and solutions read it with a relative path such as `../in.txt`.

Run or test any solution with the top-level runner, which knows the run/test command for each language:

```
./execute.rb <problem#> <language> <run|test>
./execute.rb                          # interactive prompts
```

Shared, cross-problem helpers (prime sieves, permutation utilities, etc.) live under `shared/<language>/`, outside the `problems/` tree.

### Ruby — `ruby/`
- `solve.rb` — the solution as a plain function, executed when run directly (`if __FILE__ == $0`)
- `tc_solve.rb` — `Test::Unit` test case, `require_relative "solve"`
- Older problems predate the per-language subdirectory convention and place these two files directly under `problems/problem-XXXX/` with no `ruby/` folder; `execute.rb` falls back to that layout automatically.

### Python — `python/`
- `solve.py` — the solution, executed under `if __name__ == "__main__"`
- `test_solve.py` — `unittest.TestCase`, `from solve import ...`

### Go — `go/`
- `go.mod` — `module problem-XXXX`; run via `go run .`
- `solve.go` — the solution
- `solve_test.go` — tests, run via `go test ./...`

### Rust — `rust/`
- `Cargo.toml` / `Cargo.lock` — standard Cargo project; run via `cargo run`, tested via `cargo test`
- `src/main.rs` — the solution, with `#[test]`s alongside it

### Haskell — `haskell/`
- `solve.hs` — the solution, run via `runghc solve.hs`
- `test_solve.hs` — tests, run via `runghc test_solve.hs`
- Occasionally an extra named module (e.g. `FizzBuzz.hs`) holds logic imported by `solve.hs`

### C — `c/`
- `solve.h` / `solve.c` — the solution
- `main.c` — entry point, compiled together with `solve.c` (`cc solve.c main.c -o <bin>`)
- `test_solve.c` — tests, compiled with `solve.c` in place of `main.c`

### Lisp — `lisp/`
- `solve.lisp` — the solution, run via `sbcl --script solve.lisp`
- `test-solve.lisp` — tests (hyphenated, not underscored)
- Occasionally an extra named file (e.g. `fizz-buzz.lisp`) holds shared logic
