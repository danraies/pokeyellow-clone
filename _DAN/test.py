import os
import json
import matplotlib.pyplot as plt
import numpy as np
from scipy.stats import norm
from sklearn.neighbors import KernelDensity

# ----------------------------------------------------------------------
# Plot a 1D density example

X_MIN = 0
X_MAX = 250
BUMP_1 = 50
BUMP_2 = 200
STDEV = 10
RATIO_1 = 0.3
RATIO_2 = 1 - RATIO_1
BANDWIDTH = 7
N = 151

np.random.seed(1)
X = np.concatenate(
    (np.random.normal(BUMP_1, STDEV, int(RATIO_1 * N)), np.random.normal(BUMP_2, STDEV, int(RATIO_2 * N)))
)[:, np.newaxis]

X_raw = [45, 60, 80, 39, 58, 78, 44, 59, 79, 45, 50, 60, 40, 45, 65, 40, 63, 83, 30, 55, 40, 65, 35, 60, 50, 75, 50, 75, 55, 70, 90, 46, 61, 81, 70, 95, 38, 73, 115, 140, 40, 75, 45, 60, 75, 35, 60, 60, 70, 10, 35, 40, 65, 50, 80, 40, 65, 55, 90, 40, 65, 90, 25, 40, 55, 70, 80, 90, 50, 65, 80, 40, 80, 40, 55, 80, 50, 65, 90, 95, 25, 50, 52, 35, 60, 65, 90, 80, 105, 30, 50, 30, 45, 60, 35, 60, 85, 30, 55, 40, 60, 60, 95, 50, 60, 60, 60, 90, 40, 65, 80, 105, 250, 65, 105, 30, 55, 45, 80, 30, 60, 40, 70, 65, 65, 65, 65, 75, 20, 95, 130, 48, 55, 130, 65, 65, 75, 35, 70, 30, 60, 80, 160, 90, 90, 90, 41, 61, 91, 106, 100]
X = np.array([[x] for x in X_raw])

X_plot = np.linspace(X_MIN, X_MAX, 100)[:, np.newaxis]

# true_dens = RATIO_1 * norm(BUMP_1, STDEV).pdf(X_plot[:, 0]) + RATIO_2 * norm(BUMP_2, STDEV).pdf(X_plot[:, 0])

fig, ax = plt.subplots()
# ax.fill(X_plot[:, 0], true_dens, fc="black", alpha=0.2, label="input distribution")
colors = ["navy", "cornflowerblue", "darkorange"]
kernels = ["gaussian", "tophat", "epanechnikov"]
colors = ["navy"]
kernels = ["gaussian"]
color = "navy"
kernel = "gaussian"
# lw = 2

BIG_MAX_Y = 0

# for color, kernel in zip(colors, kernels):
kde = KernelDensity(kernel=kernel, bandwidth=BANDWIDTH).fit(X)
log_dens = np.exp(kde.score_samples(X_plot))
BIG_MAX_Y = max(BIG_MAX_Y, max(log_dens))
# for y in log_dens:
#     if y < 0.0001:
#         y = 0
#     normalized_log_dens.append(y)
ax.plot(
    X_plot[:, 0],
    log_dens,
    # color=color,
    # lw=lw,
    # linestyle="-",
    # label="kernel = '{0}'".format(kernel),
)

ax.text(6, 0.38, "N={0} points".format(N))

# ax.legend(loc="upper left")
ax.plot(X[:, 0], -0.01 * BIG_MAX_Y - 0.08 * BIG_MAX_Y * np.random.random(X.shape[0]), "+k")

ax.set_xlim(X_MIN, X_MAX)
ax.set_ylim(-0.1 * BIG_MAX_Y, 1.05 * BIG_MAX_Y)
plt.show()