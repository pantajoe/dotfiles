function rspec_alias --description 'Add alias for rspec to use binstubs'
  if [ -f "(pwd)/bin/rspec" ]
    bin/rspec $argv
  else
    bundle exec rspec $argv
  end
end
