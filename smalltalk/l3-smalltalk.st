Object subclass: #Math.
Math class extend [

  from: n take: k
  [
    | r |
    r := 1.
    1 to: k do: [:i |
      r := (r * ((n - i + 1))) / i.
    ].
    ^r
  ]

  bernoulli: n
  [
    | B t|
    B := Array new: n + 1.
    B at: 1 put: 1.
    1 to: n do: [:m|
      B at: (m + 1) put: 0.
      0 to: (m - 1) do: [:k |
        B at: (m + 1) put: (
          (B at: (m + 1)) - ((Math from: (m+1) take: k) * (B at: (k+1)))
        ).
      ].
      B at: (m + 1) put: (
        (B at: (m + 1)) / (m + 1)
      ).
    ].
    ^B at:n+1.
  ]
]

result := Math bernoulli: 4.
result printNl.
