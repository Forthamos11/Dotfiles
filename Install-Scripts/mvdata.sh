#!/bin/bash

# Set variables
DEST_DIR="$HOME"
EXCLUDED_DIRS=(".github" "Install-Scripts")

# Loop through all items in the current directory
for item in *; do
  # Get the base name of the item (filename or directory name)
  base_name=$(basename "$item")

  # Skip excluded directories
  skip=false
  for excluded_dir in "${EXCLUDED_DIRS[@]}"; do
    if [ "$base_name" = "$excluded_dir" ]; then
      skip=true
      break
    fi
  done
  if $skip; then
    continue
  fi

  # Skip the script itself
  if [ "$item" = "$(basename "$0")" ]; then
    continue
  fi

  # Construct the full destination path
  destination="$DEST_DIR/$base_name"

  # Check if the destination is different from the source
  if [ "$PWD/$item" != "$destination" ]; then

    # Check if a file or directory with the same name already exists in the destination. If so, prompt the user.
    if [ -e "$destination" ]; then
        read -r -p "A file or directory named '$base_name' already exists in $DEST_DIR. Overwrite? (y/N) " response
        if [[ ! "$response" =~ ^([yY][eE][sS]|[yY])$ ]]; then
            echo "Skipping '$base_name'."
            continue
        fi
        rm -rf "$destination" # Force remove the existing file or directory
    fi

    # Move the item
    if mv "$item" "$DEST_DIR"; then
      echo "Moved '$base_name' to '$DEST_DIR'."
    else
      echo "Error moving '$base_name' to '$DEST_DIR'."
      echo "Source: $item"
      echo "Destination: $DEST_DIR"
    fi
  else
    echo "'$base_name' is already in '$DEST_DIR'. Skipping."
  fi
done

echo "Finished processing files and folders."