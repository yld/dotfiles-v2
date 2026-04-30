eval "$(ssh-agent -s)"

for KEY in ~/.ssh/*id; do
  if [[ $OS == "OSX" ]]; then
    ssh-add --apple-use-keychain $KEY
  else
    ssh-add -k $KEY
  fi
done
# eval "$(keychain -q --eval ~/.ssh/*_id)"
# &> /dev/null
