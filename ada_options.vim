"------------------------------------------------------------------------------
"  Description: Options setable by the Ada plugin
"     Language: Ada (2012)
"    Copyright: Copyright (C) 2006 … 2022 Martin Krischik
"   Maintainer:	Martin Krischik
"      Version: 5.4.0
"      History:	24.05.3.06 MK Unified Headers
"		16.07.2006 MK Ada-Mode as vim-ball
"		02.10.2006 MK Folding for "gnat pretty"
"		15.10.2006 MK Bram's suggestion for runtime integration
"		05.11.2006 MK Bram suggested to save on spaces
"		01.09.2022 MK Use GitHub and dein to publish new versions
"		12.09.2022 MK Rainbow Parenthesis have been updated and
"			      modernised so they are a viable light weight
"			      alternative to rainbow.
"		25.10.2022 MK Add Alire compiler support
"		28.10.2022 MK Issue #13 Fix key and menu mappings.
"	 Usage: copy content into your .vimrc and change options to your
"		likeing.
"    Help Page: ft-ada-options
"------------------------------------------------------------------------------

echoerr 'It is suggested to copy the content of ada_options into .vimrc!'
finish

" Section: Ada options {{{1

   let	 g:ada_abbrev		       = 1
   let	 g:ada_default_compiler	       = 'alire'
   let	 g:ada_extended_tagging	       = 'list'
   let	 g:ada_folding		       = 'i'
"  let	 g:ada_folding		       = 'gibxp'
"  let	 g:ada_folding		       = 'spftc'
   let	 g:ada_rainbow_color	       = 1
   let	 g:ada_space_errors	       = 1
   let	 g:ada_standard_types	       = 1
   let	 g:ada_with_gnat_project_files = 1
"  let	 g:ada_extended_completion     = 1
"  let	 g:ada_line_errors	       = 1
"  let	 g:ada_omni_with_keywords      = 1

   let	 g:Tlist_Exit_OnlyWindow       = 1
   let	 g:Tlist_File_Fold_Auto_Close  = 1
   let	 g:Tlist_Sort_Type	       = "name"

   let	 g:NERD_use_ada_with_spaces    = 1

   let	 g:backup_directory	       = '.backups'
   let	 g:backup_purge		       = 10

   let	 g:mapleader		       = "<F12>"
"  let	 g:no_plugin_maps	       = 1
"  let	 g:no_ada_maps		       = 1

   if &diff
       let   g:Tlist_Auto_Open	       = 0
   else
       let   g:Tlist_Auto_Open	       = 1
   endif

   filetype plugin indent on
   syntax enable

" }}}1

" Section: Vimball options {{{1
:set expandtab fileformat=unix encoding=utf-8
:.+2,.+13 MkVimball ada-4.6.2

ada_options.vim
autoload/ada.vim
autoload/adacomplete.vim
autoload/alire.vim
autoload/gnat.vim
compiler/alire.vim
compiler/gnat.vim
doc/ft_ada.txt
ftdetect/ada.vim
ftplugin/ada.vim
indent/ada.vim
plugin/ada.vim
syntax/ada.vim

" }}}1

" Section: Tar options {{{1

tar --create --bzip2	      \
   --file="ada-4.6.2.tar.bz2" \
   ada_options.vim	      \
   autoload/ada.vim	      \
   autoload/adacomplete.vim   \
   autoload/alire.vim	      \
   autoload/gnat.vim	      \
   compiler/alire.vim	      \
   compiler/gnat.vim	      \
   doc/ft_ada.txt	      \
   ftdetect/ada.vim	      \
   ftplugin/ada.vim	      \
   indent/ada.vim	      \
   plugin/ada.vim	      \
   syntax/ada.vim	      ;

" }}}1

" Section: Quick Installation {{{1

gcp --verbose --archive --update ada_options.vim   ~/vimfiles/bundles/.cache/.vimrc/.dein/
gcp --verbose --archive --update autoload/*.vim	   ~/vimfiles/bundles/.cache/.vimrc/.dein/autoload/
gcp --verbose --archive --update compiler/*.vim	   ~/vimfiles/bundles/.cache/.vimrc/.dein/compiler/
gcp --verbose --archive --update doc/*.txt	   ~/vimfiles/bundles/.cache/.vimrc/.dein/doc/
gcp --verbose --archive --update ftdetect/*.vim	   ~/vimfiles/bundles/.cache/.vimrc/.dein/ftdetect/
gcp --verbose --archive --update ftplugin/*.vim	   ~/vimfiles/bundles/.cache/.vimrc/.dein/ftplugin/
gcp --verbose --archive --update indent/*.vim	   ~/vimfiles/bundles/.cache/.vimrc/.dein/indent/
gcp --verbose --archive --update plugin/*.vim	   ~/vimfiles/bundles/.cache/.vimrc/.dein/plugin/
gcp --verbose --archive --update syntax/*.vim	   ~/vimfiles/bundles/.cache/.vimrc/.dein/syntax/

" }}}1

"------------------------------------------------------------------------------
"   Vim is Charityware - see ":help license" or uganda.txt for licence details.
"------------------------------------------------------------------------------
" vim: set textwidth=0 nowrap tabstop=8 shiftwidth=3 softtabstop=3 noexpandtab :
" vim: set filetype=vim fileencoding=utf-8 fileformat=unix foldmethod=marker :
" vim: set spell spelllang=en_gb :
