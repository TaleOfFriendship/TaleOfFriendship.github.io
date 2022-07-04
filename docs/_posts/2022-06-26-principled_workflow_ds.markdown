---
permalink: 20220626_principled_workflow_ds/
layout: post
title:  "Principled Datascience Workflow: Clarify the business needs"
date:   2022-06-26 11:32:33 +0100
categories: non-technical
---

&nbsp;

As a follow up to my article about the [most important step]({% link _posts/2022-06-25-most_important_step.markdown %}){:target="_blank"}, which talks about why getting a good business understanding is, in my opinion, the most important step, I want to extend on the why and how to work on it.

Clarifying the business needs has some immediate advantages:

* It guarantees that we answer the right question
* It makes it easier to present the solutions in the same language that business people speak and understand well
* It ultimately makes it easier to get stakeholder buy-in

The last part is the most relevant one here. The success of Data Science is coupled with how much stakeholder buy-in exists for Data-related solutions. 
They often cannot tell the difference between a good and a bad technical implementation of a model, but they can tell the difference between a good and a bad business understanding. It's easier for them to trust your results, if they feel like you understand the business. 

Even from a technical perspective, it is good if all goals are aligned (algorithm <-> business question <-> KPI of departement/how success of the departement is measured). 

{% comment %}
So what is the business question? Why do you want to solve this question? Why now? How will the analysis/model be used after it is done? 
* As a help to analysts/stakeholders to have a better understanding of customer base
* identify bad customers to find strategies to develop them
* identify good customers to give them some benefits in case of churn risk or whatever
* find predictors of good customers to develop marketing for new customers with similar properties
{% endcomment %}

Understanding the business has a big impact on the implementation: 
* Stating success criteria: When is the solution good enough, how does it translate to business value, comparison to a benchmark possible?
* Defining guard rail metrics - metrics that should not be effected negatively while testing/using the model
* Loss function: Business Impact of False Positives vs False Negatives, how much deviation is bad, what general metrics fit the business intuition the best? 
* Human-in-the-loop: How can human interaction overwrite the model if necessary? Is it even necessary?
* Look at available data: Which data do I need for it? (Business knowledge useful/ business person can help)
* Which data is available and are there any special things to consider? (Data Anaylsts know a lot about data, data engineers know about potential quirks in etl-pipeline

If all of this is handled well, you can in theory create almost the entire final presentation before having trained any model or written any line of code!  A general outline usually looks like this:

1. State business problem
2. How are we trying to solve it? (Mapping business problems to quantifiable statistics / KPI for model/analysis, how a model will be deployed to solve it)
3. Assumptions we made along the way (different kinds of loss in classification, data assumptions, missing important variables etc.)
4. Solution, showing metrics and KPIs in pretty graphs

