# 📘 LaTeX Lecture Notes Template

一个用于编写课程讲义 / 笔记的 LaTeX 模板，支持漂亮的数学公式、定理环境、目录、页眉页脚，以及常用的概率/统计快捷命令。

---

## ✨ 特性

- 使用 **newpxtext + newpxmath** 字体（更美观的衬线 + 数学字体）
- 设置合理的 **页面边距、行距、段落间距**
- 自动优化 **目录（TOC）排版**
- 定义大量概率 / 统计学常用符号与简写
- 提供 **定理、引理、命题、推论、定义、例子、注解** 等环境
- 页眉支持 **课程简称 + 当前章节标题**

---

## 📦 主要宏包

- 数学支持: `amsmath, amsthm, amssymb, mathtools, dsfont, units`
- 图形支持: `graphicx, wrapfig, subfig, float`
- 代码高亮: `listings, pythonhighlight, inconsolata`
- 版面/标题: `fancyhdr, sectsty, hyperref, enumitem, framed, titlesec`
- 字体: `newpxtext, newpxmath, inconsolata`
- 目录: `tocloft`
- 其它: `xcolor, lipsum`

---

## 📐 页面设置

- 页边距: `left=1.35in, right=1.35in, top=1.0in, bottom=0.9in`
- 行距: `1.2`
- 段间距: `1.3mm`
- 页眉: 
  - 左侧 → 课程简称（超链接到目录）
  - 右侧 → 当前章节标题
- 目录优化:
  - 减少章节间距
  - 移除缩进与编号
  - 目录标题加粗大号字体

---

## 🔧 自定义命令

| 命令 | 定义 | 用途 | 使用示例 |
|------|------|------|-----------|
| `\numberthis` | `\addtocounter{equation}{1}\tag{\theequation}` | 给多行公式的单行编号 | ```align* a &= b+c \\ d &= e+f \numberthis \end{align*}``` |
| `\b` | `\mathbf` | 粗体字母 | `$ \b{X} $` |
| `\bg` | `\boldsymbol` | 粗体希腊字母 | `$ \bg{\beta} $` |
| `\mc` | `\mathcal` | 花体字母 | `$ \mc{M} $` |
| `\converge[<text>]` | `\xrightarrow{#1}` | 收敛 | `$ X_n \converge[p] X $` |
| `\wconverge[<text>]` | `\stackrel{#1}{\rightharpoonup}` | 弱收敛 | `$ \mu_n \wconverge[n\to\infty] \mu $` |
| `\equals[<text>]` | `\stackrel{\smash{#1}}{=}` | 等号上加注释 | `$ X \equals[d] Y $` |
| `\normal{μ}{σ}` | `\mathcal{N}(#1,#2)` | 正态分布 | `$ X \sim \normal{\mu}{\sigma^2} $` |
| `\unif{a}{b}` | `\text{Uniform}(a,b)` | 均匀分布 | `$ U \sim \unif{0}{1} $` |
| `\iid` | `\stackrel{\smash{\text{iid}}}{\sim}` | 独立同分布 | `$ X_i \iid \normal{0}{1} $` |
| `\bk{A_n}{n\geq 1}` | `\{#1\}_{#2}` | 序列 | `$ \bk{A_n}{n\geq 1} $` |
| `\R, \C, \Q, \Z, \N` | `\mathbb{R},...` | 常见数集 | `$ x \in \R, \C $` |
| `\F, \El, \B` | `\mathcal{F}, \mathcal{L}, \mathcal{B}` | 常用花体符号 | `$ \F, \El^2, \B $` |
| `\pr, \E, \var, \cov, \corr` | 概率相关符号 | 概率、期望、方差、协方差、相关 | `$ \pr(A), \E[X], \var(X) $` |
| `\tth` | `\text{th}` | 非斜体 "th" | `$ n^\tth $` |
| `\Oh` | `\mathcal{O}` | 大 O 符号 | `$ f(n) = \Oh(n^2) $` |
| `\1` | `\mathds{1}` | 指示函数 | `$ \1_A(x) $` |
| `\argmax, \argmin` | `\DeclareMathOperator*` | argmax/argmin | `$ \argmax_{\theta} L(\theta) $` |
| `\spann, \bias, \ran` | `\DeclareMathOperator*` | Span, Bias, Range | `$ \spann(v_1,...,v_n) $` |
| `\dv` | `d\!` | 积分微分号 | `$ \int f(x)\dv x $` |
| `\diag, \trace, \supp` | `\DeclareMathOperator*` | 矩阵对角、迹、支集 | `$ \trace(A), \diag(v) $` |
