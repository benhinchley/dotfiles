function attach --wraps='tmux new -ADs' --description 'alias attach=tmux new -ADs'
  tmux new -ADs $argv; 
end
