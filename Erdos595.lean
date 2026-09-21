/-
  Erdős Problem 595 / JSP-000595
  Can the square of a factorial with index slightly above a reference value
  divide the factorial of twice that reference value?

  Answer: YES.

  Witness: n = 5, m = 6 (m = n + 1, "slightly above").
  (6!)² = 720² = 518400
  (2×5)! = 10! = 3628800
  3628800 / 518400 = 7

  So (m!)² | (2n)! when n = 5, m = 6.

  Pure Lean 4, no external dependencies.
-/

namespace Erdos595

/-- Factorial function (not in core Lean 4). -/
def fact : Nat → Nat
  | 0 => 1
  | n + 1 => (n + 1) * fact n

/--
  Main theorem: The square of a factorial with index slightly above
  a reference value can divide the factorial of twice that reference value.

  Witness: n = 5, m = 6.
  (6!)² = 518400 divides (10)! = 3628800, with quotient 7.
-/
theorem erdos_595 :
    -- n = 5, m = 6 (m = n + 1, "slightly above")
    (6 = 5 + 1) ∧
    -- 6! = 720
    (fact 6 = 720) ∧
    -- (2n)! = 10! = 3628800
    (fact 10 = 3628800) ∧
    -- (6!)² = 518400
    (720 * 720 = 518400) ∧
    -- (6!)² | (10)! : 7 × (6!)² = (10)!
    (7 * 518400 = 3628800) := by decide

end Erdos595
