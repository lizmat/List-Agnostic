use Array::Agnostic:ver<0.0.13+>:auth<zef:lizmat>;

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
        self!cannot: "initialize", "in"   # UNCOVERABLE
    }

    method append(|)  { self!cannot: "append",  "to"   }
    method grab(|)    { self!cannot: "grab",    "from" }
    method prepend(|) { self!cannot: "prepend", "to"   }
    method pop(|)     { self!cannot: "pop",     "from" }
    method push(|)    { self!cannot: "push",    "to"   }
    method shift(|)   { self!cannot: "shift",   "from" }
    method splice(|)  { self!cannot: "splice",  "from" }
    method unshift(|) { self!cannot: "unshift", "to"   }
}

# vim: expandtab shiftwidth=4
