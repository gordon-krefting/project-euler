# TODO

- Several `solve.py`/`solve.rb` files (e.g. problem-0001) open with a comment
  block that duplicates the problem's `README.md` text. Trim those down the
  way problem-0089 was done — drop the restated problem statement, keep just
  the shebang/imports.

- `.vscode/settings.json`'s `python.testing.cwd` is hardcoded to
  `problems/problem-0089/python` so pytest CodeLens/Test Explorer works for
  that one problem. It won't pick up other problems' tests until that path is
  updated by hand — repo-wide discovery isn't possible as-is since every
  problem reuses the same `solve`/`test_solve` module names (pytest can only
  have one such module loaded per session). Update the `cwd` when switching
  problems, or revisit giving each problem unique test module names/packaging
  to enable true repo-wide discovery.

- Problem 94 has a working Rust solution (verified answer: 518408346) but no
  root `README.md`, and the Ruby side isn't a real solution: `ruby/solve.rb`
  is unfinished (hardcoded `m > 20000` cutoff, no perimeter accumulator, no
  printed answer) and `ruby/solvex.rb` is a dead end (`is_heronian` always
  returns `false`, no accumulator either). Bring it up to the standard
  multi-language layout — add the README, and either finish `solve.rb`'s
  Pell's-equation approach or drop it in favor of a clean Ruby port of the
  Rust brute force.
