use v6;

for slurp.trim-trailing.split("\n").map({ .Int }).combinations(2) -> $comb {
  if $comb[0] + $comb[1] == 2020 {
    say $comb[0] * $comb[1];
    exit
  }
}
