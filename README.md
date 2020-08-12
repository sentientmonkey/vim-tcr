```
   ________________
  /_  __/ ____/ __ \
   / / / /   / /_/ /
  / / / /___/ _, _/
 /_/  \____/_/ |_|

Test && Commit || Revert for vim
```

# tcr.vim

This plugin allows you to set up a TCR flow inside of vim. This is a work in progress,
and still evolving so it's very simple. I wrote this because I was tired of using the
same autocmd one-liner before practing TCR.

## What is TCR?

[test && commit || revert](https://medium.com/@kentbeck_7670/test-commit-revert-870bbd756864)
is a development methology as an offshoot of Test-Driven Development (TDD). The idea is that
Every time you save a file, you run all of the tests. If it fails, your changes are reverted.
If it passes, a small commit is made and you can continue.

Inspiration:

- [TCR test && commit || revert -- Rope in Python 1/3 by Kent Beck](https://www.youtube.com/watch?v=Aof0F9DvTFg&t=974s)
- [RailsConf 2019 - From test && commit || revert to LIMBO by Shane Becker by Kent Beck](https://www.youtube.com/watch?v=Z_LoGqMugN0)

## Installing

Use your favorite plugin manager. I tend to use [vim-plug](https://github.com/junegunn/vim-plug).

```
  Plug 'sentientmonkey/vim-tcr'
```

## Commands

```
:TCR    " Toggles TCR mode off/on
:TCRon  " Turns TCR mode on
:TCRoff " Turns TCR mode off
```

When TCR mode is on, every time you save, it will run your tests. If they pass, the plugin will
add and commit the working file.

## Supported filetypes

Right now, only the following filetypes are supported, and customizing test runners is
not yet a supported feature.

- ruby
- javascript
- typescript
- kotlin

## Features

Lots of features not yet implemented. Here's a running list.

[x] Runs tests on save
[x] Configurable commit message
[x] Configurable revert command
[ ] Configurable for other filetypes
[ ] Configurable for other test commands
[ ] Add all files in working directory before commit
[ ] See history of output after pressing enter
[ ] Handle multiple file saves at once
