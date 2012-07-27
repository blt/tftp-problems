# Erlang tftp problems

## Introduction

This project is a demonstration of my problems with Erlang's tftp daemon. It's
intended to be used as a basis for mailing list and stackoverflow
questioneering.

## The Problem

I'm attempting to use inet's tftp, but I'm doing something incorrectly. This
simple example application, while it does bind to the correct port, never
returns data to a client.

To reproduce, open a terminal in the project root and:

    make && ./bin/console

This should boot the tftp_hellp application, and drop you into an erlang
shell. Confirm that inets is running:

    1> application:which_applications().
    [{inets,"INETS  CXC 138 49","5.9"},
     {sasl,"SASL  CXC 138 11","2.2.1"},
     {stdlib,"ERTS  CXC 138 10","1.18.1"},
     {kernel,"ERTS  CXC 138 10","2.15.1"}]

and that the tftp daemon is running:

    2> inets:services().
    [{tftpd,<0.56.0>},{httpc,<0.50.0>}]

Great. Now, if you look in `etc/inets.config` you'll notice we're binding tftpd
to 6969. Open another terminal and:

    > tftp localhost 6969
    tftp> get hello.txt
    Transfer timed out.

Bother. If my understanding of tftpd were correct--which clearly it's not--we'd
get `<<"hello world">>` back.

What am I doing wrong?
