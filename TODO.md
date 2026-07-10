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
