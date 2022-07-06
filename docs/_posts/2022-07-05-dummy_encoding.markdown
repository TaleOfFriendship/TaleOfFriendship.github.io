---
permalink: 20220705_dummy_encoding/
layout: post
title:  "One-Hot and Dummy encoding are not the same and the difference is important (sometimes)"
date:   2022-07-05 11:32:33 +0100
categories: non-technical
---

...or maybe they are the same? Some resources use them [interchangeably](https://scikit-learn.org/stable/modules/generated/sklearn.preprocessing.OneHotEncoder.html){:target="_blank"}, and others [do not](https://www.amazon.com/dp/1491953241){:target="_blank"}.<br>

For a long time I used the terms interchangeably as well. But just recently I learned a distinction between them that some people use: If we have a categorical variable with n possible values, One-Hot encoding transforms it into n columns and Dummy encoding transforms it into n-1 columns, with one value being the baseline. Before hearing about this distinction I just called both versions dummy encoding.

Long-held folklore wisdom says Dummy encoding (n-1  method) is the way to go because it

- leads to less columns while keeping the same amount of information
- avoids multicollinearity

The original impetus for why I wanted to write this post is that, in general,  I think you should **not** drop a value and put it in the baseline. I am going to argue that One-Hot encoding is usually superior.<br>

The main reason is only relevant if one uses parameter-specific regularization like ridge or lasso.
Using one value as a baseline in Dummy encoding can lead to unexpected consequences. To explain why, I will use an excerpt of the book [Elements of Statistical Learning](https://hastie.su.domains/Papers/ESLII.pdf){:target="_blank"} (page 64), where the authors writes in a chapter about ridge regularization:

* _Penalization of the intercept would make the procedure depend on the origin chosen for Y ; that is, adding a constant c to each of the targets yi would not simply result in a shift of the predictions by the same amount c._

The authors use it in a more general context about any intercept term in regularized regression, but the logic is applicable to our use case. To illustrate what this means, imagine the following example:

You have a model to predict sales for an online store. As a feature you use the sales data of 4 retail stores located in

* 1) New York
* 2) Boston
* 3) random small town in germany
* 4) random small town in switzerland

Places 1) and 2) are similar to each other, and 3) and 4) are similar to each other, but both groups are very different. If you use Dummy encoding with New York as your baseline, the parameters associated with Boston will be low, because Boston is similar to the baseline New York. So the effect of Boston will hardly be penalized by your regularization.<br> 
However, the parameters associated with 3) and 4) will be high by nature of being very different from the baseline. The regularization kicks in hard with those two and will lead to underestimated effects for them.<br>

If you use 3) or 4) as the baseline, the effects will be the reverse.

This means: An arbitrary modeling choice like which specific value to use as a baseline can have a large effect on the model. That is not something I would feel comfortable with in feature engineering.

There are other reasons for my opinion, mainly about why the advantages of Dummy encoding are not that big of a deal, but they are less interesting. I will just keep it at that and end it with my Conclusion: One-Hot > Dummy most of the time.