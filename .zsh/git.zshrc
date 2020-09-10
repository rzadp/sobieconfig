if [[ "$OSTYPE" = darwin* ]]; then
  # macOS
  export GIT_EDITOR="/Applications/Komet.app/Contents/MacOS/Komet"
  git config --global core.editor "/Applications/Komet.app/Contents/MacOS/Komet"
else
  :
fi

git config --global user.email "roopert7@gmail.com"
git config --global user.name "rzadp"
