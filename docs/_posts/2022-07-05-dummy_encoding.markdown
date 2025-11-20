---
permalink: 20220705_dummy_encoding/
layout: post
title:  "One-Hot and Dummy encoding are not the same and the difference is important (sometimes)"
date:   2022-07-05 11:32:33 +0100
categories: non-technical
---

Caution: This article deals with nuances in feature engineering and might not be for every practically minded reader.

Now that we got that out of the way, I'll use the following definitions: 
- One-Hot: Encode a categorical variable with n classes into **n** column
- Dummy: Encode a categorical variable with n classes into **n-1** columns

From time to time I stumble across articles that say that Dummy encoding (n-1 method) is the way to go because it

- leads to less columns while keeping the same amount of information
- avoids multicollinearity


### Drawbacks: Not everything is nice

This does sounds nice! However in general, you should not drop a category and put it in the baseline. One-Hot encoding is usually superior. Of course the difference will usually be negligible; but since I don't hear about the counterargument, I mention it here

<figure style="text-align: center; margin: 2em 0;">
  <img src="/assets/base.jpg" alt="Base" style="max-width: 80%; height: auto; display: block; margin: 0 auto;">
  <figcaption style="font-style: italic; color: #666; margin-top: 0.5em;">"It's all about that base(line)"<br>- Meghan Trainer, Data Science Enthusiast</figcaption>
</figure>

To argue why: If one uses parameter-specific regularization like ridge or lasso, using one value as a baseline in Dummy encoding can lead to unexpected consequences. To explain why, I will use an excerpt of the book [Elements of Statistical Learning](https://hastie.su.domains/Papers/ESLII.pdf){:target="_blank"} (page 64), where the authors writes in a chapter about ridge regularization:

- Penalization of the intercept would make the procedure depend on the origin chosen for Y ; that is, adding a constant c to each of the targets yi would not simply result in a shift of the predictions by the same amount c.

The authors use it in a more general context about any intercept term in regularized regression, but the logic is applicable to our use case. To illustrate what this means, imagine the following example:

### Example: Differences Matter

You have a model to predict sales for an online store. As a feature you use the sales data of 4 retail stores located in

- 1) New York

- 2) Boston

- 3) random small town in germany

- 4) random small town in switzerland

Places 1) and 2) are similar to each other, and 3) and 4) are similar to each other, but both groups are very different. If you use Dummy encoding with New York as your baseline, the parameters associated with Boston will be low, because Boston is similar to the baseline New York. So the effect of Boston will hardly be penalized by your regularization. However, the parameters associated with 3) and 4) will be high by nature of being very different from the baseline. The regularization kicks in hard with those two and will lead to underestimated effects for them.

If you use 3) or 4) as the baseline, the effects will be the reverse.

This means: An arbitrary modeling choice like which specific value to use as a baseline can have a potentially large effect on the model. That is not something I would feel comfortable with in feature engineering.

There are other reasons, mainly about why the advantages of Dummy encoding are not that big of a deal, but they are less interesting. This post is already way too long for a pretty niche topic, so I'll end it here with my Conclusion: One-Hot > Dummy

