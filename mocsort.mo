import Array "mo:base/Array";
import Debug "mo:base/Debug";
import Int "mo:base/Int";
import Nat "mo:base/Blob";
import Order "mo:base/Order";
import sNat "mo:base/Nat";


  type Order = Order.Order;
  func quickSort<X>(xs : [X], f : (X, X) -> Order) : [X] {
    let n = xs.size();
    if (n < 2) {
      return xs;
    } else {
      let result = Array.thaw<X>(xs);
      sortHelp<X>(result, 0, n - 1, f);
      return Array.freeze<X>(result);
    };
  };

  func sortHelp<X>(
    xs : [var X],
    l : Int,
    r : Int,
    f : (X, X) -> Order,
  ) {
    if (l < r) {
      var i = l;
      var j = r;
      var swap  = xs[0];
      let pivot = xs[Int.abs(l + r) / 2];
      while (i <= j) {
        while (Order.isLess(f(xs[Int.abs(i)], pivot))) {
          i += 1;
        };
        while (Order.isGreater(f(xs[Int.abs(j)], pivot))) {
          j -= 1;
        };
        if (i <= j) {
          swap := xs[Int.abs(i)];
          xs[Int.abs(i)] := xs[Int.abs(j)];
          xs[Int.abs(j)] := swap;
          i += 1;
          j -= 1;
        };
      };
      if (l < j) {
        sortHelp<X>(xs, l, j, f);
      };
      if (i < r) {
        sortHelp<X>(xs, i, r, f);
      };
    };
  };

  var arr = [5,3,0,9,8,2,1,4,7,6];
  var result = quickSort(arr , Int.compare);
    Debug.print(debug_show(result))
