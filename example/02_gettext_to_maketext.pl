#!perl -T ## no critic (TidyCode)

use strict;
use warnings;

our $VERSION = 0;

require Locale::Utils::PlaceholderMaketext;

my $obj = Locale::Utils::PlaceholderMaketext->new;

() = print
    $obj->gettext_to_maketext('foo %1 bar'),
    "\n",
    $obj->gettext_to_maketext('~ %% foo [%1] bar'),
    "\n",
    $obj->gettext_to_maketext('foo %1 bar %quant(%2,singluar,plural,zero) baz'),
    "\n",
    $obj->gettext_to_maketext('bar %*(%2,singluar,plural) baz'),
    "\n";

# $Id: 02_gettext_to_maketext.pl 397 2012-04-24 15:15:49Z steffenw $

__END__

Output:

foo [_1] bar
~~ % foo ~[[_1]~] bar
foo [_1] bar [quant,_2,singluar,plural,zero] baz
bar [*,_2,singluar,plural] baz
