Set commonItems(List lists) {
  return lists.fold<Set>(
      lists.first.toSet(), (a, b) => a.intersection(b.toSet()));
}
