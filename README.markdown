# .emacs.d

This is my personal Emacs configuration. It was originally a fork of Emacs
Starter Kit, but since that project is no longer under active development, I
am gradually evolving it into being its own thing, and trying to consolidate
the parts of Emacs Starter Kit that I still use.

This configuration works with Emacs 23, and maybe even Emacs 22. I have
backported some modules from v2 of Emacs Starter Kit, which ordinarily
requires Emacs 24. I think Emacs 24 is great, and I use it, but I'm not ready
to drop support for older versions since I still use some machines that don't
have Emacs 24 yet.

All the Emacs Starter Kit stuff is in "esk". Libraries that I can get to work
from ELPA/Marmalade are in "elpa", and ones I haven't, or have had to make
modifications to, are in "vendor" (previously known as "elpa-to-submit"). My
settings, tweaks, and experiments are in "personal".

## Thanks

Thanks to @technomancy for making Emacs Starter Kit. I learned lots of good
tricks from it that I use every day. Thanks also to John Wiegley for showing
me the ropes with Emacs Lisp back in the day.

Dave Benjamin / @ramenlabs
