echo "\033[1m***** Change Default Shell to Fish *****\033[0m"
echo "$(which fish)" | sudo tee -a /etc/shells
chsh -s "$(which fish)"

echo "\033[1m***** Installing Re-Search Plug-In for Fish *****\033[0m"
git clone https://github.com/jbonjean/re-search.git ~/re-search
# cp ~/re-search/re_search.fish ~/.config/fish/functions/re_search.fish
make -C "~/re-search" CFLAGS=-DCHECK_DUPLICATES
mv ~/re-search/re-search /usr/local/bin/re-search
rm -rf ~/re-search
echo "\033[1m***** Re-Search Plug-In for Fish installed successfully *****\033[0m"
