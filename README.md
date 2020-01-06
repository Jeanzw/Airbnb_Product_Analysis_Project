# Airbnb_Product_Analysis_Project

I did this project on campus with someone who working at Airbnb to analyze Airbnb product from 3 perspectives and predict new user booking, booking rate and user activities based on 30 million data points.
The data we get includes users basic information, account information and purchase information. 
In the product analysis, our goal is How to improve Airbnb to attract more users. 
Therefore, in order to achieve our goal, we have to handle 3 questions:
•	What’s the characteristic of Airbnb’s target users?
•	Which Airbnb’s promotion channels are good and which channel need to be improved?
•	How about the conversion rate of Airbnb’s funnel model?

In order to answers the three question, we analyzed Airbnb product from 3 perspective, namely users portrait analysis, promotion channel analysis and funnel analysis and we used Hive to analyze and use python’s library pyecharts to realize visualization.
In users portrait analysis part, we need to count users basis information such as gender ratio, age distribution, geographic distribution and destination distribution.

In promotion channel analysis part, we need to count monthly new users, number of account created by different device, by different Channel and by different marketing content, different channels’ conversion rate and different marketing content’s conversion rate. After we know these information, we could know which promotion channels are good and what marketing content will attract more users. If a channel performs better than others, then company need to put more money into the channel to attract more active users. However, if one channel performs not well, we need to find the reason behind it.

The last part is funnel analysis. According to Airbnb product feature, the funnel analysis requires us to calculate total number of users, active users who use Airbnb more than 10 times, sign up user’s number, reservation number, order number and repurchase number and we find from sign up to reservation, the conversion rate is lowest, 14%. What’s more, 60% users place another order which shows Airbnb’s product and service is good. In addition, around 13% users reserve but not pay, the reason requires product development department to investigate. 
