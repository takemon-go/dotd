# dotd

## Introduction

dotd is a vim plugin which adds a set of abbreviations for quick inserting date and time.  
You only input `.d` and `<Space>`|`<CR>`, it is expanded to date like `2020.03.09`.

## Installation

### To install using [vim-plug](https://github.com/junegunn/vim-plug):

Add to vim-plug section of your `~/.vimrc`

```
call plug#begin()
Plug 'takemon-go/dotd'
call plug#end()
```

Reload .vimrc and `:PlugInstall`.

### To checkout the source from repository:

```
git clone https://github.com/takemon-go/dotd.git
cd dotd/
mkdir -p ~/.vim/{autoload,doc,plugin}
cp autoload/dotd.vim ~/.vim/autoload/
cp plugin/dotd.vim ~/.vim/plugin/
cp doc/dotd.txt ~/.vim/doc/
vim -u NONE -c "helptags ~/.vim/doc" -c q
```

## Abbreviations

dotd provides end-id type [abbreviations](http://vimdoc.sourceforge.net/htmldoc/map.html#abbreviations) for insert mode.

```
..d         2020.03.09
...d        12:34:56
....d       2020.03.09 12:34:56

.'d         20200309
..'d        123456
...'d       20200309123456

./d         2020/03/09
.-d         2020-03-09
.:d         12:34:56

..:d        2020.03.09 12:34:56
./:d        2020/03/09 12:34:56
.-:d        2020-03-09 12:34:56
```

## Commands

Remove abbreviations of dotd.

```
:DotdNo
```

Add abbreviations of dotd.

```
:DotdOn
```

## Variables

* `g:dotd_date_fmt`

    Format string of date part for [strftime()](http://man7.org/linux/man-pages/man3/strftime.3.html)  
    `"/"` is defined as separator.  
    default: `"%Y/%m/%d"`

* `g:dotd_date_sep`

    Separator for `..d` and date part of `....d`  
    default: `"."`

* `g:dotd_time_fmt`

    Format string of time part for [strftime()](http://man7.org/linux/man-pages/man3/strftime.3.html)  
    `":"` is defined as separator.  
    default: `"%H:%M:%S"`

* `g:dotd_time_sep`

    Separator for `...d` and time part of `....d`  
    default: `":"`

* `g:dotd_datetime_sep`

    Separator between date and time for `....d`  
    default: `" "`

