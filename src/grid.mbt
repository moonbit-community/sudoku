///|
struct Grid[T] {
  data : FixedArray[T]
}

///|
fn[T] Grid::new(val : T) -> Grid[T] {
  { data: FixedArray::make(81, val) }
}

///|
fn[T] Grid::copy(self : Grid[T]) -> Grid[T] {
  let arr = FixedArray::make(self.data.length(), self.data[0])
  for i in 0..<self.data.length() {
    arr[i] = self.data[i]
  }
  { data: arr }
}

///|
fn square_to_int(s : String) -> Int {
  if s[0] is ('A'..='I') && s[1] is ('1'..='9') {
    let row = (s[0] - 'A').to_int()
    let col = (s[1] - '1').to_int()
    return row * 9 + col
  } else {
    abort("Grid_to_int(): \{s} is not a Grid")
  }
}

///|
test {
  inspect(square_to_int("A1"), content="0")
  inspect(square_to_int("A7"), content="6")
  inspect(square_to_int("I9"), content="80")
}

///|
fn[T] Grid::op_get(self : Grid[T], square : String) -> T {
  let i = square_to_int(square)
  self.data[i]
}

///|
fn[T] Grid::op_set(self : Grid[T], square : String, x : T) -> Unit {
  let i = square_to_int(square)
  self.data[i] = x
}

///|
fn[T] Grid::contains(self : Grid[T], pred : (T) -> Bool) -> Bool {
  let mut result = false
  for i in 0..<self.data.length() {
    result = result || pred(self.data[i])
    if result {
      break
    }
  }
  return result
}
