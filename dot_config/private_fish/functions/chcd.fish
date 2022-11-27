function chcd --wraps='chezmoi cd' --description 'alias chcd=chezmoi cd'
  chezmoi cd $argv; 
end
