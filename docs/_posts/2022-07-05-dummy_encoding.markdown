---
permalink: 20220705_dummy_encoding/
layout: post
title:  "One-Hot and Dummy encoding are not the same and the difference is important (sometimes)"
date:   2022-07-05 11:32:33 +0100
categories: non-technical
---

...or maybe they are the same, I don't know. Some resources use them [interchangeably](https://scikit-learn.org/stable/modules/generated/sklearn.preprocessing.OneHotEncoder.html){:target="_blank"}, and others [do not](https://www.amazon.com/dp/1491953241){:target="_blank"}.<br>

For a long time I used the terms interchangeably as well. Just recently I learned the following distinction between them: If we have a categorical variable with n possible values, One-Hot encoding transforms it into n columns and Dummy encoding transforms it into n-1 columns, with one value being the baseline.

Long-held folklore wisdom says Dummy encoding (n-1  method) is the way to go because it

- leads to less columns while keeping the same amount of information
- avoids multicollinearity

I am going to argue that One-Hot encoding is usually superior. (Well, if it matters at all)<br>

The main reason is only relevant if one uses regularization like ridge. But since I pretty much always use some sort of regularization to avoid overfitting, this reason is, at least in my use-cases, pretty much always applicable.<br>
Using one value as a baseline in Dummy encoding is dangerous. To explain why, I will use an excerpt of a book, that was also my introduction to Machine Learning, [Elements of Statistical Learning](https://hastie.su.domains/Papers/ESLII.pdf){:target="_blank"} (page 64):

* _Penalization of the intercept would make the procedure depend on the origin chosen for Y ; that is, adding a constant c to each of the targets yi would not simply result in a shift of the predictions by the same amount c._

To illustrate what this means, imagine the following example:

You have a model to predict sales for an online store. As a feature you use the sales data of 4 retail stores located in

* 1) New York
* 2) Boston
* 3) random small town in germany
* 4) random small town in switzerland

The point is 1) and 2) are similar to each other, and 3) and 4) are similar to each other, but both groups are very different. If you use Dummy encoding with New York as your baseline, the effect of Boston will hardly be penalized by your regularization, because the parameters associated with Boston will be low anyways, just by Boston being very similar to the baseline New York.<br> 
However, the parameters associated with 3) and 4) will be high by nature of being very different from the baseline, so the regularization kicks in hard with those two and will lead to underestimated effects for them.<br>

If you use 3) or 4) as the baseline, the effects will be the reverse.

This means: An arbitrary modeling choice like which specific value to use as a baseline will have a possibly large effect on the model. That is not a place I want to be in.

There are other reasons for my opinion, but they are less interesting, so I will just keep it at that. Conclusion: One-Hot > Dummy most of the time.