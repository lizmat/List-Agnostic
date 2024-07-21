use Array::Agnostic:ver<0.0.13>:auth<zef:lizmat>;

role List::Agnostic does Array::Agnostic {
    method !cannot(str $action, str $preposition) {
        die "Can not $action values $preposition an immutable " ~ self.^name;
    }

#---- Methods that need overriding ---------------------------------------------

    method CLEAR() { self }

#---- Methods not allowed by Lists ---------------------------------------------

    method ASSIGN-POS(|) { self!cannot: "assign",     "in"   }
    method BIND-POS(|)   { self!cannot: "bind",       "to"   }
    method DELETE-POS(|) { self!cannot: "remove",     "from" }

    multi method STORE(::?ROLE:D: \iterable, :$INITIALIZE!) {
      self!cannot: "initialize", "in"
    }

    method append(|)  { self!cannot: "append",  "to"   }
    method grab(|)    { self!cannot: "grab",    "from" }
    method prepend(|) { self!cannot: "prepend", "to"   }
    method pop(|)     { self!cannot: "pop",     "from" }
    method push(|)    { self!cannot: "push",    "to"   }
    method shift(|)   { self!cannot: "shift",   "from" }
    method splice(|)  { self!cannot: "splice",  "from" }
    method unshift(|) { self!cannot: "unshift", "from" }
}

=begin pod

=head1 NAME

List::Agnostic - be a list without knowing how

=head1 SYNOPSIS

=begin code :lang<rakulang>

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

=end code

=head1 DESCRIPTION

This module makes a C<List::Agnostic> role available for those classes that
wish to implement the C<Positional> role as an immutable C<List>.  It
provides all of the C<List> functionality while only needing to implement
4 methods:

Note that contrary to other C<Agnostic> modules, this module assumes that
there is an existing data structure to which a C<Positional> interface is
needed.

=head2 Required Methods

=head3 method AT-POS

=begin code :lang<rakulang>

method AT-POS($position) { ... }  # simple case

=end code

Return the value at the given position in the list.

=head3 method elems

=begin code :lang<rakulang>

method elems(--> Int:D) { ... }

=end code

Return the number of elements in the list (defined as the index of the
highest element + 1).

=head2 Optional Methods (provided by role)

You may implement these methods out of performance reasons yourself, but you
don't have to as an implementation is provided by this role.  They follow the
same semantics as the methods on the
L<List object|https://docs.raku.org/type/List>.

In alphabetical order:
C<append>, C<Array>, C<end>, C<gist>, C<iterator>, C<keys>, C<kv>,
C<list>, C<List>, C<new>, C<pairs>, C<perl>, C<shape>, C<Slip>, C<Str>,
C<values>

=head1 AUTHOR

Elizabeth Mattijsen <liz@raku.rocks>

Source can be located at: https://github.com/lizmat/List-Agnostic .
Comments and Pull Requests are welcome.

If you like this module, or what I’m doing more generally, committing to a
L<small sponsorship|https://github.com/sponsors/lizmat/>  would mean a great
deal to me!

=head1 COPYRIGHT AND LICENSE

Copyright 2024 Elizabeth Mattijsen

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

=end pod

# vim: expandtab shiftwidth=4
