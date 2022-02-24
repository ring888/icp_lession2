import Int "mo:base/Int";
import quickSort "sort";

actor {
  public query func qsort(xs : [Int]) : async [Int] {
    return quickSort.sortBy(xs, Int.compare);
  };
};