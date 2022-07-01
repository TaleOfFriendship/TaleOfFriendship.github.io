---
permalink: 20220630_stratify_data/
layout: post
title:  "Should you stratify your data? The answer may shock you!"
date:   2022-06-30 11:32:33 +0100
categories: non-technical
---

I recently came across a discussion of stratifying the train and test set. A quick google search confirms that this is something that is [often recommended](https://scikit-learn.org/stable/modules/cross_validation.html#stratification){:target="_blank"}. This idea is even extended to not only the label, but to important features as well.<br>

Well, I don't quite agree with that point. <br>

In a causal setting focused on inference stratification can be useful, for example to [deal with non-representative data](https://statmodeling.stat.columbia.edu/2019/08/22/multilevel-structured-regression-and-post-stratification/){:target="_blank"} or to [increase power](http://blog.mrwaddell.net/archives/776){:target="_blank"}. In those cases I am all for it, and if it is possible to do there is little reason not to.

However, most of Machine Learning is about prediction. Here it is not clear to me why you should do this. <br>
My reasoing starts with a question: Why do we use a test set at all? It is to get a grasp on how the model works on new unseen data. The main point is that there is no guarantee that new data will be stratified. In fact, data tends to drift and starts looking differently with time, which is the opposite of stratification. <br>
So if we only test or validate our model on a stratified data set, it sets unrealistic expectations and will not be representative of real world model performance in production. What if we have a model that works well on nice balanced strata data sets but does not work on unbalanced data sets? <br>

Another issue is, if you stratify on a feature / label where predictions are good for data points with a specific value A of that feature but bad for another value B of that feature. The validation metrics will be around the same for each strata and the Data Scientist can make claims like the model never being worse than X% or whatever, backed up by cross validation. Then production comes around with a lot of value B data points and your real performance will be much worse than anything you have seen in validation.<br>

Now I can see that stratification can help in some very niche cases where the data is very unbalanced and you need to guarantee a balance for stable model estimation. But even in this case, if there are relevant very rare events in the data, there are probably rare events not in the data, because they have not happened at all yet. So I would say in this case sometimes the "non-stability" is again something that should be modeled in cross-validation and test set evaluation.<br>
Often you retrain the model on the whole data after doing the train/validation/test stuff anyways. In this case this advantage of stratifying is even less.

Maybe there are other advantages I have not considered that will change my mind. At the moment I can't think of any. 

In practice all of this will almost never matter too much, so this whole topic is not a hill I am willing to die on.

Conclusion: Stratify when doing inference; do not stratify when doing prediction.