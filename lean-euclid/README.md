# lean-euclid

用 Lean 4 + Mathlib 形式化证明：**任意正整数都存在一个比它大的素数**。

## 文件

| 文件 | 说明 |
| --- | --- |
| `EuclidWhale.lean` | 定理与证明 |
| `lakefile.lean` | Lake 构建配置（依赖 Mathlib） |
| `lean-toolchain` | Lean 版本声明 |

## 重要：验证状态

**本工程尚未编译验证。** 生成时环境中没有 Lean 工具链，按需求选择"只写代码、不安装不编译"。
代码在逻辑上与 Euclid 证明一致，但**不排除**语法错误或引理名与当前 Mathlib 版本不匹配。

## 复现步骤

```bash
# 1. 安装 elan（Lean 版本管理器）
#    Windows: https://github.com/leanprover/elan

# 2. 让 Lean 版本与 Mathlib 要求对齐
#    最稳妥的做法是复制 Mathlib 仓库根目录的 lean-toolchain：
#    https://github.com/leanprover-community/mathlib4/blob/master/lean-toolchain

# 3. 下载 Mathlib 预编译缓存（关键，否则要本地编译数小时）
lake exe cache get

# 4. 构建
lake build
```

构建成功后，文件末尾的 `#check` 与 `#print axioms` 会输出定理类型与所依赖的公理。
**期望**：公理列表只包含 `propext`、`Classical.choice`、`Quot.sound` 这类标准公理，
**不出现** `sorryAx`，说明证明是完整的、没有使用 `sorry`。

## 定理

```lean
theorem exists_prime_gt_of_pos (n : ℕ) (_hn : 0 < n) :
    ∃ p : ℕ, p.Prime ∧ n < p
```

即：对任意正整数 `n`，存在素数 `p` 满足 `p > n`。
