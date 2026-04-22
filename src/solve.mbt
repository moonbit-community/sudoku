///|
fn search(
  values : Grid[@sorted_set.SortedSet[Char]]
) -> Grid[@sorted_set.SortedSet[Char]]? {
  if values.contains(fn(digits) { !(digits.length() == 1) }) {
    let mut minsq = ""
    let mut n = 10
    for sq in squares {
      let len = values[sq].length()
      if len > 1 {
        if len < n {
          n = len
          minsq = sq
        }
      }
    }
    for digit in values[minsq] {
      let another = values.copy()
      if assign(another, minsq, digit) {
        let temp = search(another)
        match temp {
          None => continue
          Some(v) => return Some(v)
        }
      }
    } nobreak {
      return None
    }
  } else {
    return Some(values)
  }
}

///|
fn solve(g : String) -> String {
  match search(Grid::parse(g)) {
    None => "can't solve \{g}"
    Some(v) => v.format()
  }
}

///|
test {
  inspect(
    solve(grid1),
    content=
      #| 4  1  7 | 3  6  9 | 8  2  5
      #| 6  3  2 | 1  5  8 | 9  4  7
      #| 9  5  8 | 7  2  4 | 3  1  6
      #|---------+---------+---------
      #| 8  2  5 | 4  3  7 | 1  6  9
      #| 7  9  1 | 5  8  6 | 4  3  2
      #| 3  4  6 | 9  1  2 | 7  5  8
      #|---------+---------+---------
      #| 2  8  9 | 6  4  3 | 5  7  1
      #| 5  7  3 | 2  9  1 | 6  8  4
      #| 1  6  4 | 8  7  5 | 2  9  3
      #|
    ,
  )
}
