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
make website                    # build website in src directory
make maps                       # build maps in src directory

# graphviz generate svg
dot -Tsvg dotgraph.dot > output.svg

# graphviz use nop to validate graphs
- https://graphviz.org/docs/layouts/nop/

# hugo generate new posts
cd src/website
hugo new posts/my-first-post.md

# hugo add new theme
git submodule add https://github.com/theNewDynamic/gohugo-theme-ananke themes/ananke
```

# reference

- <https://graphviz.org/doc/info/command.html>
- <https://gohugo.io/getting-started/quick-start/>
- <https://kroki.io/>
