
function setupVolta() {
  echo "use Volta!"
  export VOLTA_HOME="$HOME/.volta"
  export PATH="$VOLTA_HOME/bin:$PATH"
}

function setupNvm() {
  echo "use nvm!"
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
}

function selectNodeManager() {
  echo "Which do you want to use The node.js platform?"
  echo ""
  PS3_OLD=$PS3
  PS3="Please enter a number?# "
  COLUMNS=12
  select option in "volta" "nvm"; do
    case $REPLY in
      "1" )
        setupVolta
        break
        ;;
      "2" )
        setupNvm
        break
        ;;
      * )
        echo "Invalid select type. please enter again..."
        break
        ;;
    esac
  done
  PS3=$PS3_OLD
}

node_check=$(node-manager-check)

case $node_check in
  "volta" )
    setupVolta
    ;;
  "nvm" )
    setupNvm
    ;;
  * )
    selectNodeManager
    ;;
esac
