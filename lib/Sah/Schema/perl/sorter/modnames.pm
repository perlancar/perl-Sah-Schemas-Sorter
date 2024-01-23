package Sah::Schema::perl::sorter::modnames;

use strict;

# AUTHORITY
# DATE
# DIST
# VERSION

our $schema = [array => {
    summary => 'Array of Perl Sorter::* module names without the prefix, e.g. ["Foo::bar", "Foo::baz"]',
    description => <<'_',

Array of Perl Sorter::* module names, where each element is of
`perl::sorter::modname` schema, e.g. `Foo::bar`, `Foo::baz`.

Contains coercion rule that expands wildcard, so you can specify:

    Foo::*

and it will be expanded to e.g.:

    ["Foo::bar", "Foo::baz"]

The wildcard syntax supports jokers (`?`, `*`, `**`), brackets (`[abc]`), and
braces (`{one,two}`). See <pm:Module::List::Wildcard> for more details.

_
    of => ["perl::sorter::modname", {req=>1}],

    'x.perl.coerce_rules' => [
        ['From_str_or_array::expand_perl_modname_wildcard', {ns_prefix=>'Sorter'}],
    ],

    # provide a default completion which is from list of installed perl modules
    'x.element_completion' => ['perl_modname', {ns_prefix=>'Sorter'}],

}];

1;
# ABSTRACT:
