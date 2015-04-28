-module(bernoulli).
-export([berno/1]).
% http://en.wikipedia.org/wiki/Bernoulli_number 
berno(0) -> 1;
berno(N) -> - lists:sum(  [(binom(N, K)/(N - K + 1)) * berno(K)||K <- lists:seq(0,N - 1)]  ).

binom(N,K)->
    binom(N,K,1).
binom(_N,0,R) ->
    R;
binom(N,K,R)->
    NewR = R * (N - K + 1)/K,
    binom(N,K - 1,NewR).