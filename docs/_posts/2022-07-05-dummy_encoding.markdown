---
permalink: 20220705_dummy_encoding/
layout: post
title:  "One-Hot and Dummy encoding are not the same and the difference is important (sometimes)"
date:   2022-07-05 11:32:33 +0100
categories: non-technical
---

...or maybe they are, I don't know. Some resources use them [interchangably](https://scikit-learn.org/stable/modules/generated/sklearn.preprocessing.OneHotEncoder.html){:target="_blank"}, and others [do not](https://www.amazon.com/dp/1491953241){:target="_blank"}.<br>

For a long time I used the terms interchangebly as well, but I recently learned the following distinction between them: If we have a categorical variable with n possible values, One-Hot encoding transforms it into n columns and Dummy encoding transforms it into n-1 columns with one value being the baseline.

Folklore wisdom says Dummy encoding (n-1  method) is the way to go because it

- leads to less columns while keeping the same amount of information
- avoids multicollinearity

What I am going to do is argue that One-Hot encoding is usually superior. (Well, if it matters at all)<br>

The main reason is only applicaple if one uses regulariazation like ridge or lasso. But since I pretty much always use some sort of regularizaion to avoid overfitting, this reason is, at least in my use-cases, pretty much always applicable.<br>
Using one value as a baseline in dummy encoding is dangerous. To explain it I will use an excerpt of the bible of ML, [Elements of Statistical Learning](https://hastie.su.domains/Papers/ESLII.pdf){:target="_blank"} (page 64):

* _Penalization of the intercept would make the procedure depend on the origin chosen for Y ; that is, adding a constant c to each of the targets yi would not simply result in a shift of the predictions by the same amount c._

This means an arbitrary modeling choice of which value to use as a baseline will have a possibly large effect on the model. That is not a place I want to be in.

To illustrate why exactly that means imagine the following example:

You have a model 
