#!perl -T ## no critic (TidyCode)

use strict;
use warnings;

our $VERSION = 0;

require Locale::Utils::PlaceholderMaketext;

my $obj = Locale::Utils::PlaceholderMaketext->new;

() = print
    $obj->maketext_to_gettext('foo [_1] bar'),
    "\n",
    $obj->maketext_to_gettext('~~ % foo ~[[_1]~] bar'),
    "\n",
    $obj->maketext_to_gettext('foo [_1] bar [quant,_2,singluar,plural,zero] baz'),
    "\n",
    $obj->maketext_to_gettext('bar [*,_2,singluar,plural] baz'),
    "\n";

# $Id: 01_maketext_to_gettext.pl 397 2012-04-24 15:15:49Z steffenw $

__END__

Output:

foo %1 bar
~ %% foo [%1] bar
foo %1 bar %quant(%2,singluar,plural,zero) baz
bar %*(%2,singluar,plural) baz
