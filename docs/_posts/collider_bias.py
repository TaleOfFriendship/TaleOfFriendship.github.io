import pandas as pd
import matplotlib.pyplot as plt
import numpy as np
from sklearn.linear_model import LinearRegression
from sklearn.linear_model import QuantileRegressor

data = pd.read_csv('C:/Users/alfon/repositories/TaleOfFriendship.github.io/docs/assets/collider_bias_data.csv')

data.loc[data['z'] == 'a', 'z'] = 'famous'
data.loc[data['z'] == 'b', 'z'] = 'not famous'



############################## create trend line

simu_data_for_line = np.arange(0, 730)

quantile = 0.5
reg = LinearRegression().fit(data[data['z'] == 'famous'][['x']], data[data['z'] == 'famous']['y'])
# reg = QuantileRegressor(quantile=quantile, alpha=0)
reg_fit = reg.fit(data[data['z'] == 'famous'][['x']], data[data['z'] == 'famous']['y'])
reg_fit.coef_

prediction_line = reg_fit.predict(simu_data_for_line.reshape(-1, 1))

############################## plot 1

cdict = {'famous': 'black', 'not famous': 'black'}

fig, ax = plt.subplots()
for g in {'famous', 'not famous'}:
    ix = np.where(data['z'] == g)
    ax.scatter(data['x'].iloc[ix], data['y'].iloc[ix], c = cdict[g],  s = 20)

ax.set_ylabel('Athleticism', rotation=0)
ax.set_xlabel('Intelligence')

ax.set_yticklabels([])
ax.set_xticklabels([])

ax.legend()
plt.show()


############################## plot 2

cdict = {'famous': 'red', 'not famous': 'black'}

fig, ax = plt.subplots()
for g in {'famous', 'not famous'}:
    ix = np.where(data['z'] == g)
    ax.scatter(data['x'].iloc[ix], data['y'].iloc[ix], c = cdict[g], label = g, s = 20)

ax.set_ylabel('Athleticism', rotation=0)
ax.set_xlabel('Intelligence')

plt.title('Let us assume that people in the news are more likely to be talented in some way')
ax.set_yticklabels([])
ax.set_xticklabels([])

ax.legend()
plt.show()

################### plot 3

cdict = {'famous': 'red', 'not famous': 'black'}

fig, ax = plt.subplots()
for g in {'famous'}:
    ix = np.where(data['z'] == g)
    ax.scatter(data['x'].iloc[ix], data['y'].iloc[ix], c = cdict[g], label = g, s = 20)



plt.plot(simu_data_for_line, prediction_line, color = 'blue', linewidth = 3, label = 'Big Brain/Big Arms Duality of Man?')

ax.set_ylabel('Athleticism')
ax.set_xlabel('Intelligence')

ax.set_yticklabels([])
ax.set_xticklabels([])

ax.legend()
plt.show()