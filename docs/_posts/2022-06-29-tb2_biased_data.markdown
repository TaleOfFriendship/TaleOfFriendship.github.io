---
permalink: 20220629_tb2_biased_data/
layout: post
title:  "Why the Monty Hall Problem is more than just a little brain teaser to fumble your crush with!"
date:   2022-06-26 11:32:33 +0100
categories: non-technical
---

<sup>Tidbit series: How to explain Data Science concepts to anyone.
</sup>
&nbsp;


![Monty Hall problem](/assets/monty_hall.png)
<sup>I will not go into any detail about the headline.
</sup>

Ever heard of the [Monty Hall Problem](https://brilliant.org/wiki/monty-hall-problem/){:target="_blank"}? It is the famous "paradox" of a seemingly arbitrary choice like switching doors increasing your chance of success from 33% to 66%. <br>

But who really cares? How often do you come across this situation? I never won a car; I never even won a goat! If you explain it by going [case by case](https://en.wikipedia.org/wiki/Monty_Hall_problem#Simple_solutions), it's kind a nice, i guess, and people will understand it, but this explanation is very specific to this scenario and nothing else. So that is not very useful to ordinary people.

However, this kind of thing actually happens **all the time**, if you think of it as Survivorship Bias: 

### The process matters

A similar situation to this example is when you go to your local fish market to buy fresh fish. <br>

<figure style="text-align: center; margin: 2em 0;">
  <img src="/assets/fishies.jpg" alt="Fishies" style="max-width: 80%; height: auto; display: block; margin: 0 auto;">
  <figcaption style="font-style: italic; color: #666; margin-top: 0.5em;">I can't differentiate between a good and a bad fish, but some can.</figcaption>
</figure>

If you go very early, you have the best selection. If you go later and there is hardly any fish left, the fish that is left will be of lower quality. Maybe it is smaller, has some dent marks, visible damage and so on.<br>
In principle this is the same as the Monty Hall problem. The fish that "survives" not being bought survives because of some properties it has (In this case negative ones), whereas in the Monty Hall problem the door that "survives", survives because of positive properties (The host eliminates bad doors), so the survivors are not representative of the sample and either worse (fish) or better (doors) than the average.

This situation can arise in many [examples](https://medium.com/@penguinpress/an-excerpt-from-how-not-to-be-wrong-by-jordan-ellenberg-664e708cfc3d){:target="_blank"}, and sometimes knowing about this concept can help you in your day-to-day decision making. <br>
For example, the next time you are looking for a new apartment and see one that already 50 people showed interest in, instead of thinking it is too unlikely that you get it and not bothering with it, a try may still be worth it. In this case people that "survive" not finding an apartment tend to be less appealing to landlords and apply to many, so in this group of 50 there is a realistic chance that you still have a good shot.

