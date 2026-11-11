#!/usr/bin/env bash
# Usage: ./new-post.sh my-post-slug
set -euo pipefail

slug="${1:?usage: $0 <slug>}"
file="content/posts/${slug}.md"
[ -e "$file" ] && { echo "$file already exists" >&2; exit 1; }

title="$(echo "$slug" | tr '-' ' ' | sed 's/\b\(.\)/\u\1/g')"
cat > "$file" <<POST
+++
title = "${title}"
date = $(date +%F)
draft = true
[taxonomies]
tags = []
+++

POST
echo "created $file (draft; preview with: zola serve --drafts)"
