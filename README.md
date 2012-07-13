Thesauri
--------

[Homepage](http://github.com/tomku/thesauri)

This is a simple plugin that integrates an external thesaurus file into vim's
user completion function mechanism.  I wrote it because I was unhappy with
vim's default thesaurus (see :help 'thesaurus'), which dealt poorly with all
of the plain-text thesaurus word lists I could find online.  Starting from the
excellent (albeit perhaps overly comprehensive) [Moby Project](http://icon.shef.ac.uk/Moby/)'s thesaurus,
I tried to come up with a way to get it into vim with minimal modifications.

Unfortunately their file uses ancient Mac line endings that make it a pain to
grep through.  You can use the following Perl command to fix the line endings
in the Moby thesaurus, but be sure to redirect it unless you like 24mb of text
dumped into your terminal.

    perl -ple 's/\r?\n|\r/\n/g' mobythes.aur > newfile

The resulting file is happily processed by both GNU grep and Microsoft's
findstr.exe, and hopefully other grep utilities too.  Any other method that
converts line endings to Unix should also be sufficient to make it usable.

When you have your thesaurus file processed, store it somewhere safe and point
`g:mobythesaurus_file` at like so:

    let g:mobythesaurus_file = $HOME . "/.vim/mobythesaur-vim.txt"

It'd probably also be helpful to set `completefunc` to CompleteThesauri so
that you can actually use the function, like so:

    set completefunc=CompleteThesauri

Once everything is set up, you can invoke thesaurus completion via your user
completion hotkey, Ctrl-x Ctrl-u by default.  This leaves the default thesaurus
functionality untouched, in case you use it for other purposes.

As the included LICENSE file indicates, this plugin is released under the GPLv2
license.
