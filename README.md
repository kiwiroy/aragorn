# aragorn
mirror of code from http://mbioserv2.mbioekol.lu.se/ARAGORN/Downloads/

## Publication

http://nar.oxfordjournals.org/content/32/1/11.long

## Compiling

From http://mbioserv2.mbioekol.lu.se/ARAGORN/Downloads/

```
The tar ball only contains two files, the ARAGORN source
(aragorn1.2.36.c or similar) and a man page (aragorn.1). 
Uncompress with:

tar -xvzf aragorn1.2.36.tgz

Compiling example:

gcc -O3 -ffast-math -finline-functions -o aragorn aragorn1.2.36.c

Put the aragorn man page in a directory read by the man command. 
These directories may be listed by:

echo $MANPATH
```
