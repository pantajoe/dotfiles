function rake_alias --description 'Add alias for rake to use binstubs'
  if [ -f "(pwd)/bin/rake" ]
    bin/rake $argv
  else
    bundle exec rake $argv
  end
end
