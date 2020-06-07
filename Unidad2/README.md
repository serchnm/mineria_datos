# Unit 2

## Homeworks

### [1.- The Geometric Distribution](#the-geometric-distribution)
### [2.- Geom_jitter](#geom_jitter)
### [3.- P value](#pvalue)
### [4.- SplitRatio and Lm](#split-and-Lm)
### [5.- glm](#glm)
### [6.- ElemStatLearn](#elemStatLearn)


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


## split and Lm

### Divide Into Groups And Reassemble

**split** divides the data in the vector **x** into the groups defined by **f**. The replacement forms replace values corresponding to such a division. **unsplit** reverses the effect of **split**.

```r
split(x, f, drop = FALSE, …)
# S3 method for default
split(x, f, drop = FALSE, sep = ".", lex.order = FALSE, …)
split(x, f, drop = FALSE, …) <- value
unsplit(value, f, drop = FALSE)
```
### Arguments


**x**         
vector or data frame containing values to be divided into groups.

**f**           
Ta ‘factor’ in the sense that **as.factor(f)** defines the grouping, or a list of such factors in which case their      interaction is used for the grouping.

**drop**
logical indicating if levels that do not occur should be dropped (if f is a factor or a list).

**value**
a list of vectors or data frames compatible with a splitting of x. Recycling applies if the lengths do not match.

**sep**
character string, passed to interaction in the case where f is a list.

**lex.order**
logical, passed to interaction when f is a list.

**…**
further potential arguments passed to methods.

### Details

**split** and **split<-** are generic functions with default and **data.frame methods.** The data frame method can also be used to split a matrix into a list of matrices, and the replacement form likewise, provided they are invoked explicitly.

**unsplit** works with lists of vectors or data frames (assumed to have compatible structure, as if created by **split**). It puts elements or rows back in the positions given by **f**. In the data frame case, row names are obtained by unsplitting the row name vectors from the elements of **value**.

**f** is recycled as necessary and if the length of **x** is not a multiple of the length of **f** a warning is printed.

Any missing values in **f** are dropped together with the corresponding values of **x**.

The default method calls **interaction** when **f** is a **list**. If the levels of the factors contain . the factors may not be split as expected, unless **sep** is set to string not present in the factor **levels**.

Value
The value returned from **split** is a list of vectors containing the values for the groups. The components of the list are named by the levels of **f** (after converting to a factor, or if already a factor and drop = TRUE, dropping unused levels).

The replacement forms return their right hand side. **unsplit** returns a vector or data frame for which **split(x, f)** equals **value**

## Lm
### Fitting Linear Models

lm is used to fit linear models. It can be used to carry out regression, single stratum analysis of variance and analysis of covariance (although aov may provide a more convenient interface for these).


### Usage

```lm(formula, data, subset, weights, na.action,
   method = "qr", model = TRUE, x = FALSE, y = FALSE, qr = TRUE,
   singular.ok = TRUE, contrasts = NULL, offset, …)

```
### Arguments

**formula**
an object of class "formula" (or one that can be coerced to that class): a symbolic description of the model to be fitted. The details of model specification are given under ‘Details’.

**data**
an optional data frame, list or environment (or object coercible by **as.data.frame** to a data frame) containing the variables in the model. If not found in **data**, the variables are taken from **environment(formula)**, typically the environment from which **lm** is called.

**subset**
an optional vector specifying a subset of observations to be used in the fitting process.

**weights**
an optional vector of weights to be used in the fitting process. Should be **NULL** or a numeric vector. If non-NULL, **weighted** least squares is used with weights weights (that is, minimizing **sum(w*e^2)**); otherwise ordinary least squares is used. See also ‘Details’,

**na.action**
a function which indicates what should happen when the data contain **NAs**. The default is set by the **na.action** setting of **options**, and is **na.fail** if that is unset. The ‘factory-fresh’ default is **na.omit**. Another possible value is **NULL**, no action. Value **na.exclude** can be useful.

**method**
the method to be used; for fitting, currently only **method = "qr"** is supported; **method = "model.frame"** returns the model frame (the same as with **model = TRUE**, see below).

**model, x, y, qr**
logicals. If **TRUE** the corresponding components of the fit (the model frame, the model matrix, the response, the QR decomposition) are returned.

**singular.ok**
logical. If **FALSE** (the default in S but not in R) a singular fit is an error.

**contrasts**
an optional list. See the contrasts.arg of model.matrix.default.

**offset**
this can be used to specify an a priori known component to be included in the linear predictor during fitting. This should be **NULL** or a numeric vector or matrix of extents matching those of the response. One or more **offset** terms can be included in the formula instead or as well, and if more than one are specified their sum is used. See **model.offset.**

**…**
additional arguments to be passed to the low level regression fitting functions (see below).

### Details

Models for **lm** are specified symbolically. A typical model has the form **response ~ terms** where **response** is the (numeric) response vector and **terms** is a series of terms which specifies a linear predictor for **response**. A terms specification of the form **first + second** indicates all the terms in **first** together with all the terms in **second** with duplicates removed. A specification of the form **first:second** indicates the set of terms obtained by taking the interactions of all terms in **first** with all terms in **second**. The specification **first*second** indicates the cross of **first** and **second**. This is the same as **first + second + first:second**.

If the formula includes an **offset**, this is evaluated and subtracted from the response.

If **response** is a matrix a linear model is fitted separately by least-squares to each column of the matrix.

See **model.matrix** for some further details. The terms in the formula will be re-ordered so that main effects come first, followed by the interactions, all second-order, all third-order and so on: to avoid this pass a **terms** object as the formula

A formula has an implied intercept term. To remove this use either **y ~ x - 1** or **y ~ 0 + x**.

Non-**NULL weights** can be used to indicate that different observations have different variances (with the values in **weights** being inversely proportional to the variances); or equivalently, when the elements of **weights** are positive integers w i, that each response yi is the mean of wi unit-weight observations (including the case that there are wi observations equal to y i and the data have been summarized). However, in the latter case, notice that within-group variation is not used. Therefore, the sigma estimate and residual degrees of freedom may be suboptimal; in the case of replication weights, even wrong. Hence, standard errors and analysis of variance tables should be treated with care.

**lm** calls the lower level functions **lm.fit**, etc, see below, for the actual numerical computations. For programming only, you may consider doing likewise.

All of **weights, subset and offset** are evaluated in the same way as variables in **formula**, that is first in **data** and then in the environment of **formula**.

### Value

**lm** returns an object of **class "lm"** or for multiple responses of class **c("mlm", "lm").**

The functions **summary** and **anova** are used to obtain and print a summary and analysis of variance table of the results. The generic accessor functions **coefficients, effects, fitted.values and residuals** extract various useful features of the value returned by **lm.**

An object of class **"lm"** is a list containing at least the following components:

**coefficients**
a named vector of coefficients

**residuals**
the residuals, that is response minus fitted values.

**fitted.values**
the fitted mean values.

**rank**
the numeric rank of the fitted linear model.

**weights**
(only for weighted fits) the specified weights.

**df.residual**
the residual degrees of freedom.

**call**
the matched call.

**terms**
the terms object used.

**contrasts**
(only where relevant) the contrasts used.

**xlevels**
(only where relevant) a record of the levels of the factors used in fitting.

**offset**
the offset used (missing if none were used).

**y**
if requested, the response used.

**x**
if requested, the model matrix used.

**model**
if requested (the default), the model frame used.

**na.action**
(where relevant) information returned by model.frame on the special handling of NAs.


## glm


### Generalized Linear Models (R-Compliant)

Fits a generalized linear model, similarly to R's glm().

### Usage

```R
glm(formula, family = gaussian, data, weights, subset, na.action,
  start = NULL, etastart, mustart, offset, control = list(...),
  model = TRUE, method = "glm.fit", x = FALSE, y = TRUE,
  contrasts = NULL, ...)
# S4 method for formula,ANY,SparkDataFrame
glm(formula, family = gaussian, data,
  epsilon = 1e-06, maxit = 25, weightCol = NULL)
```

### Arguments

**formula**
a symbolic description of the model to be fitted. Currently only a few formula operators are supported, including '~', '.', ':', '+', and '-'.

**family**
a description of the error distribution and link function to be used in the model. This can be a character string naming a family function, a family function or the result of a call to a family function. Refer R family at https://stat.ethz.ch/R-manual/R-devel/library/stats/html/family.html. Currently these families are supported: **binomial, gaussian, Gamma, and poisson.**

**data**
a SparkDataFrame or R's glm data for training.

**weights**
an optional vector of ‘prior weights’ to be used in the fitting process. Should be **NULL** or a numeric vector.

**subset**
an optional vector specifying a subset of observations to be used in the fitting process.

**na.action**
a function which indicates what should happen when the data contain **NAs**. The default is set by the **na.action** setting of **options**, and is **na.fail** if that is unset. The ‘factory-fresh’ default is **na.omit**. Another possible value is **NULL**, no action. Value **na.exclude** can be useful.

**start**
starting values for the parameters in the linear predictor.

**etastart**
starting values for the linear predictor.

**mustart**
starting values for the vector of means.

**offset**
this can be used to specify an a priori known component to be included in the linear predictor during fitting. This should be **NULL** or a numeric vector of length equal to the number of cases. One or more **offset** terms can be included in the formula instead or as well, and if more than one is specified their sum is used. See **model.offset**.

**control**
a list of parameters for controlling the fitting process. For **glm.fit** this is passed to **glm.control**.

**model**
a logical value indicating whether model frame should be included as a component of the returned value.

**method**
the method to be used in fitting the model. The default method **"glm.fit"** uses iteratively reweighted least squares (IWLS): the alternative **"model.frame"** returns the model frame and does no fitting.

User-supplied fitting functions can be supplied either as a function or a character string naming a function, with a function which takes the same arguments as **glm.fit**. If specified as a character string it is looked up from within the stats namespace.

**x, y**
For **glm**: logical values indicating whether the response vector and model matrix used in the fitting process should be returned as components of the returned value.

**contrasts**
an optional list. See the **contrasts.arg** of **model.matrix.default**.

**...**
For **glm**: arguments to be used to form the default control argument if it is not supplied directly.

For weights: further arguments passed to or from other methods.

**epsilon**
positive convergence tolerance of iterations.

**maxit**
integer giving the maximal number of IRLS iterations.

**weightCol**
the weight column name. If this is not set or **NULL**, we treat all instance weights as 1.0.


## ElemStatLearn
