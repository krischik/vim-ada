"------------------------------------------------------------------------------
"  Description: Vim Ada/alire compiler file
"     Language: Ada (alire, Alire)
"    Copyright: Copyright (C) 2022 … 2022 Martin Krischik
"   Maintainer:	Martin Krischi <krischik@users.sourceforge.net>k
"      Version: 5.5.0
"      History: 25.10.2022 MK Add Alire compiler support
"		28.10.2022 MK Issue #13 Fix key and menu mappings.
"               21.08.2023 MK Release 5.5.0
"    Help Page: compiler-alire
"------------------------------------------------------------------------------

if version < 700
    finish
endif

function alire#Build () dict					     " {{{1
   wall
   let &l:makeprg     = self.Get_Command('Build')
   let &l:errorformat = self.Error_Format
   make
endfunction alire#Build						     " }}}1

function alire#Run () dict					     " {{{1
   wall
   let &l:makeprg     = self.Get_Command('Run')
   let &l:errorformat = self.Error_Format
   make
   let &l:makeprg     = self.Get_Command('Build')
endfunction alire#Run						     " }}}1

function alire#Test () dict					     " {{{1
   wall
   if isdirectory('test')
      cd test
      call self.Run ()
      cd ..
   else
      call self.Run ()
   endif
endfunction alire#Run						     " }}}1

function alire#Clean () dict					     " {{{1
   wall
   let &l:makeprg     = self.Get_Command('Clean')
   let &l:errorformat = self.Error_Format
   make
   let &l:makeprg     = self.Get_Command('Build')
endfunction alire#Clean						     " }}}1

function alire#Pretty () dict					     " {{{1
   wall
   let &l:makeprg     = self.Get_Command('Pretty')
   let &l:errorformat = self.Error_Format
   make
   let &l:makeprg     = self.Get_Command('Build')
endfunction alire#Pretty					     " }}}1

function alire#Doc () dict					     " {{{1
   wall
   make
   let &l:makeprg     = self.Get_Command('Doc')
   let &l:errorformat = self.Error_Format
   make
   let &l:makeprg     = self.Get_Command('Build')
endfunction alire#Doc						     " }}}1

function alire#Get_Command (Command) dict			     " {{{1
   let l:Command = '"' . eval ('self.' . a:Command . '_Command') . ' ' .  eval ('self.' . a:Command . '_Options') . '"'
   return eval (l:Command)
endfunction alire#Get_Command					     " }}}1

function alire#New ()						     " {{{1
   let l:Retval = {
      \ 'Build'		   : function ('alire#Build'),
      \ 'Run'		   : function ('alire#Run'),
      \ 'Test'		   : function ('alire#Test'),
      \ 'Clean'		   : function ('alire#Clean'),
      \ 'Pretty'	   : function ('alire#Pretty'),
      \ 'Doc'		   : function ('alire#Doc'),
      \ 'Get_Command'      : function ('alire#Get_Command'),
      \ 'Set_Options'	   : function ('alire#Set_Options'),
      \ 'Build_Command'    : 'alr build',
      \ 'Build_Options'	   : '--development',
      \ 'Run_Command'      : 'alr run',
      \ 'Run_Options'	   : '',
      \ 'Clean_Command'    : 'alr clean',
      \ 'Clean_Options'	   : '',
      \ 'Pretty_Command'   : 'alr exec',
      \ 'Pretty_Options'   : '-P1 -- gnatpp',
      \ 'Doc_Command'      : 'alr exec',
      \ 'Doc_Options'	   : '-P1 -- gnatdoc -l -b -p',
      \ 'Error_Format'     : '%f:%l:%c: %trror: %m,'   .
			   \ '%f:%l:%c: %tarning: %m,' .
			   \ '%f:%l:%c: %tnfo: %m,'    .
			   \ '%f:%l:%c: %tow: %m,'     .
			   \ '%f:%l:%c: %tedium: %m,'  .
			   \ '%f:%l:%c: %tigh: %m,'    .
			   \ '%f:%l:%c: %theck: %m,'   .
			   \ '%f:%l:%c: (%ttyle) %m,'   .
			   \ '%f:%l:%c: %m'}

   return l:Retval
endfunction alire#New						  " }}}1

finish " }}}1

"------------------------------------------------------------------------------
"   Vim is Charityware - see ":help license" or uganda.txt for licence details.
"------------------------------------------------------------------------------
" vim: textwidth=0 wrap tabstop=8 shiftwidth=3 softtabstop=3 noexpandtab
" vim: foldmethod=marker
