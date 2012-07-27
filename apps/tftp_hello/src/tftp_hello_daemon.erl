-module(tftp_hello_daemon).

-behavior(tftp).
-export([prepare/6, open/6, read/1, write/2, abort/3]).

%%% tftp callbacks

%% Prepare a to open a file on the client side.
prepare(Peer, Access, Filename, Mode, Options, State) ->
    io:format("prepare :: ~p ~p ~p ~p ~p ~p", [Peer, Access, Filename, Mode, Options, State]),
    {ok, Options, State}.

%% Open a file for read or write access.
open(Peer, Access, Filename, Mode, Options, State) ->
    io:format("open :: ~p ~p ~p ~p ~p ~p", [Peer, Access, Filename, Mode, Options, State]),
    {ok, Options, State}.

%% Read a chunk from the file.
read(State) ->
    io:format("read :: ~p", [State]),
    Bin = <<"hello world">>,
    {last, Bin, byte_size(Bin)}.

%% Write a chunk to the file.
write(Bin, State) when is_binary(Bin) ->
    io:format("write :: ~p ~p", [Bin, State]),
    {error, {undef, "This function is not implemented"}}.

%% The file transfer has been aborted.
abort(Code, Text, State) ->
    io:format("abort :: ~p ~p ~p", [Code, Text, State]),
    ok.
