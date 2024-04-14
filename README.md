[![Actions Status](https://github.com/lizmat/List-Agnostic/actions/workflows/test.yml/badge.svg)](https://github.com/lizmat/List-Agnostic/actions)

NAME
====

List::Agnostic - be a list without knowing how

SYNOPSIS
========

    use List::Agnostic;
    class MyList does List::Agnostic {
        method AT-POS() { ... }
        method elems()  { ... }
    }

    my @m is MyList = 1,2,3;

    my @m is List::Agnostic = ...;

DESCRIPTION
===========

This module makes a `List::Agnostic` role available for those classes that wish to implement the `Positional` role as an immutable `List`. It provides all of the `List` functionality while only needing to implement 4 methods:

Required Methods
----------------

### method AT-POS

    method AT-POS($position) { ... }  # simple case

Return the value at the given position in the list.

### method elems

    method elems(--> Int:D) { ... }

Return the number of elements in the list (defined as the index of the highest element + 1).

Optional Methods (provided by role)
-----------------------------------

You may implement these methods out of performance reasons yourself, but you don't have to as an implementation is provided by this role. They follow the same semantics as the methods on the [List object](https://docs.raku.org/type/List).

In alphabetical order: `append`, `Array`, `end`, `gist`, `iterator`, `keys`, `kv`, `list`, `List`, `new`, `pairs`, `perl`, `shape`, `Slip`, `Str`, `values`

AUTHOR
======

Elizabeth Mattijsen <liz@raku.rocks>

Source can be located at: https://github.com/lizmat/List-Agnostic . Comments and Pull Requests are welcome.

If you like this module, or what I’m doing more generally, committing to a [small sponsorship](https://github.com/sponsors/lizmat/) would mean a great deal to me!

COPYRIGHT AND LICENSE
=====================

Copyright 2024 Elizabeth Mattijsen

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

