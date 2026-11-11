# My Site

Needs **Zola >= 0.23** (Tera 2: components, no macros/shortcodes).

## Run

    nix develop          # or have zola on PATH
    zola serve --drafts  # http://127.0.0.1:1111

    nix build            # static site in ./result
    nix run              # same as zola serve --drafts

(With flakes inside a git repo, `git add flake.nix` before the first `nix` command.)

## Write

    ./new-post.sh my-post

Posts are drafts until you delete `draft = true`.
