/-
  任意正整数都存在比它大的素数
  ============================================================

  数学证明（Euclid 反证法）
  ------------------------------------------------------------
  设 n 为正整数，令 N = n! + 1。

  1. N > 1，故 N 必有素因子 p（每个大于 1 的自然数都有素因子）。
  2. 断言 p > n。若 p ≤ n，则 p ∣ n!；又 p ∣ N = n! + 1，
     于是 p ∣ (n! + 1) - n! = 1，与 p 是素数矛盾。
  3. 因此 p > n，即为所求。

  本文件调用 Mathlib 中已形式化的 Euclid 定理
  `Nat.exists_infinite_primes`，再用 `omega` 完成收尾。
-/

import Mathlib

namespace EuclidWhale

/-- 任意正整数都存在一个比它大的素数。 -/
theorem exists_prime_gt_of_pos (n : ℕ) (_hn : 0 < n) :
    ∃ p : ℕ, p.Prime ∧ n < p := by
  -- Euclid 定理的无界形式：对任意 m，存在素数 p ≥ m。
  obtain ⟨p, hp_ge, hp_prime⟩ := Nat.exists_infinite_primes (n + 1)
  -- 由 n + 1 ≤ p 推出 n < p。
  exact ⟨p, hp_prime, by omega⟩

/-- 去掉正性假设的加强版本：对一切自然数成立。 -/
theorem exists_prime_gt (n : ℕ) : ∃ p : ℕ, p.Prime ∧ n < p :=
  exists_prime_gt_of_pos n (Nat.zero_lt_succ n)

/-- 集合论形式：素数集合是无穷集。 -/
theorem infinite_setOf_prime : Set.Infinite {p : ℕ | p.Prime} :=
  Nat.infinite_setOf_prime

end EuclidWhale

-- 以下命令用于人工核对：应当打印出定理类型，且公理列表中不出现 sorryAx。
#check @EuclidWhale.exists_prime_gt_of_pos
#print axioms EuclidWhale.exists_prime_gt
#print axioms EuclidWhale.infinite_setOf_prime
