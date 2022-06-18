---
permalink: 20211126_principled_workflow_ds/
layout: default
title:  "Principled Datascience Workflow"
date:   2021-11-26 11:52:33 +0100
categories: non-technical
---
Example: Make me a CLV model for next 5 years1.

Start with the business question: Most important step! (guarantees answering the right question, makes it easier to present solutions in a context that business people understand well, easier to get stakeholder buy-in)Why most important?Hardest part of data science is getting stakeholder buyin. Who are the stakeholders? Oftern the business peoeple that know a lot about the business. How do you get their buy-in? Know the business! They often cannot tell the different between a good and a bad technical implementation of a model, but they can tell the difference between good and bad business understanding. It's easier for them to trust your results, if they feel like you understand the business. So: solution that shows good business understanding and is only mediocre in the technical implementation > solution that has a great technical implementation but lacks business understanding.It is good if all goals are aligned (algorithm <-> business question <-> KPI of departement/how success of the departement is measured)What is the business question?Why do you want to solve this question? Why now? How will the analysis/model be used after it is done? 
	* As a help to analysts/stakeholders to have a better understanding of customer base
	* identify bad customers to find strategies to develop them
	* identify good customers to give them some benefits in case of churn risk or whatever
	* find predictors of good customers to develop marketing for new customers with similar properties

Depending on answer, implementation can be very different: Loss function (focus on segregation/identification of good/bad customers/mse etc), is timely/fast/real-time prediction important?Time frame: Is there a deadline?defining guard rail metrics - metrics that should not be effected negatively while testing/using the model(Also: Stating success criteria for a solution can already be done, how human interaction can overwrite the model if necessary)2.Look at available data: Which data do i need for it? (Business knowledge useful/ business person can help)Which data is available and are there any special things to consider there? (Data Anaylsts know a lot about data, data engineers know about potenitla quirks in etl-pipeline)Most assumptions are made in steps 1 and 2.Potential outcome: Assumptions are too big/data not rich enough -> abandon use-caseIf steps 1 and 2 are done well chance of success is good.Presentation to stakeholders here is almost finished:
	1. state business problem
	2. how are we trying to solve it? (Mapping business problem to quantifiable statistics / KPI for model/analysis, how a model will be deployed to solve it)
	3. assumptions we made along the way (different kinds of loss in classification, data sassumptions, missing important variables etc.)
	4. solution and pretty graphs

=> steps 1 - 3 already dones4. modelingEDA -> feature engineering -> modeling -> repeat different steps5. presentationcomparison baselinealternative approaches that were tried
6. deployment


This is asking for a lot of one person. -> Data Science has a leraning curve that stays steep for a long time. Knowing more after you already know a lot still can have a big effect compared to other jobs with flatter learning curves
