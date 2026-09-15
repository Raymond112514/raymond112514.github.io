---
layout: post
title: Separable Extensions
description: Separable polynomials, elements, and field extensions.
date: 2025-06-29
categories: notes
series: Galois Theory
series_order: 4
related_posts: false
---

A polynomial $p(x)\in F[x]$ is called separable if it has no multiple roots in its splitting field. Equivalently, if

$$
p(x)=c(x-\alpha_1)\cdots(x-\alpha_n)
$$

in a splitting field, then $p(x)$ is separable if the roots $\alpha_1,\dots,\alpha_n$ are all distinct.

{% example %}
**Example 1.** The polynomial $x^2-2\in \mathbb{Q}[x]$ is separable because its roots are $\sqrt{2}$ and $-\sqrt{2}$, which are distinct. However, the polynomial $(x^2-2)^n$ is not separable for $n\ge 2$, because its roots occur with multiplicity $n$.
{% endexample %}

There is a simple criterion for detecting multiple roots. First, we define the derivative of a polynomial. If

$$
p(x)=c_nx^n+c_{n-1}x^{n-1}+\cdots+c_1x+c_0
$$

then its derivative is

$$
Dp(x)=nc_nx^{n-1}+(n-1)c_{n-1}x^{n-2}+\cdots+c_1
$$

{% theorem %}
**Theorem.** A polynomial $p(x)\in F[x]$ is separable if and only if

$$
\gcd(p(x),Dp(x))=1
$$

{% proof %}
We show that $p(x)$ has a multiple root if and only if $p(x)$ and $Dp(x)$ have a common root.

Suppose $\alpha$ is a multiple root of $p(x)$. Then in a splitting field, we can write

$$
p(x)=(x-\alpha)^m g(x)
$$

with $m\ge 2$. Taking derivatives gives

$$
Dp(x)=m(x-\alpha)^{m-1}g(x)+(x-\alpha)^mDg(x)
$$

Thus $\alpha$ is also a root of $Dp(x)$.

Conversely, suppose $\alpha$ is a root of both $p(x)$ and $Dp(x)$. Since $\alpha$ is a root of $p(x)$, write

$$
p(x)=(x-\alpha)h(x)
$$

Then

$$
Dp(x)=h(x)+(x-\alpha)Dh(x)
$$

Substituting $x=\alpha$ gives

$$
Dp(\alpha)=h(\alpha)
$$

But $Dp(\alpha)=0$, so $h(\alpha)=0$. Hence $x-\alpha$ divides $h(x)$, and therefore $(x-\alpha)^2$ divides $p(x)$. Thus $\alpha$ is a multiple root.

So $p(x)$ has a multiple root if and only if $p(x)$ and $Dp(x)$ have a common root. Therefore $p(x)$ is separable if and only if

$$
\gcd(p(x),Dp(x))=1
$$
{% endproof %}
{% endtheorem %}

For irreducible polynomials, this criterion becomes especially simple.

{% theorem %}
**Theorem.** Let $p(x)\in F[x]$ be irreducible. Then $p(x)$ is separable if and only if

$$
Dp(x)\neq 0
$$

{% proof %}
By the previous theorem, $p(x)$ is separable if and only if

$$
\gcd(p(x),Dp(x))=1
$$

Since $p(x)$ is irreducible, the only possibilities are

$$
\gcd(p(x),Dp(x))=1
$$

or

$$
\gcd(p(x),Dp(x))=p(x)
$$

The second case means $p(x)$ divides $Dp(x)$. But $\deg Dp<\deg p$, so this can only happen if

$$
Dp(x)=0
$$

Therefore $p(x)$ is not separable if and only if $Dp(x)=0$. Equivalently, $p(x)$ is separable if and only if

$$
Dp(x)\neq 0
$$
{% endproof %}
{% endtheorem %}

This immediately gives the following theorem:

{% theorem %}
**Theorem.** If $F$ has characteristic $0$, then every irreducible polynomial in $F[x]$ is separable. Therefore every algebraic extension of $F$ is separable.

{% proof %}
Let $p(x)\in F[x]$ be irreducible. Since $\operatorname{char}(F)=0$, the derivative of any nonconstant polynomial is not identically zero. Thus

$$
Dp(x)\neq 0
$$

By the previous theorem, $p(x)$ is separable.

Therefore every algebraic element over $F$ has a separable minimal polynomial. Hence every algebraic extension of $F$ is separable.
{% endproof %}
{% endtheorem %}

Thus, algebraic extensions of fields such as $\mathbb{Q}$, $\mathbb{R}$, and $\mathbb{C}$ are automatically separable. Inseparability can only occur in positive characteristic, below provides an example.

{% example %}
**Example 2.** Let $F=\mathbb{F}_p(t)$, where $t$ is transcendental over $\mathbb{F}_p$. Consider

$$
p(x)=x^p-t\in F[x]
$$

If $\alpha$ is a root, then

$$
\alpha^p=t
$$

In characteristic $p$, we have

$$
Dp(x)=px^{p-1}=0
$$

Also,

$$
x^p-t=x^p-\alpha^p=(x-\alpha)^p
$$

So $p(x)$ has only one root, with multiplicity $p$. Therefore $\alpha$ is algebraic over $F$, but not separable over $F$.
{% endexample %}
