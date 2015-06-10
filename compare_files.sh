#!/bin/bash
FILES=$(find . -iname '.*' -type f -print | cut -d '/' -f 2)
for f in $FILES; do
  #echo "Processing $f file..."
  if diff $f ~/$f >/dev/null; then
    echo "$f is good" 
  else 
    echo "$f is mismatched"
    vimdiff $f ~/$f
  fi

  # take action on each file. $f store current file name
  
done
