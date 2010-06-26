###########################################
package Proc::Info::Environment;
###########################################
use strict;
use warnings;

our $VERSION = "0.01";

our %OS_MAP = (
    "linux" => "Linux",
);

###########################################
sub new {
###########################################
    my($class, %options) = @_;

    my $self = {
        %options,
    };

    my $os = $OS_MAP{ $^O };

    if(! defined $os ) {
        die "OS $^O not supported";
    }

    my $subclass = "Proc::Info::Environment::$os";
    eval "require $subclass";

    bless $self, $subclass;

    return $self;
}

###########################################
sub os_not_supported_error_message {
###########################################
    return "OS $^O not supported (only " .
           join(', ', sort keys %OS_MAP) .
           " so far)";
}

###########################################
sub os_supported {
###########################################
    if(exists $OS_MAP{ $^O } ) {
        return 1;
    }

    return 0;
}

###########################################
sub error {
###########################################
    my($self, $error) = @_;

    if(defined $error) {
        $self->{error} = $error;
    }

    return $self->{error};
}

1;

__END__

=head1 NAME

Proc::Info::Environment - blah blah blah

=head1 SYNOPSIS

    use Proc::Info::Environment;

=head1 DESCRIPTION

Proc::Info::Environment blah blah blah.

=head1 EXAMPLES

  $ perl -MProc::Info::Environment -le 'print $foo'

=head1 LEGALESE

Copyright 2010 by Mike Schilli, all rights reserved.
This program is free software, you can redistribute it and/or
modify it under the same terms as Perl itself.

=head1 AUTHOR

2010, Mike Schilli <cpan@perlmeister.com>
