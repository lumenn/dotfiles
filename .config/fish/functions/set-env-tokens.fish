#!/usr/bin/fish
function set-env-tokens
  echo -n "Enter KeePassXC password: "
  read -s KEEPASS_PASSWORD

  # Retrieve OpenAI API token
  set OPENAI_API_KEY (echo $KEEPASS_PASSWORD | keepassxc-cli show ~/gdrive/KeepassXC/Secure.kdbx 'Chat Gpt' -a API_TOKEN)
  
  # Retrieve Anthropic API token
  set ANTHROPIC_API_KEY (echo $KEEPASS_PASSWORD | keepassxc-cli show ~/gdrive/KeepassXC/Secure.kdbx 'claude.ai' -a API_TOKEN)

  # Export the API keys
  export OPENAI_API_KEY
  export ANTHROPIC_API_KEY

  # Clean up
  set -e KEEPASS_PASSWORD
end
