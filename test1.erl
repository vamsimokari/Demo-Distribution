-module(test1).
%-compile(export_all).
-export([start/1]).
-export([loop/1]).
%start(Node)=Pid()
%Node=atom(), The node where print-process shall be started,
%%starts a print process and returns the process id of newly
%% created process.
start(Node)->
        spawn(Node,test1,loop,[]).
loop()->
        receive
           Anything->
                erlang:display([self(),Anything]),
                loop()
          end.
