### 简易安装方法：

打开终端，执行下面的命令就自动安装好了：

`wget -qO- https://raw.github.com/progpark/willvim/master/install.sh | sh -x`

- 重新打开vim即可看到效果

### 了解更多vim使用的小技巧：

[tips.md](tips.md)

### 查看更新日志：

[`update_log.md`](update_log.md)

常用vim插件集
==========================
* Plugin 'gmarik/Vundle.vim'
* Plugin 'tpope/vim-fugitive'
* Plugin 'scrooloose/nerdtree'
* Plugin 'terryma/vim-multiple-cursors'
* Plugin 'kien/ctrlp.vim'
* Plugin 'mileszs/ack.vim'
* Plugin 'bling/vim-airline'
* Plugin 'altercation/vim-colors-solarized'
* Plugin 'edsono/vim-matchit'
* Plugin 'majutsushi/tagbar'
* Plugin 'jiazhoulvke/MarkdownView'
* Plugin 'Raimondi/delimitMate'
* Plugin 'scrooloose/syntastic'
* Plugin 'easymotion/vim-easymotion'
* Plugin 'ldx/vim-manage-classpath'
* Plugin 'tomasr/molokai'
* Plugin 'leshill/vim-json'
* Plugin 'sjl/gundo.vim'
* Plugin 'tyru/open-browser.vim'
* Plugin 'anyakichi/vim-surround'
* Plugin 'MarcWeber/vim-addon-mw-utils'
* Plugin 'ShowTrailingWhitespace'
* Plugin 'terryma/vim-expand-region'
* Plugin 'drmingdrmer/xptemplate'
* Plugin 'airblade/vim-gitgutter'
* Plugin 'mattn/Gist-vim'
* Plugin 'Yggdroot/indentLine'
* Plugin 'stephpy/vim-php-cs-fixer'
* Plugin 'Valloric/YouCompleteMe'
* Plugin 'mattn/emmet-vim'
* Plugin 'mattn/webapi-vim'
* Plugin 'dyng/ctrlsf.vim'
* Plugin 'msanders/snipmate.vim'
* Plugin 'ekalinin/Dockerfile.vim'

### 新增tagbar对phpctags支持，展示信息更加友好
    - 首先需要安装phpctags，并给予可执行权限，且放到合适的位置
        `curl -Ss http://vim-php.com/phpctags/install/phpctags.phar > phpctags`
    - 其次引入并tagbar-phpctags.vim插件，具体参见.vimrc文件配置
