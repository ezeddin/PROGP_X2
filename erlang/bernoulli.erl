-module(bernoulli).
-export([berno/1,be/1]).
be(N)-> [A|_]=(b(N)),
        {_,B}=A,
        B.
b(0) ->[{0,1}];
b(N) -> Bp=b(N-1), [{N, lists:foldr(fun({A, B}, Accin) ->Accin-(binom(N, A)/(N-A+1))*B end, 0, Bp)} | Bp].

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