---
layout: post
title: Splitting Fields
description: Existence of a field extension in which a polynomial splits completely.
date: 2025-06-28
categories: notes
related_posts: false
---

So far, we have considered extensions obtained by adjoining a single root of a polynomial. But sometimes we want an extension that contains all the roots of a polynomial $p(x)\in F[x]$. This leads to the idea of a splitting field. Formally, an extension $K/F$ is called a splitting field of $p(x)$ if $K$ is the smallest field extension of $F$ over which $p(x)$ splits into linear factors, that is, in $K[x]$ we can write

$$p(x)=c(x-\alpha_1)(x-\alpha_2)\cdots(x-\alpha_n)$$

We can construct the splitting field explicitly if we know all the roots: suppose $\alpha_1,\dots,\alpha_m$ are the distinct roots of $p(x)$, then the splitting field is $F(\alpha_1,\dots,\alpha_m)$.

{% example %}
**Example 1.** Consider $p(x)=x^2-2\in \mathbb{Q}[x]$. The roots are $\sqrt{2}$ and $-\sqrt{2}$. Since both roots lie in $\mathbb{Q}(\sqrt{2})$, the polynomial splits over $\mathbb{Q}(\sqrt{2})$:

$$
x^2-2=(x-\sqrt{2})(x+\sqrt{2}).
$$

Therefore the splitting field of $x^2-2$ over $\mathbb{Q}$ is $\mathbb{Q}(\sqrt{2})$.
{% endexample %}

{% example %}
**Example 2.** Consider $p(x)=x^3-2\in \mathbb{Q}[x]$. Let $\alpha=\sqrt[3]{2}$ and $\omega$ be the primitive third root of unity. The roots of $p(x)$ are $\alpha,\alpha\omega,\alpha\omega^2$. 

The field $\mathbb{Q}(\alpha)$ is not a splitting field since it does not contain the complex roots $\alpha\omega$ and $\alpha\omega^2$. The splitting field is instead $\mathbb{Q}(\alpha,\omega)$. Over this field, we have

$$
x^3-2=(x-\alpha)(x-\alpha\omega)(x-\alpha\omega^2).
$$
{% endexample %}

The following theorem shows that a splitting field of a polynomial always exists. 

{% theorem %}
**Theorem.** Every nonconstant polynomial $p(x)\in F[x]$ has a splitting field over $F$. Moreover, if $\deg p=n$, then its splitting field is a finite extension of $F$, with degree at most $n!$.

{% proof %}
We first show that there exists some extension field where $p(x)$ splits. If $p(x)$ already splits over $F$, then we are done. Otherwise, choose an irreducible factor $q(x)$ of $p(x)$ over $F$. Then

$$
F[x]/(q(x))
$$

is a field, and in this field, $q(x)$ has a root. Therefore $p(x)$ has a root in some finite extension of $F$.

Now factor out this root. We get

$$
p(x)=(x-\alpha)g(x)
$$

over this larger field. Repeating the same process for $g(x)$, we eventually obtain a field $M$ over which $p(x)$ splits completely. It remains to show that $E/F$ is finite:

$$
[E:F]\le n!
$$

Adjoin the roots one at a time. Let $F_0=F$ and $F_i=F_{i-1}(\alpha_i)$. Since $\alpha_1$ is a root of $p(x)$, its minimal polynomial over $F_0$ has degree at most $n$, so $[F_1:F_0]\le n$. After adjoining $\alpha_1$, the polynomial $p(x)$ has one linear factor removed, so the next root $\alpha_2$ is a root of a polynomial of degree at most $n-1$. Hence $[F_2:F_1]\le n-1$. Continuing this way,

$$
[F_i:F_{i-1}]\le n-i+1
$$

Therefore, by the tower law,

$$
[E:F]=\prod_i [F_i:F_{i-1}]\le n(n-1)\cdots 1=n!
$$

Thus the splitting field is finite over $F$.
{% endproof %}
{% endtheorem %}

Now we know that splitting fields exist for any polynomial $p(x)\in F[x]$. In principle, they may be constructed in different ways. However, it turns out that any two splitting fields of the same polynomial are isomorphic. Therefore, we usually refer to "the" splitting field of $p(x)$ over $F$.

{% theorem %}
**Theorem.** Let $\varphi:F\to F'$ be an isomorphism of fields. Let $p(x)\in F[x]$, and let $p'(x)\in F'[x]$ be obtained by applying $\varphi$ to the coefficients of $p(x)$. If $E$ is a splitting field of $p(x)$ over $F$, and $E'$ is a splitting field of $p'(x)$ over $F'$, then $\varphi$ extends to an isomorphism

$$
E\cong E'.
$$

{% proof %}
We prove this by induction on $\deg p$.

If $p(x)$ already splits over $F$, then $E=F$. Similarly, $p'(x)$ splits over $F'$, so $E'=F'$. Thus the result is just the original isomorphism $\varphi:F\to F'$.

Now suppose $p(x)$ does not split over $F$. Let $q(x)$ be an irreducible factor of $p(x)$ with degree at least $2$, and let $q'(x)$ be its image under $\varphi$. Then $q'(x)$ is irreducible over $F'$.

Choose a root $\alpha\in E$ of $q(x)$ and a root $\beta\in E'$ of $q'(x)$. By the previous lemma, $\varphi$ extends to an isomorphism

$$
\varphi_1:F(\alpha)\to F'(\beta).
$$

At this point, we have the following picture:

$$
\begin{array}{ccc}
F & \xrightarrow{\varphi} & F' \\
\subseteq & & \subseteq \\
F(\alpha) & \xrightarrow{\varphi_1} & F'(\beta) \\
\subseteq & & \subseteq \\
E & & E'
\end{array}
$$

Now write

$$
p(x)=(x-\alpha)g(x)
$$

in $F(\alpha)[x]$. Applying $\varphi_1$ to the coefficients gives

$$
p'(x)=(x-\beta)g'(x)
$$

in $F'(\beta)[x]$.

The field $E$ is a splitting field of $g(x)$ over $F(\alpha)$, and $E'$ is a splitting field of $g'(x)$ over $F'(\beta)$. Since $\deg g<\deg p$, the induction hypothesis gives an isomorphism

$$
\Phi:E\to E'
$$

extending $\varphi_1$. Therefore $\Phi$ also extends the original isomorphism $\varphi:F\to F'$.
{% endproof %}
{% endtheorem %}

Taking $F'=F$ and letting $\varphi:F\to F$ be the identity map, we then see that any two splitting fields of $p(x)$ over $F$ are isomorphic by an isomorphism that fixes every element of $F$.

