-module(bernoulli).
-export([binom/2]).

binom(N,K)->
    binom(N,K,1).

binom(N,1,R) ->
    R;

binom(N,K,R)->
    NewR = R * (N - K + 1)/K,
    binom(N,K - 1,NewR).
    


    
    
