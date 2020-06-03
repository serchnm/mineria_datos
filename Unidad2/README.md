# Unidad 2


## The Geometric Distribution

Density, distribution function, quantile function and random generation for the geometric distribution with parameter  
**prob.**


### Usage

```R
dgeom(x, prob, log = FALSE)
pgeom(q, prob, lower.tail = TRUE, log.p = FALSE)
qgeom(p, prob, lower.tail = TRUE, log.p = FALSE)
rgeom(n, prob)
```
### Arguments

**x, q**       vector of quantiles representing the number of failures in a sequence of Bernoulli trials before success occurs.

**p**       vector of probabilities.

**n**       number of observations. If  **length(n) > 1**, the length is taken to be the number required.

**prob**       probability of success in each trial. **0 < prob <= 1**.

**log, log.p**       logical; if TRUE, probabilities p are given as log(p).

**lower.tail**       llogical; if TRUE (default), probabilities are P[ X ≤ x] , otherwise, P[ X > x].


### Details

The geometric distribution with **prob.** - **p** has density

**p(x) = p(1 - p)^x**

for  **X = 0, 1, 2, ..., 0<p≤1.**

If an element of **x** is not integer, the result of **dgeom** is zero, with a warning.

### Value

**dgeom** gives the density, **pgeom** gives the distribution function, **qgeom** gives the quantile function, and **rgeom** generates random deviates.

Invalid **prob** will result in return value **NaN**, with a warning.

The length of the result is determined by **n** for **rgeom**, and is the maximum of the lengths of the numerical arguments for the other functions.

The numerical arguments other than **n** are recycled to the length of the result. Only the first elements of the logical arguments are used.

