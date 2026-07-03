---
layout: post
title: Field Extension
description: Constructing field extensions by adjoining roots of irreducible polynomials.
date: 2025-06-26
categories: notes
related_posts: false
---

Given two fields $F$ and $K$, we say $K$ is an extension of $F$ if $F$ is a subfield of $K$, which we will denote by $K/F$. In this case, $K$ can be viewed as a vector space over $F$. The dimension of this vector space is called the degree of the field extension and is denoted by $[K:F]$.

A particularly convenient way of constructing field extensions is by adjoining roots of polynomials. Suppose $p(x)\in F[x]$ is irreducible, and we want to construct a field extension of $F$ in which $p(x)$ has a root. The idea is to start with the polynomial ring $\mathbb{F}[x]$ and force the relation $p(x)=0$, which can be done through quotienting by the ideal $(p(x))$.

- **Observation 1:** The quotient $\mathbb{F}[x]/(p(x))$ is a field, since $(p(x))$ is a maximal ideal.
- **Observation 2:** The element $x+(p(x)) \in \mathbb{F}[x]/(p(x))$ is now a root of $p(x)$, this is because

$$p(x+ (p(x))) = \sum_{i=0}^n a_i (x+(p(x)))^i = p(x) + (p(x)) = 0$$

Therefore, we have constructed a field extension of $F$, namely $F[x]/(p(x))$, and in this field, the element $x+(p(x))$ is a root of $p(x)$. We now turn to several examples.

{% example %}
**Example 1.** Consider $F=\mathbb{R}$ and $p(x)=x^2+1$. The field extension of $F$ that contains a root of $p(x)$ is given by

$$
\mathbb{R}[x]/(x^2+1)
$$

The elements of this field are of the form $a+bx$ where $a, b \in \mathbb{R}$. We can perform basic arithmetic operations in this field. For example, addition gives

$$
(a+bx) + (c+dx) = (a+c) + (b+d)x
$$

Multiplication is more interesting. Since $x^2+1=0$, we have

$$
\begin{align*}
  (a+bx) \cdot (c+dx) &= ac + adx + bcx + bdx^2 \\
  &= ac + adx + bcx + bdx(-1) \\
  &= (ac-bd) + (ad+bc)x
\end{align*}
$$

If we identify $x=i$, then this recovers the complex field $\mathbb{C}$. In this case, we see that we can construct the complex field with such a field extension.
{% endexample %}

{% example %}
**Example 2:** Consider $F=\mathbb{Q}$ and $p(x)=x^2-2$. The field extension of $F$ that contains a root of $p(x)$ is given by

$$
\mathbb{Q}[x]/(x^2-2)
$$

The elements of this field are of the form $a+bx$ where $a, b \in \mathbb{Q}$. Multiplication in the field is defined as

$$
\begin{align*}
  (a+bx) \cdot (c+dx) &= ac + adx + bcx + bdx^2 \\
  &= ac + adx + bcx + bd(2) \\
  &= (ac+2bd) + (ad+bc)x
\end{align*}
$$

We can identify $x=\sqrt{2}$ in this field; we denote this field by $\mathbb{Q}(\sqrt{2})$. Note that we can as well define $x=-\sqrt{2}$ in this field, in which case we get an isomorphic field $\mathbb{Q}(-\sqrt{2})$.
{% endexample %}

{% example %}
**Example 3:** Consider $F=\mathbb{Q}$ and $p(x)=x^3-2$. The field extension of $F$ that contains a root of $p(x)$ is given by

$$
\mathbb{Q}[x]/(x^3-2)
$$

The elements of this field are of the form $a+bx+cx^2$ where $a, b, c \in \mathbb{Q}$.
{% endexample %}

From the above examples, we can see a few patterns

- **Observation 1:** If $p(x)$ has degree $n$, then the elements of $K=F[x]/(p(x))$ are of the form

  $$
  a_0 + a_1 x + \cdots + a_{n-1} x^{n-1}
  $$

  where $a_i \in F$. The basis of $K$ as a vector space over $F$ is $\{1, x, x^2, \cdots, x^{n-1}\}$, and therefore $[K:F]=n$.

- **Observation 2:** The roots of $p(x)$ are algebraically indistinguishable. In particular, defining $x$ to be any root of $p(x)$ gives the same field extension. We will prove this in Theorem 2.

So far we have constructed a field extension containing a root of a polynomial. It turns out that this construction gives the smallest such field extension. Let $F(\alpha)$ to be the smallest field that contains both $F$ and $\alpha$, we now show that if $\alpha$ is a root of $p(x)$, then our construction $F[x]/(p(x))$ is isomorphic to $F(\alpha)$.

{% theorem %}
**Theorem 1.** Let $F$ be a field and $p(x)\in F[x]$ be an irreducible polynomial. Suppose $K$ is an extension field of $F$ containing a root $\alpha$ of $p(x)$. Then

$$
F(\alpha) \cong F[x]/(p(x))
$$

{% proof %}
Consider the homomorphism $\phi: F[x] \to F(\alpha)$ given by

$$
\phi: f(x) \mapsto f(\alpha)
$$

Then $p(x)$ is in the kernel of $\phi$. This induces a homomorphism

$$
\phi: F[x]/(p(x)) \to F(\alpha)
$$

Since $p(x)$ is irreducible, the quotient ring $F[x]/(p(x))$ is a field. Therefore, $\phi$ is a field isomorphism. The quotient is isomorphic to the image of $\phi$, which is a subfield of $F(\alpha)$ containing both $F$ and $\alpha$. By definition, though, this is exactly $F(\alpha)$. This proves the claim.
{% endproof %}
{% endtheorem %}

We now prove that different roots of $p(x)$ have the same algebraic properties.

{% theorem %}
**Theorem 2 (Extension Theorem):** Let $F, F'$ be fields and $\phi$ be an isomorphism between $F$ and $F'$. The map induces a ring isomorphism $\phi: F[x] \to F'[x]$

$$
\phi: p(x) \mapsto p'(x)
$$

where $p'(x)$ is defined by applying $\phi$ to the coefficients of $p(x)$. Let $\alpha, \beta$ be roots of $p(x)$ and $p'(x)$ respectively. Then there is an isomorphism

$$
\sigma: F(\alpha) \to F'(\beta), \qquad \alpha \mapsto \beta
$$

such that $\sigma$ restricted to $F$ is $\phi$. Pictorially, we have

$$
\begin{array}{cccc}
\sigma: & F(\alpha) & \xrightarrow{\ \ \sim\ \ } & F'(\beta) \\
& \big\vert &  & \big\vert \\
\phi: & F & \xrightarrow{\ \ \sim\ \ } & F'
\end{array}
$$

{% proof %}
The isomorphism induces the isomorphism of fields

$$
F[x] / (p(x)) \xrightarrow{\ \ \sim\ \ } F'[x] / (p'(x))
$$

By Theorem 1, we see that

$$
F(\alpha) \cong F[x] / (p(x)) \sim F'[x] / (p'(x)) \cong F'(\beta)
$$

This proves the claim.
{% endproof %}
{% endtheorem %}

To see how this implies that the roots are algebraic indistinguishable, we apply the above theorem with $F'=F$ and $\phi=\mathrm{id}_F$, this then implies that $F(\alpha) \cong F(\beta)$.
