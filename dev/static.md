📌 When to Use Static Methods?
✔ Utility functions that do not depend on instance variables.
✔ Pure functions that do not maintain state.
✔ Global, reusable logic that is the same across all instances.
✔ Performance-critical code where object creation overhead is a concern.

📌 When to Use Instance Methods?
✔ When dependency injection is needed.
✔ When you need mocking & testing flexibility.
✔ When logic depends on instance variables.
✔ When overriding & inheritance is important.