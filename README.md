# My Site

[Zola](https://www.getzola.org) port of the [shibui](https://github.com/ntk148v/shibui)
Hugo theme (MIT, see `LICENSE-shibui`). Zero JS, one stylesheet.

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

## Layout

    config.toml            site config, menu (extra.menu), tags taxonomy
    content/               markdown
    templates/             base, page, section, tags/, partials/, components.html
    static/css/main.css    shibui stylesheet (unchanged)
    static/css/custom.css  your overrides (font, colour knobs, dark mode)
    static/fonts/         IBM Plex Mono woff2 (SIL OFL), self-hosted

## Notes

- Japanese accents are kept to a few places: site title, the home greeting and the footer.
  Wrap new Japanese text in `<span lang="ja">` so browsers pick the right glyphs. Plex Mono
  has no kana/kanji, so those fall back to system fonts (stack in `static/css/custom.css`).
- Colours: warm washi paper in light mode, warm charcoal in dark, one vermilion accent
  (`--accent` in `custom.css`).

- Zola 0.23 runs Tera over Markdown bodies, so literal `{{` / `{%` in a post
  must be wrapped in `{% raw %}...{% endraw %}`.
- Code highlighting uses `style = "class"`; Zola generates
  `giallo-light.css` / `giallo-dark.css`, linked in `partials/head.html`.
- Change `base_url` in `config.toml` before deploying (CI overrides it for Pages).
- Diagrams: wrap Mermaid source in a `mermaid` component (see `templates/components.html`).
- Not ported from the Hugo theme: Disqus comments, image `<figure>` render hook,
  heading `manual-number` class (Zola has no render hooks).
