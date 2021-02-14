"==================================================
"=        检测是否已安装 plug 插件管理器          =
"==================================================
if empty(glob('~/.config/nvim/autoload/plug.vim'))
	silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif



"==================================================
"=                     基本设置                   =
"==================================================

"设置编码
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8

"设置缩进
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
set expandtab

"界面设置
set laststatus=2              " 显示状态栏
set number                    " 显示绝对行数
set cul                       " 突出当前行
set ruler                     " 显示光标当前位置
set showmatch                 " 显示匹配括号
syntax on                     " 语法高亮
color deus                    " 设置主题
set termguicolors 			  " 真彩颜色显示

"代码折叠
set foldmethod=indent         " 使用缩进代码折叠
set foldcolumn=0              " 设置折叠区域的宽度
setlocal foldlevel=1          " 设置折叠层数
set wrap                      " 关闭自动折行
set foldlevelstart=99         " 代码默认不折叠

"其他设置
set nocompatible              " 关闭与vi的兼容模式
set mouse=a                   " 启用鼠标
set splitbelow                " 水平分屏后光标默认在下屏
set splitright                " 垂直分屏后光标默认在右屏
set scrolloff=30              " 距离顶部和底部 30 行
set pastetoggle=<A-p>         " 粘贴模式开关
set smartcase                 " 智能大小写
set hidden                    " 允许调用缓冲区
set updatetime=100            " 响应时间
set shortmess+=c              " 补全过滤无用代码
set helplang=cn               " 设置中文帮助
language messages zh_CN.utf-8 " 设置中文提示
filetype plugin indent on     " 文件类型检测，根据不同类型文件载入不同插件
autocmd BufWritePost $MYVIMRC source $MYVIMRC " 保存文件立即生效

"状态栏设置
set statusline=%1*\%<%.50F\               " 显示文件名和文件路径
set statusline+=%=%2*\%y%m%r%h%w\ %*      " 显示文件类型及文件状态
set statusline+=%3*\%{&ff}\[%{&fenc}]\ %* " 显示文件编码类型
set statusline+=%4*\ row:%l/%L,col:%c\ %* " 显示光标所在行和列
set statusline+=%5*\%3p%%\%*              " 显示光标前文本所占总文本的比例
hi User1 cterm=none ctermfg=green ctermbg=0
hi User2 cterm=none ctermfg=208 ctermbg=0
hi User3 cterm=none ctermfg=169 ctermbg=0
hi User4 cterm=none ctermfg=darkblue ctermbg=0
hi User5 cterm=none ctermfg=red ctermbg=0



"==================================================
"=                    终端设置                    =
"==================================================
let g:neoterm_autoscroll = 1
autocmd TermOpen term://* startinsert
tnoremap Q <C-\><C-N>:q<CR>
let g:terminal_color_0  = '#BFBFBF'     "注释颜色
let g:terminal_color_1  = '#FF3300'     "指令错误颜色
let g:terminal_color_2  = '#66CC33'     "可执行文件颜色
let g:terminal_color_3  = '#F1FA8C'
let g:terminal_color_4  = '#3399FF'     "目录颜色
let g:terminal_color_5  = '#FF79C6'
let g:terminal_color_6  = '#99FFFF'     "软链接文件颜色
let g:terminal_color_7  = '#BFBFBF'
let g:terminal_color_8  = '#4D4D4D'
let g:terminal_color_9  = '#FF6E67'
let g:terminal_color_10 = '#5AF78E'
let g:terminal_color_11 = '#F4F99D'
let g:terminal_color_12 = '#CAA9FA'
let g:terminal_color_13 = '#FF92D0'
let g:terminal_color_14 = '#9AEDFE'



"==================================================
"=                    快捷映射                    =
"==================================================

"定义 <LEADER> 为 <space>
let mapleader=" "

"Normal Mapping
nnoremap Q :q!<CR>
nnoremap W :w!<CR>
nnoremap S :x!<CR>
nnoremap < <<
nnoremap > >>
nnoremap f <C-r>
nnoremap J <C-f>
nnoremap K <C-b>
nnoremap <C-a> ggVG
nnoremap <leader>x :!chmod u+x %<CR>
nnoremap <leader>rc :tabe ~/.config/nvim/init.vim<CR>
nnoremap <leader>z :sp<CR>:set nonu<CR>:res-12<CR>:term<CR>

"tab 页设置
nnoremap tn :tabe<CR>		"新建 tab 页
nnoremap tf :-tabnext<CR>	"切换到上一 tab 页
nnoremap tb :+tabnext<CR>	"切换到下一 tab 页
nnoremap tmf :-tabmove<CR>	"移动当前 tab 页向前
nnoremap tmb :+tabmove<CR>	"移动当前 tab 页向后

"窗口设置
nnoremap <leader><up> :res+3<CR>
nnoremap <leader><down> :res-3<CR>
nnoremap <leader><left> :vertical resize-3<CR>
nnoremap <leader><right> :vertical resize+3<CR>
nnoremap sh <C-w>t<C-w>K 				"将两个分屏水平放置
nnoremap sv <C-w>t<C-w>H 				"将两个分屏垂直放置

"一键执行 python 和 shell 文件，预览 html 文件
nnoremap X :call Run()<CR>
func! Run()
	exec "w"
	if &filetype == 'python'
		:sp
		:set nonumber
		:term python3 %
	elseif &filetype == 'sh'
		:sp
		:set nonumber
		:term bash %
	elseif &filetype == 'html'
		:sp
		:set nonumber
		:term w3m %
	endif
endfunc


"Insert Mapping
inoremap <C-q> <ESC>:q!<CR>		"强制退出
inoremap <C-w> <ESC>:w!<CR>		"强制保存
inoremap <C-s> <ESC>:x!<CR>		"强制保存并退出
inoremap <C-a> <ESC>ggVG
inoremap <C-y> <ESC>yya
inoremap <C-p> <ESC>pa
inoremap jj <ESC>				"ESC 退出 Insert 模式



"为 python or shell 文件增加前言注释
autocmd BufNewFile *.py 0r ~/.config/nvim/py.clp
autocmd BufNewFile *.py ks|call FileName()|'s
autocmd BufNewFile *.py ks|call CreatedTime()|'s
autocmd BufNewFile *.sh 0r ~/.config/nvim/sh.clp
autocmd BufNewFile *.sh ks|call FileName()|'s
autocmd BufNewFile *.sh ks|call CreatedTime()|'s
fun FileName()
    if line("$") > 10
        let l = 10
    else
        let l = line("$")
    endif
    exe "1," . l . "g/File Name:.*/s/File Name:.*/File Name: " .expand("%")
endfun
fun CreatedTime()
    if line("$") > 10
        let l = 10
    else
        let l = line("$")
    endif
    exe "1," . l . "g/Created Time:.*/s/Created Time:.*/Created Time: ".strftime("%Y-%m-%d %T")
endfun



"==================================================
"=                     插件安装                   =
"==================================================
call plug#begin("~/.config/nvim/plugged")

"===
"=== 代码补全
"===
Plug 'neoclide/coc.nvim', {'branch': 'release'} " coc插件
Plug 'honza/vim-snippets'                       " 代码片段补全

"===
"=== 界面状态栏
"===
Plug 'vim-airline/vim-airline'        " 状态栏

"===
"=== 高级插件
"===
Plug 'preservim/nerdcommenter'                      " 一键注释
Plug 'gcmt/wildfire.vim'                            " 快速选中区域代码
Plug 'tpope/vim-surround'                           " 给现有代码插入、删除或修改成对的符号
Plug 'mg979/vim-visual-multi', {'branch': 'master'} " 多重光标
Plug 'junegunn/vim-easy-align'                      " 对齐文本

"=== 
"=== 窗口工具
"===
Plug 'preservim/nerdtree'          " 文件目录浏览器
Plug 'Xuyuanp/nerdtree-git-plugin' " nerdtree 显示 git 状态
Plug 'francoiscabrol/ranger.vim'   " ranger 文件浏览器
Plug 'rbgrouleff/bclose.vim'       " ranger依赖包
Plug 'liuchengxu/vista.vim'        " 函数与变量列表

"===
"=== 语法缩进
"===
Plug 'Yggdroot/indentLine'                             " 缩进暗示线
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'} " python 语法突出显示
Plug 'dense-analysis/ale'                              " 自动纠错

call plug#end()



"==================================================
"=                    插件配置                    =
"==================================================

"=== coc.nvim ===

"安装子插件
let g:coc_global_extensions = [
	\ 'coc-css', 
	\ 'coc-emmet', 
	\ 'coc-git', 
	\ 'coc-highlight',
	\ 'coc-html',
	\ 'coc-json', 
	\ 'coc-lists', 
	\ 'coc-pairs', 
	\ 'coc-python', 
	\ 'coc-sh', 
	\ 'coc-snippets', 
	\ 'coc-tsserver', 
	\ 'coc-yank']

"使用 Tab 选择补全代码
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

"使用回车补全代码或代码片段
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
"使用 Ctrl+space 触发代码补全
inoremap <silent><expr> <c-space> coc#refresh()

"使用 <leader>j 和 <leader>k 定位错误代码
nmap <silent> <leader>k <Plug>(coc-diagnostic-prev)
nmap <silent> <leader>j <Plug>(coc-diagnostic-next)

"<leader>f 格式化代码
xmap <leader>f <Plug>(coc-format-selected)

"其他设置
source ~/.config/nvim/coc.vim



"=== vim-airline ===
"airline 主题
" let g:airline_theme='distinguished'
let g:airline_theme='deus'

"关闭状态栏显示空白符号计数
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#whitespace#symbol = '!'

"顶栏设置
let g:airline#extensions#tabline#enabled = 1        	" 启用顶栏
let g:airline#extensions#tabline#buffer_nr_show = 1 	" 启用顶栏编号
let g:airline#extensions#tabline#show_tab_count = 2 	" 在右侧显示标签数量
nnoremap <leader>n :bn<CR> 								" 切换到下一个 buffer 文件 
nnoremap <leader>p :bp<CR> 								" 切换到上一个 buffer 文件

"字体设置
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif
let g:airline_powerline_fonts = 1
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰'



"=== nerdtree ===
" let loaded_nerd_tree=1 	"禁用插件
autocmd vimenter * if !argc()|NERDTree|endif   
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif   "当NERDTree为剩下的唯一窗口时自动关闭
nnoremap tt :NERDTreeToggle<CR>:vertical resize-12<CR>



"=== nerdtree-git-plugin ===
let g:NERDTreeGitStatusUseNerdFonts = 1
let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'✹',
                \ 'Staged'    :'✚',
                \ 'Untracked' :'✭',
                \ 'Renamed'   :'➜',
                \ 'Unmerged'  :'═',
                \ 'Deleted'   :'✖',
                \ 'Dirty'     :'✗',
                \ 'Ignored'   :'☒',
                \ 'Clean'     :'✔︎',
                \ 'Unknown'   :'?'
                \ }



"=== ranger.vim ===
let g:ranger_map_keys = 0
nnoremap <leader>t :RangerNewTab<CR>



"=== vista ===
nnoremap T :Vista<CR>					"打开函数变量列表



"=== vim-visual-multi ===
let g:VM_maps = {}
let g:VM_visual_mapping = 0 					"禁用默认映射
let g:VM_maps["Select Cursor Down"] = '<A-d>' 	"向上创建多重光标
let g:VM_maps["Select Cursor Up"]   = '<A-u>' 	"向下创建多重光标
let g:VM_maps["Add Cursor At Pos"]  = '+' 		"在光标当前位置 创建/删除 多重光标



"=== nerdcommenter ===
"let g:loaded_nerd_comments = 1      " 禁用默认映射
let g:NERDSpaceDelims = 1            " 在注释符后面自动添加空格
let g:NERDCompactSexyComs = 1        " 使用紧凑语法美化多行注释
let g:NERDCommentEmptyLines = 1      " 允许注释和反注释
let g:NERDTrimTrailingWhitespace = 1 " 取消注释的同时删除当前行末尾的空格
let g:NERDToggleCheckAllLines = 1    " 启用NERDCommenterToggle以检查所有选定的行是否已注释



"=== vim-easy-align ===
"对齐文本
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)



"=== indentLine ===
let g:indentLine_color_gui = '#CCCCCC'



"=== semshi ===
nmap <silent> <leader>r :Semshi rename<CR>



"=== ale ===
let g:ale_sign_error = '>>'  " 自定义错误标志
let g:ale_sign_warning = '!' " 自定义警告标志
let g:ale_fixers = {'python': ['remove_trailing_lines', 'trim_whitespace', 'autopep8']}  "指定修复 pep8 错误的 fixer
nnoremap <C-l> :ALEFix<CR>  "修复语法和格式错误 ctrl + l"
