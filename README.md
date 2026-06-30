# 2026

 219  echo ".terraform/" >> .gitignore
  220  echo "*.tfstate" >> .gitignore
  221  echo "*.tfstate.*" >> .gitignore
  222  git add .
  223  git commit -m "fix terraform files"
  224  git push -u origin main --force
  225  git rm -r --cached .terraform
  226  echo ".terraform/" >> .gitignore
  227  echo "*.tfstate" >> .gitignore
  228  echo "*.tfstate.*" >> .gitignore
  229  git add .
  230  git commit -m "fix terraform files"
  231  git push -u origin main --force
  232  rm -rf .git
  233  git init
  234  vi nano gitignore
  235  vi gitignore
  236  git add .
  237  git commit -m "clean terraform upload"
  238  git remote add origin git@github.com:pawarrushikesh/2026.git
  239  git branch -M main
  240  git push -u origin main --force
