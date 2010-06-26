######################################################################
# Test suite for Proc::Info::Environment
# by Mike Schilli <cpan@perlmeister.com>
######################################################################
use warnings;
use strict;
use Test::More qw(no_plan);
use Proc::Info::Environment;

my $env = Proc::Info::Environment->new();
my $data = $env->env( $$ );

is $data->{PATH}, $ENV{PATH}, "env path";
