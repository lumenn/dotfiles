#!/usr/bin/fish
function set-env-tokens
  export OPENAI_API_KEY="$(keepassxc-cli show ~/gdrive/KeepassXC/Secure.kdbx -a API_TOKEN 'Chat Gpt')"
end
