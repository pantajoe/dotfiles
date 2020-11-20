function rails_server_alias --description 'Add alias for rails s to use binstubs'
  if [ -f "(pwd)/bin/rails" ]
    bin/rails s $argv
  else
    bundle exec rails s $argv
  end
end
