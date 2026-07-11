# project-euler

## Structure

- Single-language problems: files live directly in `problems/problem-XXXX/` (e.g. `solve.rb`, `tc_solve.rb`).
- Multi-language problems: each language gets its own subdir (`ruby/`, `python/`, `go/`, `rust/`), plus a root `README.md` holding the full problem statement. Code file headers should be trimmed to just a title/problem number — don't restate the problem text in code comments; that's what the README is for.
- Ruby tests: `tc_solve.rb`, using `Test::Unit`. Run with `ruby tc_solve.rb`.
- Python tests: `test_solve.py`, using `unittest` (also pytest-compatible). Run with `python3 -m pytest` or `python3 -m unittest`.

## Linting

- Ruby: `.rubocop.yml` at the repo root defines the house style. Run `rubocop <path>` on any Ruby file you touch; `rubocop -A` autocorrects most mechanical issues, but check what's left by hand (globals, naming, etc.).
- Go: no repo-wide lint config, but `golangci-lint` is installed locally — run `golangci-lint run ./...` inside the problem's `go/` dir.
- Rust: no repo-wide lint config, but `cargo clippy` is installed locally.
- `.vscode/` is gitignored — it's local editor config only and does not sync via git, so don't expect settings there to travel with the repo across machines.

## Workflow

- Don't implement code unless explicitly asked to. If asked to "write tests" for a stub, write the tests and stop there — leave them red/failing rather than also implementing the function to make them pass.
- `TODO.md` at the repo root tracks known follow-up items and cleanup debt. Check it for context, and add to it if you notice something out of scope for the current task.
