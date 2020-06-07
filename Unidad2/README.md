# Unit 2

## Homeworks

### [1.- The Geometric Distribution](#the-geometric-distribution)
### [2.- Geom_jitter](#geom_jitter)
### [3.- P value](#pvalue)
### [4.- ](/Unidad4)
### [5.- ](/Unidad3)
### [6.- ](/SVM)


## Practices

### [1.- Simple Linear Regression](/Unidad2/Practicas/Simple_Linear_Regression)
### [2.- Multiple Linear Regression](/Unidad2/Practicas/Multiple_Linear_Regression)
### [3.- Backward Elimination](/Unidad2/Practicas/Backward_Elimination)
### [4.- Logistic Regression](/Unidad2//Practicas/Logistic_Regression)
### [5.- SVM](/Unidad2/Practicas/SVM)
### [6.- Decision Tree](/Unidad2/Practicas/Decision_Tree)

## Exam

### [Exam 1](/Unidad2/Examen/#exam-unit-2)
### [Exam 2](/Unidad2/Examen/#exam-unit-3)

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

## geom_jitter

### Jittered Points

The jitter geom is a convenient shortcut for **geom_point(position = "jitter")**. It adds a small amount of random variation to the location of each point, and is a useful way of handling overplotting caused by discreteness in smaller datasets.

### Usage

```R
geom_jitter(
  mapping = NULL,
  data = NULL,
  stat = "identity",
  position = "jitter",
  ...,
  width = NULL,
  height = NULL,
  na.rm = FALSE,
  show.legend = NA,
  inherit.aes = TRUE
)
```
### Arguments

Set of aesthetic mappings created by **aes()** or **aes_()**. If specified and **inherit.aes = TRUE** (the default), it is combined with the default mapping at the top level of the plot. You must supply **mapping** if there is no plot mapping.

**data**
The data to be displayed in this layer. There are three options:

- If **NULL**, the default, the data is inherited from the plot data as specified in the call to **ggplot().**

- A **data.frame**, or other object, will override the plot data. All objects will be fortified to produce a data frame. See **fortify()** for which variables will be created.

- A **function** will be called with a single argument, the plot data. The return value must be a **data.frame**, and will be used as the layer data. A **function** can be created from a **formula** (e.g. **~ head(.x, 10))**.

**stat**
The statistical transformation to use on the data for this layer, as a string.

**position**
Position adjustment, either as a string, or the result of a call to a position adjustment function.

**...**
Other arguments passed on to **layer()**. These are often aesthetics, used to set an aesthetic to a fixed value, like **colour = "red"** or **size = 3**. They may also be parameters to the paired geom/stat.

**width**
Amount of vertical and horizontal jitter. The jitter is added in both positive and negative directions, so the total spread is twice the value specified here.

If omitted, defaults to 40% of the resolution of the data: this means the jitter values will occupy 80% of the implied bins. Categorical data is aligned on the integers, so a width or height of 0.5 will spread the data so it's not possible to see the distinction between the categories.

**height**
Amount of vertical and horizontal jitter. The jitter is added in both positive and negative directions, so the total spread is twice the value specified here.

If omitted, defaults to 40% of the resolution of the data: this means the jitter values will occupy 80% of the implied bins. Categorical data is aligned on the integers, so a width or height of 0.5 will spread the data so it's not possible to see the distinction between the categories.

**na.rm**
If **FALSE**, the default, missing values are removed with a warning. If **TRUE**, missing values are silently removed.

**show.legend**
logical. Should this layer be included in the legends? **NA**, the default, includes if any aesthetics are mapped. **FALSE** never includes, and **TRUE** always includes. It can also be a named logical vector to finely select the aesthetics to display.

**inherit.aes**
If FALSE, overrides the default aesthetics, rather than combining with them. This is most useful for helper functions that define both data and aesthetics and shouldn't inherit behaviour from the default plot specification, e.g. **borders()**.

**geom_point()** understands the following aesthetics (required aesthetics are in bold):

- x

- y

- alpha

- colour

- fill

- group

- shape

- size


## p.value

### Compute The P-Value For A Distribution

When you perform a statistical test a p-value helps you determine the significance of your results in relation to the null hypothesis.

The p-value of a distribution is here interpreted as the probability outside the smallest credibility interval or region containing a point; if no point is explicitly given, it is assumed to be zero, or the origin.


### Usage

```R
p.value(object, point)
```

### Arguments

**object**          The probability distribution for which the p-value should be computed.

**point**           The point which should be included in the credibility interval or region.

### Value       

The probability outside the smallest credibility interval or region containing the point.
