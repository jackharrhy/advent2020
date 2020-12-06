use v6;

for slurp.trim-trailing.split("\n").map({ .Int }).combinations(2) -> @comb {
  if @comb.sum == 2020 {
    say [*] @comb;
    exit
  }
}
