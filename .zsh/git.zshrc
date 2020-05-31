if [[ "$OSTYPE" = darwin* ]]; then
  # macOS
  export GIT_EDITOR="/Applications/Komet.app/Contents/MacOS/Komet"
  git config --global core.editor "/Applications/Komet.app/Contents/MacOS/Komet"
else
  :
fi
