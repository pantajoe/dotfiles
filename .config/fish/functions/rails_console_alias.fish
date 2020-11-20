function rails_console_alias --description 'Add alias for rails c to use binstubs'
  if [ -f "(pwd)/bin/rails" ]
    bin/rails c $argv
  else
    bundle exec rails c $argv
  end
end
