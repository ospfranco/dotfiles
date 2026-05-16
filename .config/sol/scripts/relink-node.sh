# name: Relink Node
# icon: 🔗

#!/bin/bash

set -euo pipefail

TARGET="/usr/local/bin/node"

if [[ -L "$TARGET" ]]; then
	rm "$TARGET"
elif [[ -e "$TARGET" ]]; then
	echo "$TARGET exists but is not a symlink" >&2
	exit 1
fi

SOURCE="$(which node 2>/dev/null || true)"

if [[ -z "$SOURCE" ]]; then
	echo "node was not found in PATH after removing $TARGET" >&2
	exit 1
fi

ln -s "$SOURCE" "$TARGET"

echo "Linked $TARGET -> $SOURCE"
