import plotly
import chart_studio.plotly as plotly
import plotly.graph_objects as go
import numpy as np

# x = [0.000024,
# 0.000191,
# 0.001819,
# 0.025826,
# 0.313013,
# 3.641381,
# 43.794076,
# 485.207768])

# y = [10,
# 100,
# 1000,
# 10000,
# 100000,
# 1000000,
# 10000000,
# 100000000]

# fig = go.Figure(data=go.Scatter(x=x, y=y))
# fig.show()

np.random.seed(1)


x = [
    10,
    100,
    1000,
    10000,
    100000,
    1000000,
    10000000,
    100000000
]

y1 = [
    0.000007,
    0.000008,
    0.000007,
    0.000008,
    0.000008,
    0.000007,
    0.000007,
    0.000011
]

y2 = [
    0.000011,
    0.00001,
    0.000013,
    0.000014,
    0.000014,
    0.000015,
    0.000016,
    0.000016
]

y3 = [
    0.000015,
    0.00002,
    0.000095,
    0.000887,
    0.010276,
    0.104977,
    1.012467,
    11.240785
]

y4 = [
    0.000024,
    0.000191,
    0.001819,
    0.025826,
    0.313013,
    3.641381,
    43.794076,
    485.207768
]

y5 = [
    0.000016,
    0.000593,
    0.054305,
    5.433039,
    559.86067
]

y_plots = {
    "O(1)" : y1,
    "O(log n)" : y2,
    "O(n)" : y3,
    "O(n log n)" : y4,
    "O(n^2)" : y5
}

# Create traces
fig = go.Figure()

for algorithm, y_values in y_plots.iteritems():
    fig.add_trace(go.Scatter(x=x, y=y_values,
                    mode='lines+markers',
                    name=algorithm))



fig.update_layout(
    xaxis_type="log", 
    yaxis_type="log",
    title_text='My plot')
fig.show()