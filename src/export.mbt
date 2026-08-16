///|
pub fn init_values() -> Grid[@sorted_set.SortedSet[Char]] {
  let digits = @sorted_set.SortedSet(cols.to_array())
  Grid::new(digits)
}

///|
pub fn solve_values(
  values : Grid[@sorted_set.SortedSet[Char]],
) -> Grid[@sorted_set.SortedSet[Char]] {
  match search(values) {
    None => abort("solve() : cant solve")
    Some(v) => v
  }
}

///|
pub fn ij_assign(
  values : Grid[@sorted_set.SortedSet[Char]],
  i : Int,
  j : Int,
  val : Int,
) -> Bool {
  let key = "\{Int::unsafe_to_char(rows[i].to_int())}\{Int::unsafe_to_char(cols[j].to_int())}"
  let val = Int::unsafe_to_char(val + 48)
  assign(values, key, val)
}

///|
pub fn ij_read(
  values : Grid[@sorted_set.SortedSet[Char]],
  i : Int,
  j : Int,
) -> Int {
  let key = "\{Int::unsafe_to_char(rows[i].to_int())}\{Int::unsafe_to_char(cols[j].to_int())}"
  let digit = values[key].min()
  digit.to_int() - 48
}
