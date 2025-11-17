---
permalink: 20220705_dummy_encoding/
layout: post
title:  "One-Hot and Dummy encoding are not the same and the difference is important (sometimes)"
date:   2022-07-05 11:32:33 +0100
categories: non-technical
---

What am I talking about? Isn't both the same? Well, yes and no, but today I will do something I have sworn to do only to my worst enemies: Be pedantic. 

For the sake of this article I'll use these definitions: If we have a categorical variable with n possible values, One-Hot encoding transforms it into n columns and Dummy encoding transforms it into n-1 columns, with one value being the baseline.

Reading through countless Medium DS articles one might think that Dummy encoding (n-1 method) is the way to go because it

- leads to less columns while keeping the same amount of information

- avoids multicollinearity

In general you should not drop a value and put it in the baseline. One-Hot encoding is usually superior. Of course the difference will usually be negligible; but what is life if not arguing about minute details.

<figure style="text-align: center; margin: 2em 0;">
  <img src="/assets/base.jpg" alt="Base" style="max-width: 80%; height: auto; display: block; margin: 0 auto;">
  <figcaption style="font-style: italic; color: #666; margin-top: 0.5em;">"It's all about that base(line)"<br>- Meghan Trainer, Data Science Enthusiast</figcaption>
</figure>

The difference is relevant if one uses parameter-specific regularization like ridge or lasso. Using one value as a baseline in Dummy encoding can lead to unexpected consequences. To explain why, I will use an excerpt of the book [Elements of Statistical Learning](https://hastie.su.domains/Papers/ESLII.pdf){:target="_blank"} (page 64), where the authors writes in a chapter about ridge regularization:

- Penalization of the intercept would make the procedure depend on the origin chosen for Y ; that is, adding a constant c to each of the targets yi would not simply result in a shift of the predictions by the same amount c.

The authors use it in a more general context about any intercept term in regularized regression, but the logic is applicable to our use case. To illustrate what this means, imagine the following example:

You have a model to predict sales for an online store. As a feature you use the sales data of 4 retail stores located in

- 1) New York

- 2) Boston

- 3) random small town in germany

- 4) random small town in switzerland

Places 1) and 2) are similar to each other, and 3) and 4) are similar to each other, but both groups are very different. If you use Dummy encoding with New York as your baseline, the parameters associated with Boston will be low, because Boston is similar to the baseline New York. So the effect of Boston will hardly be penalized by your regularization. However, the parameters associated with 3) and 4) will be high by nature of being very different from the baseline. The regularization kicks in hard with those two and will lead to underestimated effects for them.

If you use 3) or 4) as the baseline, the effects will be the reverse.

This means: An arbitrary modeling choice like which specific value to use as a baseline can have a potentially large effect on the model. That is not something I would feel comfortable with in feature engineering.

There are other reasons, mainly about why the advantages of Dummy encoding are not that big of a deal, but they are less interesting. This post is already way too long for a pretty niche topic, so I'll end it here with my Conclusion: One-Hot > Dummy

