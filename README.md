[![Melpa Status](http://melpa.org/packages/mode-line-bell-badge.svg)](http://melpa.org/#/mode-line-bell)
[![Melpa Stable Status](http://stable.melpa.org/packages/mode-line-bell.svg)](http://stable.melpa.org/#/mode-line-bell)
<a href="https://www.patreon.com/sanityinc"><img alt="Support me" src="https://img.shields.io/badge/Support%20Me-%F0%9F%92%97-ff69b4.svg"></a>

# Flash the Emacs mode line instead of ringing the bell

## Installation

### MELPA

If you're an Emacs 24 user or you have a recent version of
`package.el` you can install `mode-line-bell` from the
[MELPA](http://melpa.org) repository. The version of
`mode-line-bell` there will always be up-to-date.

Enable `mode-line-bell-mode` with `M-x mode-line-bell-mode`, by using
the customisation interface, or by adding code such as the following
to your emacs startup file:

```elisp
(mode-line-bell-mode)
```

### Manual

Ensure `mode-line-bell.el` is in a directory on your load-path, and
add the following to your `~/.emacs` or `~/.emacs.d/init.el`:

```elisp
(require 'mode-line-bell)
(mode-line-bell-mode)
```

## About

Author: Steve Purcell <steve at sanityinc dot com>

Homepage: https://github.com/purcell/mode-line-bell

This little library was extracted from the author's
[full Emacs configuration](https://github.com/purcell/emacs.d), which
readers might find of interest.

<hr>

Author links:

[💝 Support this project and my other Open Source work](https://www.patreon.com/sanityinc)

[💼 LinkedIn profile](https://uk.linkedin.com/in/stevepurcell)

[✍ sanityinc.com](http://www.sanityinc.com/)

[🐦 @sanityinc](https://twitter.com/sanityinc)
