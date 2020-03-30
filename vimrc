""""""""""""""""""""""""""""""""""选项设置方式说明""""""""""""""""""""""""""
"选项有三种类型布尔型、数值型、字符串
":set                  显示所有不同于缺省值的选项
":set all              显示除终端设置以外的所有选项
":set termcap          显示所有的终端设置选项。
":set {option}?        显示option的值        
":set {option}         bool选项: 打开,数值选项:显示其值。字符串选项:显示其值    
":set no{option}       bool选项: 关闭
":set {option}!        bool选项: 反转其值。Vi无此功能
":set {option}&        设置选项为缺省值
":set {option}&vi      设置选项为 Vi 的缺省值,Vi 无此功能                
":set {option}&vim     设置选项为 Vim 的缺省值,Vi 无此功能
":set all&             设置除了终端设置以外的所有选项为其缺省值
":set {option}={value} 设置字符串或数值选项的值为 value
":set {option}:{value} 设置字符串或数值选项的值为 value
":set {option}+={value} 把value加到数值选项里，或者附加到字符串选项之后。如果选项是逗号分隔的列表，除非原来的值为空，会加上一个逗号。如果选项是标志位的列表，删除多余的标志位。如果加入已经存在的标志位，选项值不变
":set {option}^={value} 把value乘到数值选项里，或者附加到字符串选项之前。如果选项是逗号分隔的列表，除非原来的值为空，会加上一个逗号。
":set {option}-={value} 把value从数值选项里减去，或者从字符串选项里删除，如果该值原来存在的话，如果不存在，不会有错误或者警告。如果选项是逗号分隔的列表，除非新值为空，删除一个逗号。如果选项是标志位的列表，{value} 必须和选项里出现的顺序 完全相同。一个一个地分别删除标志位可以解决这个问题。



""""""""""""""""""""""""""""""""""添加vim插件""""""""""""""""""""""""""""""""""""
set nocompatible                               "设置为不兼容vi
filetype off                                   "关闭文件类型检测
set runtimepath+=~/.vim/bundle/Vundle.vim      "添加运行时的路径
call vundle#begin() 
Plugin 'VundleVim/Vundle.vim'                  "安装vundle插件管理器,安装PunginInstall，卸载BundleClean
Plugin 'sjl/gundo.vim'                         "撤销与重做
Plugin 'luochen1990/rainbow'                   "彩虹括号
Plugin 'jiangmiao/auto-pairs'                  "自动输入括号对,括号快速跳转
Plugin 'tomasr/molokai'                        "主题molokai，切换主题：colorscheme 主题名
Plugin 'ycm-core/YouCompleteMe'                "安装youcompleteme自动补全
Plugin 'bling/vim-airline'                     "状态栏插件,代替powerline
Plugin 'vim-airline/vim-airline-themes'        "状态栏插件主题
Plugin 'SirVer/ultisnips'                      "安装ultisnips块输入引擎,代替c.vim
"Plugin 'honza/vim-snippets'                    "安装ultisnips的代码块
Plugin 'scrooloose/nerdcommenter'              "快速注释反注释,相比Tcomment来说键盘映射简单,但不能用于插入模式,代替c.vim
call vundle#end()
filetype plugin indent on                      "打开文件文件类型检测，并载入插件，根据文件类型设置缩进



"""""""""""""""""""""""本配置文件使用的快捷键"""""""""""""""""""""""""
"F1                                  vim帮助 

"F11                                 快速跳过括号对
"F9                                  注释/反注释  
"F10                                 插入模式下添加注释符号
"\cm                                 注释多行只用一对符号注释，之前的注释都是每行独立注释 
"\cs                                 使用好看的注释方式


"tab                                 插入模式下ultisnip代码块插入
"ctrl +j                             插入模式下ultisnip代码块补全后，跳至下一个或光标位置
"ctrl +k                             插入模式下ultisnip代码块补全后，跳至上一个或光标位置


"ctrl+空格                           插入模式下YCM搜索更多补全候选项
"\gc                                 跳转到声明
"\gf                                 跳转到定义
"\gh                                 跳转到头文件
"\gr                                 跳转到引用
"\gi                                 跳转到实现
"\gt                                 跳转到类型定义
"\st                                 显示类型
"\sp                                 显示父类
"\sd                                 显示文档
"\d                                  显示详细的错误诊断信息

":help 插件名                        查看该插件的帮助



"""""""""""""""""""""""""""""theme"""""""""""""""""""""""""""""""""""
":colorscheme molokai 切换主题
":colorscheme 查看当前主题
":colorscheme 空格 tab键 列出所有主题


if has("gui_runing")              "如果是在图形用户界面
	set background=light          "设置背景色为亮色
else                              "否则
	set t_Co=256                  "就开启256色支持，默认为8色                         
	set background=dark           "设置背景色为暗色
endif

"设置主题色为molokai
colorscheme molokai 



"""""""""""""""""""""""""""rainbow""""""""""""""""""""""""""""""""""
"自动启动插件
let g:rainbow_active=1   



"""""""""""""""""""""""""""auto-pairs"""""""""""""""""""""""""""""""
"设置F11为快速跳到下一个括号对的快捷键
let g:AutoPairsShortcutJump='<f11>' 



""""""""""""""""""""""""""molokai主题"""""""""""""""""""""""""""""""
"使用原始配色
"let g:molokai_original=1

"使用接近图形用户界面的配色
"let g:rehash256=1  "设置为1则更加亮眼



""""""""""""""""""""""""""youcompleteme"""""""""""""""""""""""""""""
" 设置触发标识符补全的最小字符数，设置为99或更大的数字，则等效于关闭标识符补全功能，但保留语义补全功能
let g:ycm_min_num_of_chars_for_completion=1

"设置要在标示符补全列表中候选的项的最小字符数，也可设置为其他值，设置为99或更大的数字，则等效于关闭补全功能，对语义补全无影响
let g:ycm_min_num_identifier_candidate_chars=1

"补全功能在注释中同样有效，1表示打开
let g:ycm_complete_in_comments=1

"用vim的语法标识符来建立标识符数据库
let g:ycm_seed_identifiers_with_syntax=1

"从ctags中收集标识符
let g:ycm_collect_identifiers_from_tags_files=0

"设置用于选择补全列表中的第一个选项以及进入补全列表后向下选择的快捷键，可以添加<Enter>键，默认为tab键和方向下键                          
let g:ycm_key_list_select_completion=['<Down>']

"设置用于向上选择补全列表中的选项的快捷键，默认为shift+tab，和方向上键
let g:ycm_key_list_previous_completion=['<Up>']

"配置ycm的全局路径，避免每次都复制到当前目录.若为空则每次都需赋值文件到当前目录                                                          
autocmd FileType  c let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/third_party/ycmd/ycm_extra_conf_c.py'
autocmd FileType cpp,python let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/third_party/ycmd/ycm_extra_conf_cpp.py'

" 允许自动加载.ycm_extra_conf.py，不再提示，设置为1，则每次都提示用于确认该文件是否安全
let g:ycm_confirm_extra_conf=0 

"设置运行jedi库的python解释器
let g:ycm_python_binary_path='/usr/bin/python3' 

"设置ycm服务的python解释器
let g:ycm_server_python_interpreter='/usr/bin/python3'

"跳转到声明的快捷键为<leader>gc
nnoremap <leader>gc :YcmCompleter GoToDeclaration<CR>                                                                                    

"跳转到定义的快捷键为<leader>gf
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>               

"跳转到头文件的快捷键为<leader>gh
nnoremap <leader>gh :YcmCompleter GoToInclude<CR>

"跳转到引用的快捷键为<leader>gr
nnoremap <leader>gr :YcmCompleter GoToReferences<CR>

"跳转到实现的快捷键为<leader>gi
nnoremap <leader>gi :YcmCompleter GoToImplementation<CR>

"跳转到类型的快捷键为<leader>gt
nnoremap <leader>gt :YcmCompleter GoToType<CR>

"显示类型的快捷键为<leader>st
nnoremap <leader>st :YcmCompleter GetType<CR>  

"显示语义父项的快捷键为<leader>sp
nnoremap <leader>sp :YcmCompleter GetParent<CR>

"显示文档的快捷键为<leader>sd
nnoremap <leader>sd :YcmCompleter GetDoc<CR>



"""""""""""""""""""""""""""""""""nerdcommit""""""""""""""""""""""""""""""""""""
"可在命令前加入数字，表示对连续n行执行相同操作
"\cc                                 注释当前选中文本，如果选中的是整行则在每行首添加//，如果选中一行的部分内容则在选中部分前后添加分别 /*xxx */；
"\cu                                 取消选中文本块的注释。                                                             
"\c<space>                           有注释取消，无注释加注释            
"\cm                                 注释多行只用一对符号注释，之前的注释都是每行独立注释 
"<leader>ci                          单独的行单独切换所选行的注释状态              
"\cs                                 使用好看的注释方式
"\cy                                 与cc一样只是在注释掉之前先复制原内容                           
"\c$                                 注释掉从光标到行尾的内容               
"\cA                                 在行位插入注释符号，并进入插入模式                    
"\ca                                 在/**/和//之间切换                              
"\cl                                 与cc相同，只是左对齐                                    
"\cb                                 与cc相同，只是两端对齐                   

"在c++中强制使用/**/注释,默认为//
let g:nerdaltdelims_cpp=1 

"按F9智能注释
nmap <f9> <plug>NERDCommenterToggle
vmap <f9> <plug>NERDCommenterToggle

"按F10在插入模式中注释
imap <f10> <plug>NERDCommenterInsert 



"""""""""""""""""""""""""""""""""""""airline"""""""""""""""""""""""""""""""""
"启动显示状态行1,总是显示状态行2
set laststatus=2

"命令行（在状态行下）的高度，默认为1，这里是2
set cmdheight=2

"设置状态栏主题
"let g:airline_theme='simple'



"""""""""""""""""""""""""""""""""""""ultisnips""""""""""""""""""""""""""""""""
"设置触发键
let g:UltiSnipsExpandTrigger="<tab>"      

"后一个
let g:UltiSnipsJumpForwardTrigger="<c-j>"  

"前一个
let g:UltiSnipsJumpBackwardTrigger="<c-k>"  

"打开补全列表
let g:UltiSnipsListSnippets="<c-tab>" 

"指定snippets文件的目录，可以有多个且该目录runtimepath 中的某一项之下
let g:UltiSnipsSnippetsDir="~/.vim/myUltiSnips"

"指定snippets文件的搜索路径
let g:UltiSnipsSnippetDirectories=["UltiSnips",$HOME."/.vim/myUltiSnips"] 

"设置窗口打开的方式：normal当前窗口 horizontal水平vertical垂直context智能 
let g:UltiSnipsEditSplit="normal" 


"指定ultisnip使用python3
let g:UltiSnipsUsePythonVersion=3 



""""""""""""""""""""""""""""""""""vim缩进"""""""""""""""""""""""""""""""""""""""""""
"不要自动多行显示
set nowrap

"显示制表符TAB
set list

"使用|代替制表符，方便对齐显示，可以改为自己想要的符号,第一个字符显示一次，第二字符重复显示"
set listchars=tab:↓·,trail:◆
"是否将<tab>替换为空格
set noexpandtab


"已经存在文件里的 <Tab>的宽度 
set tabstop=8

"插入时<Tab>和<BS>的宽度，感觉上就像使用单个 <Tab> 一样，而实际上使用的是<Tab>+空格的混合。
"如果为零，关闭此特性。如果为负，使用 'shiftwidth'的值。如果置位 'paste'选项，'softtabstop' 被设为0。'paste' 复位时恢复本选项。
set softtabstop=8 

"自动缩进(换行或者选中行后使用>>或者<<进行缩进)每一级使用的空白数目.如果为零，使用 'tabstop' 的值。如果 expandtab 开启是插入的是Space
"如果noexpandtab 且 softtabstop 与 tabstop 一致时，是 TAB 符号。
set shiftwidth=8 

"打开后，在行首插入或删除<Tab> 根据 'shiftwidth' 插入或删除空白。而'tabstop' 或 'softtabstop' 用在别的地方。<backspace>删除行首 'shiftwidth' 那么多的空白
"如果关闭，<Tab> 总是根据 'tabstop' 或 'softtabstop' 决定插入空白的数目。'shiftwidth' 只用于文本左移或右移。 
set smarttab 


"设置允许退格的位置，0等同于set backspace=(Vi 兼容);1等同于set backspace=indent,eol;2等同于set backspace=indent,eol,start;
"其中indent 允许在缩进上退格，eol允许在换行符(行尾)上退格,start 允许在插入位置上退格
set backspace=2 

"autoindent自动对齐（继承前一行的缩进方式,智能缩进smartindent，c风格缩进cindent，自定义缩进indentexpr,后一种会覆盖前一种
if &filetype == 'c'
	set cindent "使用C样式的缩进  
elseif &filetype == 'cpp'
	set cindent "使用C样式的缩进
elseif &filetype == 'java' 
	set cindent "使用C样式的缩进  
else
	set smartindent "智能自动缩进（以c程序的方式）  
endif

"""""""""""""""""""""""""""""""""""vim 搜索/替换""""""""""""""""""""""""""""""""""""""""

"开启高亮显示结果   
set hlsearch 

"搜索到文件末不回到文件首 
set nowrapscan 

"输入搜索内容时实时显示结果，关闭则回车后显示 
set incsearch 

""""""""""""""""""""""""""""""""""vim编码方式"""""""""""""""""""""""""""""""""""""""""""

"设置 Vim 内部使用的字符编码。
set encoding=utf-8 

"设置当前编辑的文件的字符编码 
set fileencoding=utf-8 

"Vim 启动时会按照它所列出的字符编码方式逐一探测即将打开的文件的字符编码方式，并且将 fileencoding 设置为最终探测到的字符编码方式。
set fileencodings=utf-8,gbk,cp936,latin-1,ucs-bom,GB18030 "这是一个字符编码的列表，开始编辑已存在的文件时，参考此选项。

"""""""""""""""""""""""""""""""""""""""""""""""""vim高亮""""""""""""""""""""""""""""""""""""""""""""""""""
"开启语法高亮
syntax on 

"显示行号
set number

"开启高亮光标行
set cursorline
highlight CursorLine  ctermbg=black ctermfg=NONE

"开启高亮光标列
set cursorcolumn
highlight CursorColumn ctermbg=black  ctermfg=darkyellow


"高亮第80 90列
set colorcolumn=81
highlight colorcolumn ctermbg=2 ctermfg=16

"Vim识别三种不同的终端：term，黑白终端；cterm，彩色终端；gui，gvim窗口。
"term,cterm,gui可以定义其字体显示为：bold、underline、reverse、italic或standout。
"ctermfg设置前景色；ctermbg设置背景色。

"高亮显示匹配的括号,类似当输入一个左括号时会匹配相应的那个右括号
set showmatch 

"匹配括号高亮的时间（单位是十分之一秒）
set matchtime=4 

"""""""""""""""""""""""""""""""""""vim 其它设置""""""""""""""""""""""""""""""""""""""""

"代码补全功能，可以选择preview以在顶配生成一个选项预览窗口，menu选项以弹出菜单出现，
"或者longest，在输入位置只显示最长的匹配，menuone仅有一个选项也弹出菜单
set completeopt=longest,menu 

"去掉输入错误的提示声音
set noerrorbells

"将当前工作目录切换至所打开的文件目录
set autochdir

"设置tags文件的搜索路径
set tags+=./tags

"支持cscope
if has("cscope")
    " use both cscope and ctag for 'ctrl-]', ':ta', and 'vim -t'
    set cscopetag

    " check cscope for definition of a symbol before checking ctags: set to 1
    " if you want the reverse search order.
    set csto=0

    " add any cscope database in current directory
    if filereadable("cscope.out")
        cs add cscope.out  
    " else add the database pointed to by environment variable 
    elseif $CSCOPE_DB != ""
        cs add $CSCOPE_DB
    endif

    " show msg when any other cscope db added
    set cscopeverbose  
endif
