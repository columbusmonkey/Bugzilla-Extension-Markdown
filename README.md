# Bugzilla Markdown Extension

## Installation

 1. Copy the `Markdown` directory into the Bugzilla extensions directory.
 2. Run `chcksetup.pl`

## Status

Mostly works, but still not quite a 1.0 release.

Tested against Bugzilla 4.5.

This extension currently uses a hook that is not yet part of the
Bugzilla core.

A patch to add this hook is included : `bugzilla-4_5.patch`.

 1. cd bugzilla
 2. Apply the patch using `patch -p 0 -i bugzilla-4_5.patch`

## Features

 - Support Markdown mark-up in Bugzilla comments.

## Issues

 - Needs some more testing

 - The first line of a quoted comment ("> ") comment is not
   highlighted in the sme way as subsequent lines.

## Future

 - Add a parameter to be able to switch the mark-up processing on and
   off for individual users.
