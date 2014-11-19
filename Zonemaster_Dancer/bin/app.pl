#!/usr/bin/env perl
use Dancer;
use Plack::Builder;
#use PocketIO;
use Plack::App::File;
use dnscheck;
#use sockets;
use zonemaster_nojs;
use FindBin;

#my $websockets = PocketIO->new(class => 'sockets', method => 'run');

my $app = sub {
    my $env = shift;
 #   $env->{ws} = $websockets;
    my $request = Dancer::Request->new( env => $env );
    Dancer->dance($request);
};

builder {
#    mount '/socket.io' => $websockets;

    mount "/" => builder {$app};
};
