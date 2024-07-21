[![Actions Status](https://github.com/lizmat/List-Agnostic/actions/workflows/linux.yml/badge.svg)](https://github.com/lizmat/List-Agnostic/actions) [![Actions Status](https://github.com/lizmat/List-Agnostic/actions/workflows/macos.yml/badge.svg)](https://github.com/lizmat/List-Agnostic/actions) [![Actions Status](https://github.com/lizmat/List-Agnostic/actions/workflows/windows.yml/badge.svg)](https://github.com/lizmat/List-Agnostic/actions)

NAME
====

List::Agnostic - be a list without knowing how

SYNOPSIS
========

```rakulang
use List::Agnostic;

my $list = (1, 2, 4, 8, 16, 32, 64, 128);

class MyList does List::Agnostic {
    method AT-POS(\pos) { $list[pos]  }
    method elems()      { $list.elems }
}

my @m is MyList;                  # static at runtime
say @m[3];  # 8

class MyOtherList does List::Agnostic {
    has $!list is built;
    method new($list) { self.bless(:$list) }
    method AT-POS(\pos) { $!list[pos]  }
    method elems()      { $!list.elems }
}

my @o := MyOtherList.new($list);  # settable at runtime
say @o[4];  # 16
```

DESCRIPTION
===========

This module makes a `List::Agnostic` role available for those classes that wish to implement the `Positional` role as an immutable `List`. It provides all of the `List` functionality while only needing to implement 4 methods:

Note that contrary to other `Agnostic` modules, this module assumes that there is an existing data structure to which a `Positional` interface is needed.

Required Methods
----------------

### method AT-POS

```rakulang
method AT-POS($position) { ... }  # simple case
```

Return the value at the given position in the list.

### method elems

```rakulang
method elems(--> Int:D) { ... }
```

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

