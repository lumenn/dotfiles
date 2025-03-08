#!/usr/bin/fish
function set-env-tokens
  echo -n "Enter KeePassXC password: "
  read -s KEEPASS_PASSWORD

  # Retrieve both API tokens in one command
  set API_KEYS (echo $KEEPASS_PASSWORD | keepassxc-cli show ~/gdrive/KeepassXC/Secure.kdbx 'Chat Gpt' -a API_TOKEN; echo $KEEPASS_PASSWORD | keepassxc-cli show ~/gdrive/KeepassXC/Secure.kdbx 'claude.ai' -a API_TOKEN)

  # Split the output into separate variables
  set OPENAI_API_KEY (echo $API_KEYS | head -n 1)
  set ANTHROPIC_API_KEY (echo $API_KEYS | tail -n 1)

  # Export the API keys
  export OPENAI_API_KEY
  export ANTHROPIC_API_KEY

  set -e KEEPASS_PASSWORD
end
