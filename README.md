# Demo-Distribution
Demonstrating the sample Erlang Distrubution

1> c(test1).
{ok,test1}
2> test1:start(node()).
<0.40.0>

First we will see how non-distribution node will works
3> Pid=test1:start(node()).
<0.42.0>

about start function in test1.erl  moduel
%%start function takes an input as node()
Start function will call the builtin function %%spawn%%% this function will creats a new process,
spawn(Node,test1,loop,[])
here Node is unbound variable whatever we pass the node name process to be created at that node


3> Pid=test1:start(node()).
<0.42.0>

In the above step we got Pid because start function is returning a Pid and now we can bale to send message to that Pid using !
4> Pid! hello.
[<0.42.0>,hello]
hello


DISTRIBUTED NODES

Start erlang in two different nodes and there is one security mechanism we must set the same cookie for both the nodes for them allowed to be talk to each other


(vamsi1@local)1> erlang:set_cookie(node(),abcd).
true

setting same cookie for both nodes as abcd 


(vamsi2@local)1> erlang:set_cookie(node(),abcd).
true


Here from vamsi1 node  we will passa another node name as a argument to the start function 

(vamsi1@local)3> Pid=test1:start(vamsi2@local).
<9773.45.0>
(vamsi1@local)4> Pid! hello.
hello

check it out in other node you will find the print statement find belwo the same 


(vamsi2@local)2> [<0.45.0>,hello]


What i am trying to convinvce you is there is no big work involved scaling your software up

