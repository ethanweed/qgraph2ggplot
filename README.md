# qgraph2ggplot

## Boring personal history
Nobody else in the world seems to need this, but I do. For a long time I have wanted a way to build network graphs using the `qgraph` package, but then save the output as a `grob` or some other format that I can then manipulate, e.g. to combine with other figures built using `ggplot2`. After much searching and trying everything I could think of, converting in and out of `igraph` format, messing around with [ggraph](https://github.com/thomasp85/ggraph), [tidygraph](https://github.com/thomasp85/tidygraph), etc., I decided to just build the function that I wanted. Inspired by a [blogpost by Christopher Chizinski](https://chrischizinski.github.io/rstats/igraph-ggplotll/), I started deconstructing the `qgraph` object and extracting the data I needed to reconstruct my lovely `qgraph` output as a `ggplot2` object. With a bit of fussing, I got things just the way I wanted, so that the two figures were nearly identical.

Actually making the figure look exactly the way I wanted takes a bit of fiddling. For example, getting the colors just the way I want involves deconstructing my figure made with `ggplot2` with `ggplot_build()`, manually altering values, and then reconstructing the figure with `ggplot_gtable()`. But here I am collecting functions to make this process faster in the future. As I say, I seem to be the only person in the world who needs these functions, so they are pretty bare bones, but I welcome any contributions. Fork 'em, and make a pull request :-)

## tldr

Some helper functions to make `gplot2` figures out of `qgraph` figures.

