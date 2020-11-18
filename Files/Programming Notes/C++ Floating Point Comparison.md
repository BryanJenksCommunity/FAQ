#### C++ Floating Point Comparison

---

# Floating Point Comparison

## 'Good Enough' Equality

> Floating-point numbers should not be compared using `==`. Ex: Avoid float1 `==` float2. 
> .
> Reason: Some floating-point numbers cannot be exactly represented in the limited available memory bits like 64 bits. Floating-point numbers expected to be equal may be close but not exactly equal.
> .
> Floating-point numbers should be compared for *"close enough"* rather than exact equality. 
> Ex: If `( x - y ) < 0.0001`, x and y are deemed equal.
> Because the difference may be negative, the absolute value is used: `fabs(x - y) < 0.0001`.
> .
> The difference threshold indicating that floating-point numbers are equal is often called the `epsilon`. Epsilon's value depends on the program's expected values, but 0.0001 is common.

## fabs() for floating point precision

![[C++ Include cmath#fabs|fabs()]]
