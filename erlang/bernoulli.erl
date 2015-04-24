-module(bernoulli).
-export([binom/2,bern/1,berno/1,fac/1]).

bern(N) ->
    B = array:new(N),
    bern(array:set(0,1,B),1,N).
    
bern(B,M,N) when M == N ->
    array:get(N-1,B);

bern(B0,M,N) ->
    H = fun 
        Help(B,K) when K == M ->
            B;
        Help(B,K) ->
            X = array:get(M,B),
            Y = binom(M + 1,K),
            Z = array:get(K,B),
            
            io:format("X = ~p,~nY = ~p,~nZ = ~p~n~n",[X,Y,Z]),
            Bm = X - (Y * Z),
            NewB = array:set(M,Bm,B),
            Help(NewB,K + 1)
    end,
    B1 = array:set(M,0,B0),
    B2 = H(B1,0),
    B3 = array:set(M,array:get(M,B2)/(M + 1),B2),
    bern(B3,M+1,N).

berno(0) -> 1;   
berno(N) -> - lists:sum([1/(fac(K) * (N - K + 1)) * berno(K)||K <- lists:seq(0,N - 1)]).
binom(N,K)->
    binom(N,K,1).

binom(_N,0,R) ->
    R;

binom(N,K,R)->
    NewR = R * (N - K + 1)/K,
    binom(N,K - 1,NewR).

fac(0) -> 1;
fac(N) -> N * fac(N - 1).


    
    
