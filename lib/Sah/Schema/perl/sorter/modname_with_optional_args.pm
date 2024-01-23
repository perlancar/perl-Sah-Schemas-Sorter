package Sah::Schema::perl::sorter::modname_with_optional_args;

use strict;

# AUTHORITY
# DATE
# DIST
# VERSION

our $schema = [str => {
    summary => 'Perl Sorter::* module name without the prefix (e.g. Foo::bar) with optional arguments (e.g. Foo::baz,qux,quux)',
    description => <<'_',

Perl Sorter::* module name without the prefix, with optional arguments which
will be used as import arguments, just like the `-MMODULE=ARGS` shortcut that
`perl` provides. Examples:

    Foo::bar
    Foo::baz=qux,quux
    Foo::baz,qux,quux

See also: `perl::sorter::modname`.

_
    match => '\A[A-Za-z_][A-Za-z_0-9]*(::[A-Za-z_0-9]+)*(?:=.*)?\z',

    'prefilters' => [
        'Perl::normalize_perl_modname',
    ],

    # XXX also provide completion for arguments
    'x.completion' => ['perl_sorter_modname_with_optional_args'],

    examples => [
        {value=>'', valid=>0},
        {value=>'Foo/Bar', valid=>1, validated_value=>'Foo::Bar'},
        {value=>'Foo/Bar=a,1,b,2', valid=>1, validated_value=>'Foo::Bar=a,1,b,2'},
        {value=>'Foo bar', valid=>0},
    ],

}];

1;
# ABSTRACT:
