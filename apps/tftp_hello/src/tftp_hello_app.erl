-module(tftp_hello_app).

-behaviour(application).

%% Application callbacks
-export([start/0, start/2, stop/1]).

start() ->
    application:start(tftp_hello_app).

%% ===================================================================
%% Application callbacks
%% ===================================================================

start(_StartType, _StartArgs) ->
    tftp_hello_sup:start_link().

stop(_State) ->
    ok.
