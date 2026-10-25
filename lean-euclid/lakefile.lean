import Lake
open Lake DSL

package «lean-euclid» where
  -- 关闭自动隐式变量，避免拼写错误被静默接受。
  leanOptions := #[
    ⟨`autoImplicit, false⟩
  ]

require mathlib from git
  "https://github.com/leanprover-community/mathlib4.git" @ "master"

@[default_target]
lean_lib EuclidWhale
