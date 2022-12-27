# aardwolfmaps

aardwolfmaps is yet another attempt to build maps for aardwolf mud (multi-user
dungeons). the build is based on dot language
(https://graphviz.org/doc/info/lang.html) which is a simple text format file
for directed graphs.

to start, see `src/example.dot` and `Makefile`

# usage

``` console
# using the makefile
make                            # show make menu
make maps                       # build maps in src directory

# using graphviz to generate svg
dot -Tsvg dotgraph.dot > output.svg

# use nop to validate graphs
- https://graphviz.org/docs/layouts/nop/
```

# reference

- <https://graphviz.org/doc/info/command.html>
