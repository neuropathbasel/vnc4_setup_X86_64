#!/bin/bash
#
echo "This will push everything in "`pwd`" to GitHub..."
git remote set-url origin git@github.com:neuropathbasel/vnc4_setup_X86_64
git add -A
git commit -m "update"
git push
