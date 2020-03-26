# cd into home directory
cd ~

########################
# INSTALL APT PACKAGES #
########################
apt_programs='git gimp caffeine curl plank guake terminator redshift xscreensaver xscreensaver-data-extra xscreensaver-gl python3-pip xpad focuswriter'
sudo apt install $apt_programs &&

##################
# INSTALL CHROME #
##################
clear
echo "Downloading Chrome..."
echo
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
echo
echo "Installing Chrome..."
# Reminder check to see dpkg comes on Budgie
sudo dpkg -i google-chrome-stable_current_amd64.deb
rm google-chrome-stable_current_amd64.deb

####################
# INSTALL INKSCAPE #
####################
clear
echo "Installing Inkscape..."
echo
sudo add-apt-repository ppa:inkscape.dev/stable
sudo apt-get update
sudo apt install inkscape

###############
# INSTALL VLC #
###############
clear
echo "Installing VLC..."
echo
sudo add-apt-repository ppa:videolan/stable-daily
sudo apt-get update
sudo apt install vlc

#############
# SETUP GIT #
#############
clear
echo "Configuring Git..."
git config --global user.name "Fuerte Nerd"
git config --global user.email "fuertenerd@gmail.com"
git config --global credential.helper store

####################
# INSTALL NVM/NODE #
####################
clear
echo "Installing NVM/Node..."
echo
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
. ~/.nvm/nvm.sh
. ~/.profile
. ~/.bashrc

nvm install 12.16.1

###############################
# INSTALL GLOBAL NPM PACKAGES #
###############################
npm_globals="eslint gatsby node-sass nodemon prettier"
npm i -g $npm_globals

##################
# INSTALL NEOVIM #
##################
clear
echo "Installing Neovim..."
wget https://github.com/neovim/neovim/releases/download/stable/nvim.appimage
alias nvim="~/nvim.appimage"
mkdir .config/nvim/
# cp my-ubuntu-install-script/coc-settings.json .config/nvim/coc-settings.json


####################
# COPY BASH CONFIG #
####################
# cp my-ubuntu-install-script/.bashrc .bashrc

# TERMINAL PROFILE
touch .config/gtk-3.0/gtk.css

echo "VteTerminal, vte-terminal {" >> .config/gtk-3.0/gtk.css
echo "padding: 30px;" >> .config/gtk-3.0/gtk.css
echo "}" >> .config/gtk-3.0/gtk.css

# cp my-ubuntu-install-script/myprofile.profile .local/share/konsole/myprofile.profile

#touch .local/share/konsole/myprofile.profile

#echo '[Appearance]' >> .local/share/konsole/myprofile.profile
#echo 'ColorScheme=DarkPastels' >> .local/share/konsole/myprofile.profile
#echo 'Font=Consolas NF,10,-1,5,50,0,0,0,0,0' >> .local/share/konsole/myprofile.profile

#echo '[Cursor Options]' >> .local/share/konsole/myprofile.profile
#echo 'CursorShape=1' >> .local/share/konsole/myprofile.profile

#echo '[General]' >> .local/share/konsole/myprofile.profile
#echo 'Environment=TERM=xterm-256color,COLORTERM=truecolor' >> .local/share/konsole/myprofile.profile
#echo 'Name=Profile 1' >> .local/share/konsole/myprofile.profile
#echo 'Parent=FALLBACK/' >> .local/share/konsole/myprofile.profile
#echo 'TerminalMargin=50' >> .local/share/konsole/myprofile.profile

#echo '[Terminal Features]' >> .local/share/konsole/myprofile.profile
#echo 'BlinkingCursorEnabled=true' >> .local/share/konsole/myprofile.profile
clear
chmod a+x nvim.appimage

# ADD TO BASHRC
echo Appending to bashrc file...
echo
echo 'alias nvim="~/nvim.appimage"' >> .bashrc
echo "[ -f ~/.fzf.bash ] && source ~/.fzf.bash" >> .bashrc
echo 'export PS1="\[\e[92m\]\w\[\e[m\] \[\e[34m\]\\$\[\e[m\]"' >> .bashrc
echo >> .bashrc
echo 'alias ga="git add ."' >> .bashrc
echo 'alias gc="git commit"' >> .bashrc
echo 'alias gp="git push origin master"' >> .bashrc
echo 'alias n="nvim"' >> .bashrc
echo 'alias v="nvim"' >> .bashrc
echo >> .bashrc
echo '## DISPLAY SCRIPTS' >> .bashrc
echo 'function 1d(){' >> .bashrc
echo 'xrandr --auto' >> .bashrc
echo 'xrandr --output HDMI-2 --off' >> .bashrc
echo 'xrandr --output eDP-1 --rotate normal' >> .bashrc
echo 'pkill plank' >> .bashrc
echo 'sleep 5' >> .bashrc
echo 'plank &' >> .bashrc
echo 'sleep 5' >> .bashrc 
echo 'echo "Successfully configured single display"' >> .bashrc
echo '}' >> .bashrc
echo >> .bashrc
echo 'function 2d(){' >> .bashrc
echo 'xrandr --auto' >> .bashrc
echo 'xrandr --output eDP-1 --rotate left' >> .bashrc
echo 'xrandr --output HDMI-2 --right-of eDP-1' >> .bashrc
echo 'pkill plank' >> .bashrc
echo 'sleep 5' >> .bashrc
echo 'plank &' >> .bashrc
echo 'sleep 5' >> .bashrc
echo 'echo "Successfully configured dual display"' >> .bashrc
echo '}' >> .bashrc
echo >> .bashrc
echo 'function bd(){' >> .bashrc
echo 'xrandr --auto' >> .bashrc
echo 'xrandr --output eDP-1 --off' >> .bashrc
echo 'xrandr --output HDMI-2 --primary' >> .bashrc
echo   'pkill plank' >> .bashrc
echo   'sleep 5' >> .bashrc
echo   'plank &' >> .bashrc
echo   'sleep 5' >> .bashrc
echo   'echo "Successfully configured display"' >> .bashrc
echo '}' >> .bashrc
echo >> .bashrc
echo 'function v(){' >> .bashrc
echo   'nvim $1' >> .bashrc
echo '}' >> .bashrc
echo >> .bashrc
echo 'function p(){' >> .bashrc
echo   'cd ~/Projects' >> .bashrc
echo '}' >> .bashrc
echo >> .bashrc
echo 'function gs(){' >> .bashrc
echo "git add . && git commit -m \"Autogit: \`date +'%d-%m-%Y %H:%M'\` [skip ci]\" && git push origin master" >> .bashrc
echo '}' >> .bashrc
echo 'function sp(){' >> .bashrc
echo   'cd ~/Projects && cd $1 && nvim' >> .bashrc
echo '}' >> .bashrc
echo >> .bashrc
echo '# COMMIT TO GIT AND PUSH TO GITHUB EVERY 5 MINS' >> .bashrc
echo 'function autogit(){' >> .bashrc
echo  "while true; do gs && echo \"Autogit ran at \`date +'%H:%M'\`\"; sleep 300; done" >> .bashrc
echo '}' >> .bashrc
echo >> .bashrc
echo '# CHANGE THE LATEST PROJECT HERE' >> .bashrc
echo 'function slp(){' >> .bashrc
echo   'cd ~/Projects/fdr-website && nvim' >> .bashrc
echo '}' >> .bashrc
clear
#Neovim init file
echo Creating Neovim init file...
echo
echo let g:auto_save = 1 >> .config/nvim/init.vim

echo "call plug#begin('~/vim/plugged/')" >> .config/nvim/init.vim
echo  >> .config/nvim/init.vim
echo Plug \'neoclide/coc.nvim\', {\'branch\': \'release\'} >> .config/nvim/init.vim
echo Plug \'scrooloose/nerdtree\' >> .config/nvim/init.vim
echo Plug \'Xuyuanp/nerdtree-git-plugin\' >> .config/nvim/init.vim
echo Plug \'tiagofumo/vim-nerdtree-syntax-highlight\' >> .config/nvim/init.vim
echo Plug \'ryanoasis/vim-devicons\' >> .config/nvim/init.vim
echo Plug \'airblade/vim-gitgutter\' >> .config/nvim/init.vim
echo Plug \'scrooloose/nerdcommenter\' >> .config/nvim/init.vim
echo Plug \'christoomey/vim-tmux-navigator\' >> .config/nvim/init.vim
echo Plug \'907th/vim-auto-save\' >> .config/nvim/init.vim
echo Plug \'mattn/emmet-vim\' >> .config/nvim/init.vim
echo Plug \'turbio/bracey.vim\' >> .config/nvim/init.vim
echo Plug \'morhetz/gruvbox\' >> .config/nvim/init.vim
echo Plug \'mxw/vim-jsx\' >> .config/nvim/init.vim
echo Plug \'joshdick/onedark.vim\' >> .config/nvim/init.vim
echo Plug \'tpope/vim-commentary\' >> .config/nvim/init.vim
echo Plug \'vim-airline/vim-airline\' >> .config/nvim/init.vim
echo Plug \'junegunn/fzf\' >> .config/nvim/init.vim
echo Plug \'SirVer/ultisnips\' >> .config/nvim/init.vim
echo Plug \'mlaursen/vim-react-snippets\' >> .config/nvim/init.vim
echo Plug \'arcticicestudio/nord-vim\' >> .config/nvim/init.vim
echo Plug \'junegunn/goyo.vim\' >> .config/nvim/init.vim
echo Plug \'cormacrelf/vim-colors-github\' >> .config/nvim/init.vim
echo Plug \'pgavlin/pulumi.vim\' >> .config/nvim/init.vim

echo "call plug#end()" >> .config/nvim/init.vim

echo inoremap jk \<ESC\> >> .config/nvim/init.vim
echo "nmap <C-n> :NERDTreeToggle<CR>" >> .config/nvim/init.vim
echo 'vmap ++ <plug>NERDCommenterToggle' >> .config/nvim/init.vim
echo 'nmap ++ <plug>NERDCommenterToggle' >> .config/nvim/init.vim
echo 'vmap -- <plug>NERDCommenterAltDelims' >> .config/nvim/init.vim
echo 'nmap -- <plug>NERDCommenterAltDelims' >> .config/nvim/init.vim
echo '" open NERDTree automatically' >> .config/nvim/init.vim
echo '"autocmd StdinReadPre * let s:std_in=1' >> .config/nvim/init.vim
echo '"autocmd VimEnter * NERDTree' >> .config/nvim/init.vim
echo let g:NERDTreeGitStatusWithFlags = 1 >> .config/nvim/init.vim
echo '"let g:WebDevIconsUnicodeDecorateFolderNodes = 1' >> .config/nvim/init.vim
echo '"let g:NERDTreeGitStatusNodeColorization = 1' >> .config/nvim/init.vim
echo '"let g:NERDTreeColorMapCustom = {' >> .config/nvim/init.vim
echo '    "\ "Staged"    : "#0ee375",  ' >> .config/nvim/init.vim
echo '    "\ "Modified"  : "#d9bf91",  ' >> .config/nvim/init.vim
echo '    "\ "Renamed"   : "#51C9FC",  ' >> .config/nvim/init.vim
echo '    "\ "Untracked" : "#FCE77C",  ' >> .config/nvim/init.vim
echo '    "\ "Unmerged"  : "#FC51E6",  ' >> .config/nvim/init.vim
echo '    "\ "Dirty"     : "#FFBD61",  ' >> .config/nvim/init.vim
echo '    "\ "Clean"     : "#87939A",   ' >> .config/nvim/init.vim
echo '    "\ "Ignored"   : "#808080"   ' >> .config/nvim/init.vim
echo '    "\ }                         ' >> .config/nvim/init.vim
echo  >> .config/nvim/init.vim
echo  >> .config/nvim/init.vim
echo "let g:NERDTreeIgnore = ['^node_modules$']" >> .config/nvim/init.vim
echo  >> .config/nvim/init.vim
echo 'let g:airline_powerline_fonts = 1' >> .config/nvim/init.vim
echo 'let g:airline#extensions#tabline#enabled = 1' >> .config/nvim/init.vim
echo  >> .config/nvim/init.vim
echo 'nmap <C-p> :FZF<CR>' >> .config/nvim/init.vim
echo 'nmap ^^ :split<CR>' >> .config/nvim/init.vim
echo 'nmap >> :vsplit<CR>' >> .config/nvim/init.vim
echo 'nmap ¬¬ :Goyo<CR>' >> .config/nvim/init.vim
echo  >> .config/nvim/init.vim
echo '"let g:prettier#quickfix_enabled = 0' >> .config/nvim/init.vim
echo '"let g:prettier#quickfix_auto_focus = 0' >> .config/nvim/init.vim
echo '" prettier command for coc' >> .config/nvim/init.vim
echo 'command! -nargs=0 Prettier :CocCommand prettier.formatFile' >> .config/nvim/init.vim
echo '" run prettier on save' >> .config/nvim/init.vim
echo '"let g:prettier#autoformat = 0' >> .config/nvim/init.vim
echo '"autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync' >> .config/nvim/init.vim
echo  >> .config/nvim/init.vim
echo  >> .config/nvim/init.vim
echo '" ctrlp' >> .config/nvim/init.vim
echo "let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']" >> .config/nvim/init.vim
echo  >> .config/nvim/init.vim
echo '" j/k will move virtual lines (lines that wrap)' >> .config/nvim/init.vim
echo "noremap <silent> <expr> j (v:count == 0 ? \'gj\' : \'j\')" >> .config/nvim/init.vim
echo "noremap <silent> <expr> k (v:count == 0 ? \'gk\' : \'k\')" >> .config/nvim/init.vim
echo  >> .config/nvim/init.vim
echo "let g:NERDCustomDelimiters={" >> .config/nvim/init.vim
echo "	 \'javascript': { 'left': '//', 'right': '', 'leftAlt': '{/*', 'rightAlt': '*/}' }," >> .config/nvim/init.vim
echo "\}" >> .config/nvim/init.vim
echo  >> .config/nvim/init.vim
echo set number >> .config/nvim/init.vim
echo  >> .config/nvim/init.vim
echo set smarttab >> .config/nvim/init.vim
echo set cindent >> .config/nvim/init.vim
echo set tabstop=2 >> .config/nvim/init.vim
echo set shiftwidth=2 >> .config/nvim/init.vim
echo '" always uses spaces instead of tab characters' >> .config/nvim/init.vim
echo set expandtab >> .config/nvim/init.vim
echo  >> .config/nvim/init.vim
echo '" colorscheme pulumi' >> .config/nvim/init.vim
echo colorscheme onedark >> .config/nvim/init.vim
echo  >> .config/nvim/init.vim
echo '" sync open file with NERDTree' >> .config/nvim/init.vim
echo '" " Check if NERDTree is open or active' >> .config/nvim/init.vim
echo 'function! IsNERDTreeOpen()        ' >> .config/nvim/init.vim
echo '  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)' >> .config/nvim/init.vim
echo endfunction >> .config/nvim/init.vim
echo  >> .config/nvim/init.vim
echo '" Call NERDTreeFind iff NERDTree is active, current window contains a modifiable' >> .config/nvim/init.vim
echo '" file, and we are not in vimdiff' >> .config/nvim/init.vim
echo 'function! SyncTree()' >> .config/nvim/init.vim
echo "  if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff" >> .config/nvim/init.vim
echo     NERDTreeFind >> .config/nvim/init.vim
echo     wincmd p >> .config/nvim/init.vim
echo   endif >> .config/nvim/init.vim
echo endfunction >> .config/nvim/init.vim
echo  >> .config/nvim/init.vim
echo '" Highlight currently open buffer in NERDTree' >> .config/nvim/init.vim
echo "autocmd BufEnter * call SyncTree()" >> .config/nvim/init.vim
echo  >> .config/nvim/init.vim
echo '" coc config' >> .config/nvim/init.vim
echo "let g:coc_global_extensions = [" >> .config/nvim/init.vim
echo "  \ 'coc-snippets'," >> .config/nvim/init.vim
echo "  \ 'coc-pairs'," >> .config/nvim/init.vim
echo "  \ 'coc-tsserver'," >> .config/nvim/init.vim
echo "  \ 'coc-eslint', " >> .config/nvim/init.vim
echo "  \ 'coc-prettier', " >> .config/nvim/init.vim
echo "  \ 'coc-json', " >> .config/nvim/init.vim
echo "  \ ]" >> .config/nvim/init.vim
echo '" from readme' >> .config/nvim/init.vim
echo '" if hidden is not set, TextEdit might fail.' >> .config/nvim/init.vim
echo 'set hidden " Some servers have issues with backup files, see #649 set nobackup set nowritebackup " Better display for messages set cmdheight=2 " You will have bad experience for diagnostic messages when it is default 4000.' >> .config/nvim/init.vim
echo set updatetime=300 >> .config/nvim/init.vim
echo  >> .config/nvim/init.vim
echo '" do not give |ins-completion-menu| messages.' >> .config/nvim/init.vim
echo set shortmess+=c >> .config/nvim/init.vim
echo  >> .config/nvim/init.vim
echo '" always show signcolumns' >> .config/nvim/init.vim
echo set signcolumn=yes >> .config/nvim/init.vim
echo  >> .config/nvim/init.vim
echo '" Use tab for trigger completion with characters ahead and navigate.' >> .config/nvim/init.vim
echo '" Use command :verbose imap <tab> to make sure tab is not mapped by other plugin.' >> .config/nvim/init.vim
echo 'inoremap <silent><expr> <TAB>' >> .config/nvim/init.vim
echo '      \ pumvisible() ? "\<C-n>" :' >> .config/nvim/init.vim
echo '      \ <SID>check_back_space() ? "\<TAB>" :' >> .config/nvim/init.vim
echo '      \ coc#refresh()' >> .config/nvim/init.vim
echo 'inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"' >> .config/nvim/init.vim
echo  >> .config/nvim/init.vim
echo 'function! s:check_back_space() abort' >> .config/nvim/init.vim
echo "  let col = col(\'.\') - 1" >> .config/nvim/init.vim
echo "  return !col || getline(\'.\')[col - 1]  =~# \'\s\'" >> .config/nvim/init.vim
echo endfunction >> .config/nvim/init.vim
echo  >> .config/nvim/init.vim
echo '" Use <c-space> to trigger completion.' >> .config/nvim/init.vim
echo 'inoremap <silent><expr> <c-space> coc#refresh()' >> .config/nvim/init.vim
echo  >> .config/nvim/init.vim
echo '" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.' >> .config/nvim/init.vim
echo '" Coc only does snippet and additional edit on confirm.' >> .config/nvim/init.vim
echo 'inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"' >> .config/nvim/init.vim
echo '" Or use `complete_info` if your vim support it, like:' >> .config/nvim/init.vim
echo '" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"' >> .config/nvim/init.vim
echo  >> .config/nvim/init.vim
echo '" Use `[g` and `]g` to navigate diagnostics' >> .config/nvim/init.vim
echo 'nmap <silent> [g <Plug>(coc-diagnostic-prev)' >> .config/nvim/init.vim
echo 'nmap <silent> ]g <Plug>(coc-diagnostic-next)' >> .config/nvim/init.vim
echo  >> .config/nvim/init.vim
echo '" Remap keys for gotos' >> .config/nvim/init.vim
echo 'nmap <silent> gd <Plug>(coc-definition)' >> .config/nvim/init.vim
echo 'nmap <silent> gy <Plug>(coc-type-definition)' >> .config/nvim/init.vim
echo 'nmap <silent> gi <Plug>(coc-implementation)' >> .config/nvim/init.vim
echo 'nmap <silent> gr <Plug>(coc-references)' >> .config/nvim/init.vim
echo  >> .config/nvim/init.vim
echo '" Use K to show documentation in preview window' >> .config/nvim/init.vim
echo 'nnoremap <silent> K :call <SID>show_documentation()<CR>' >> .config/nvim/init.vim
echo  >> .config/nvim/init.vim
echo 'function! s:show_documentation()' >> .config/nvim/init.vim
echo "  if (index([\'vim\',\'help\'], &filetype) >= 0)" >> .config/nvim/init.vim
echo "    execute \'h \'.expand(\'<cword>\')" >> .config/nvim/init.vim
echo   else >> .config/nvim/init.vim
echo "    callCocAction(\'doHover\')" >> .config/nvim/init.vim
echo   endif >> .config/nvim/init.vim
echo endfunction >> .config/nvim/init.vim
echo  >> .config/nvim/init.vim
echo '" Highlight symbol under cursor on CursorHold' >> .config/nvim/init.vim
echo "autocmd CursorHold * silent call CocActionAsync('highlight')" >> .config/nvim/init.vim
echo  >> .config/nvim/init.vim
echo '" Remap for rename current word' >> .config/nvim/init.vim
echo 'nmap <F2> <Plug>(coc-rename)' >> .config/nvim/init.vim
echo  >> .config/nvim/init.vim
echo '" Remap for format selected region' >> .config/nvim/init.vim
echo 'xmap <leader>f  <Plug>(coc-format-selected)' >> .config/nvim/init.vim
echo 'nmap <leader>f  <Plug>(coc-format-selected)' >> .config/nvim/init.vim
echo  >> .config/nvim/init.vim
echo augroup mygroup >> .config/nvim/init.vim
echo   autocmd! >> .config/nvim/init.vim
echo '  " Setup formatexpr specified filetype(s).' >> .config/nvim/init.vim
echo "  autocmd FileType typescript,json setl formatexpr=CocAction(\'formatSelected\')" >> .config/nvim/init.vim
echo '  " Update signature help on jump placeholder' >> .config/nvim/init.vim
echo "  autocmd User CocJumpPlaceholder call CocActionAsync(\'showSignatureHelp\')" >> .config/nvim/init.vim
echo augroup end >> .config/nvim/init.vim
echo  >> .config/nvim/init.vim
echo '" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph' >> .config/nvim/init.vim
echo 'xmap <leader>a  <Plug>(coc-codeaction-selected)' >> .config/nvim/init.vim
echo 'nmap <leader>a  <Plug>(coc-codeaction-selected)' >> .config/nvim/init.vim
echo  >> .config/nvim/init.vim
echo '" Remap for do codeAction of current line' >> .config/nvim/init.vim
echo 'nmap <leader>ac  <Plug>(coc-codeaction)' >> .config/nvim/init.vim
echo '" Fix autofix problem of current line' >> .config/nvim/init.vim
echo 'nmap <leader>qf  <Plug>(coc-fix-current)' >> .config/nvim/init.vim
echo  >> .config/nvim/init.vim
echo '" Create mappings for function text object, requires document symbols feature of languageserver.' >> .config/nvim/init.vim
echo 'xmap if <Plug>(coc-funcobj-i)' >> .config/nvim/init.vim
echo 'xmap af <Plug>(coc-funcobj-a)' >> .config/nvim/init.vim
echo 'omap if <Plug>(coc-funcobj-i)' >> .config/nvim/init.vim
echo 'omap af <Plug>(coc-funcobj-a)' >> .config/nvim/init.vim
echo  >> .config/nvim/init.vim
echo '" Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python' >> .config/nvim/init.vim
echo 'nmap <silent> <C-d> <Plug>(coc-range-select)' >> .config/nvim/init.vim
echo 'xmap <silent> <C-d> <Plug>(coc-range-select)' >> .config/nvim/init.vim
echo  >> .config/nvim/init.vim
echo '" Use `:Format` to format current buffer' >> .config/nvim/init.vim
echo "command! -nargs=0 Format :call CocAction(\'format\')" >> .config/nvim/init.vim
echo  >> .config/nvim/init.vim
echo '" Use `:Fold` to fold current buffer' >> .config/nvim/init.vim
echo "command! -nargs=? Fold :call     CocAction(\'fold\', <f-args>)" >> .config/nvim/init.vim
echo  >> .config/nvim/init.vim
echo '" use `:OR` for organize import of current buffer' >> .config/nvim/init.vim
echo "command! -nargs=0 OR   :call     CocAction(\'runCommand\', \'editor.action.organizeImport\')" >> .config/nvim/init.vim
echo  >> .config/nvim/init.vim
echo '" Add status line support, for integration with other plugin, checkout `:h coc-status`' >> .config/nvim/init.vim
echo "set statusline^=%{coc#status()}%{get(b:,\'coc_current_function\',\'\')}" >> .config/nvim/init.vim
echo  >> .config/nvim/init.vim
echo '" Using CocList' >> .config/nvim/init.vim
echo '" Show all diagnostics' >> .config/nvim/init.vim
echo 'nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>' >> .config/nvim/init.vim
echo '" Manage extensions' >> .config/nvim/init.vim
echo 'nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>' >> .config/nvim/init.vim
echo '" Show commands' >> .config/nvim/init.vim
echo 'nnoremap <silent> <space>c  :<C-u>CocList commands<cr>' >> .config/nvim/init.vim
echo '" Find symbol of current document' >> .config/nvim/init.vim
echo 'nnoremap <silent> <space>o  :<C-u>CocList outline<cr>' >> .config/nvim/init.vim
echo '" Search workspace symbols' >> .config/nvim/init.vim
echo 'nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>' >> .config/nvim/init.vim
echo '" Do default action for next item.' >> .config/nvim/init.vim
echo 'nnoremap <silent> <space>j  :<C-u>CocNext<CR>' >> .config/nvim/init.vim
echo '" Do default action for previous item.' >> .config/nvim/init.vim
echo 'nnoremap <silent> <space>k  :<C-u>CocPrev<CR>' >> .config/nvim/init.vim
echo '" Resume latest coc list' >> .config/nvim/init.vim
echo 'nnoremap <silent> <space>p  :<C-u>CocListResume<CR>' >> .config/nvim/init.vim
echo set encoding=UTF-8 >> .config/nvim/init.vim

  # coc settings
touch .config/nvim/coc-settings.json
echo { >> .config/nvim/coc-settings.json
echo '  "suggest.noselect": false,' >> .config/nvim/coc-settings.json
echo '  "coc.preferences.formatOnSaveFiletypes": [' >> .config/nvim/coc-settings.json
echo '    "javascript",' >> .config/nvim/coc-settings.json
echo '    "typescript",' >> .config/nvim/coc-settings.json
echo '    "typescriptreact",' >> .config/nvim/coc-settings.json
echo '    "json",' >> .config/nvim/coc-settings.json
echo '    "javascriptreact",' >> .config/nvim/coc-settings.json
echo '    "typescript.tsx",' >> .config/nvim/coc-settings.json
echo '    "graphql"' >> .config/nvim/coc-settings.json
echo '  ]' >> .config/nvim/coc-settings.json
echo '}' >> .config/nvim/coc-settings.json
# Install plugins
source .bashrc
pip3 install pynvim &&
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
nvim +'PlugInstall --sync' +qa

clear
# Install Nerd Fonts
echo "Installing NERD FONTS"
echo
git clone --depth 1 https://github.com/ryanoasis/nerd-fonts.git
. /nerd-fonts/install.sh

# Avoid ENOSPC error
echo fs.inotify.max_user_watches=524288 | sudo tee -a /etc/sysctl.conf && sudo sysctl -p

# BINISHED!!!!!
clear
echo "Binished!"
