function rails_alias --description 'Add alias for rails to use binstubs'
  if [ -f "(pwd)/bin/rails" ]
    bin/rails $argv
  else
    bundle exec rails $argv
  end
end
