---
permalink: 20220630_stratify_data/
layout: post
title:  "Should you stratify your data? The answer may shock you!"
date:   2022-06-30 11:32:33 +0100
categories: non-technical
---

I recently came across a discussion of stratifying the train and test set. A quick google search confirms that this is something that is [often recommended](https://scikit-learn.org/stable/modules/cross_validation.html#stratification){:target="_blank"}.<br>

Well, I don't quite agree with that point. <br>

In a causal setting focused on inference stratification can be useful, for example to [deal with non-representative data](https://statmodeling.stat.columbia.edu/2019/08/22/multilevel-structured-regression-and-post-stratification/){:target="_blank"} or to [increase power](http://blog.mrwaddell.net/archives/776){:target="_blank"}. In those cases I am all for it, and if it is possible to do there is little reason not to.
