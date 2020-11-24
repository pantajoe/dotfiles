# Suppress Welcome Message
# set fish_greeting

# Prompt Configuration
starship init fish | source

# Commands
alias git-delete-merged-branches "git branch --merged | egrep -v '^\*|main|master|deployment_production|production|deployment_staging|staging|dev|development' | xargs git branch -d"
alias dotfiles "git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
alias docker-postgres "docker run --name postgres_instance -p 5432:5432 -e POSTGRES_PASSWORD=postgres postgres:12"
alias docker-mysql "docker run --name mysql_instance -p 3306:3306 -e MYSQL_ALLOW_EMPTY_PASSWORD=yes mysql:5.6"

# Rails Commands aliases
alias rails "rails_alias"
alias rspec "rspec_alias"
alias rake  "rake_alias"
alias rs    "rails_server_alias"
alias rc    "rails_console_alias"

# function regenerate-thesis -d "Regenerate Bachelor Thesis with Vossen LaTeX Template" -a tex_document
#   latexmk --shell-escape -pdf $tex_document
#   makeglossaries $tex_document
#   pdflatex --shell-escape $tex_document
#   latexmk --shell-escape -pdf $tex_document
# end

# Homebrew Services
# alias postgres-start "brew services start postgres"
# alias postgres-stop  "brew services stop postgres"
# alias mysql-start    "brew services start mysql"
# alias mysql-stop     "brew services stop mysql"
# alias search-start   "brew services start elasticsearch"
# alias search-stop    "brew services stop elasticsearch"

# set JAVA_HOME (/usr/libexec/java_home)

# Paths
# set -g fish_user_paths "/usr/local/opt/openssl/bin" $fish_user_paths
# set -g fish_user_paths "/usr/local/opt/mysql@5.7/bin" $fish_user_paths
# set -g fish_user_paths "/usr/local/opt/imagemagick@6/bin" $fish_user_paths
# set -g fish_user_paths "/Users/joe.pantazidis/.local/bin" $fish_user_paths
# set -g fish_user_paths "/Library/TeX/texbin" $fish_user_paths
# set -g fish_user_paths "/usr/local/opt/apache-maven-3.6.3/bin" $fish_user_paths

# Environment Variables
set -gx LANG "en_US.UTF-8"
set -gx KERL_BUILD_DOCS "yes"

# asdf VM (has to be at the bottom!)
source ~/.asdf/asdf.fish
