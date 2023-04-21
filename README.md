# aardwolfmaps

aardwolfmaps is yet another attempt to build maps for aardwolf mud (multi-user
dungeons). the build is based on dot language
(https://graphviz.org/doc/info/lang.html) which is a simple text format file
for directed graphs.

to start, see `src/example.dot` and `Makefile`

# usage

``` text
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

# notes

``` text
# getting room number in aardwolf
- gmcp give vnum for room if it's not maze
- if it's maze then the vnum is -1
- check how aardmush uses gmcphandler plugin It has great notes in it (the plugin)
fiendish has done all that for mapper etc through that
- maybe you can fork out something through reading what fiendish has done. Basically
everything is there already. Just integrating it all to your own client and how is your problem
```

# reference

- <https://graphviz.org/doc/info/command.html>
- <https://plantuml-documentation.readthedocs.io/en/latest/command_line_reference.html>
- <https://gohugo.io/getting-started/quick-start/>
- <https://kroki.io/>
- <https://crashedmind.github.io/PlantUMLHitchhikersGuide/layout/layout.html>
