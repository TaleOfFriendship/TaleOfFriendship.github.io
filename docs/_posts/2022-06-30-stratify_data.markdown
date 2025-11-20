---
permalink: 20220630_stratify_data/
layout: post
title:  "Should you stratify your data? The answer will surprise you!"
date:   2022-06-30 11:32:33 +0100
categories: non-technical
---

I recently came across a discussion of stratifying the train and test set. A quick google search confirms that this is something that is [often recommended](https://scikit-learn.org/stable/modules/cross_validation.html#stratification){:target="_blank"}. This idea is even extended to not only the label, but to important features as well.<br>

I mean doesn't it make sense? Balancing your data seems like a smart idea.

<figure style="text-align: center; margin: 2em 0;">
  <img src="/assets/balance.jpg" alt="Balance" style="max-width: 80%; height: auto; display: block; margin: 0 auto;">
  <figcaption style="font-style: italic; color: #666; margin-top: 0.5em;">Perfectly balanced, as (not) all things should be. Looks cool though</figcaption>
</figure>

Well, I don't quite agree with that point. Yes, in a causal setting focused on inference stratification can be useful, for example to [deal with non-representative data](https://statmodeling.stat.columbia.edu/2019/08/22/multilevel-structured-regression-and-post-stratification/){:target="_blank"} or to [increase power](http://blog.mrwaddell.net/archives/776){:target="_blank"}. In those cases I am all for it, and if it is possible to do there is little reason not to.

However, most of Machine Learning is about prediction. Here it is less clear. <br>

## Why do we use a test set at all?

It is to get a grasp on how the model works on new unseen data. There is no guarantee that new data will be stratified. In fact, data tends to drift and starts looking differently with time, which is the opposite of stratification. <br>
So if we only test or validate our model on a stratified data set, it sets unrealistic expectations and will not be representative of real world model performance in production. What if we have a model that works well on nice balanced strata data sets but does not work on unbalanced data sets? This can happen, for example if one uses Squared Error Loss and has an unusually big amount of outliers. <br>

## The real world is messy

Let's say you stratify on a feature, whose predictions are good for data points with value "A", but bad for value "B" of that feature. The validation metrics will be around the same for each strata and the Data Scientist can make claims like the model never being worse than X% or whatever, backed up by cross validation. Then production comes around with a lot of value B data points and your real performance will be much worse than anything you have seen in validation.<br>

Now stratification can help in some very niche cases where the data is very unbalanced and you need to guarantee a balance for stable model estimation. But even in this case, the "non-stability" is something that should be modeled in cross-validation and test set evaluation.<br>
So if you retrain the model on the whole data after doing the train/validation/test stuff, stratification becomes unnecessary.

TL;DR: Stratify when doing inference; do not stratify when doing prediction.