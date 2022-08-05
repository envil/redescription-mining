import matplotlib.pyplot as plt
import numpy as np


def plot_simple(data, x_label, y_label, ax=None, line_label=None):
    x = data[x_label]
    y = data[y_label]

    if ax is None:
        fig, ax = plt.subplots()
        ax.plot(x, y, label='mas')
        plt.xlabel(x_label)
        plt.ylabel(y_label)
        plt.axis([np.min(x), np.max(x), np.min(y), np.max(y)])
        plt.show()
        return

    ax.plot(x, y, label=line_label)
    ax.set_title(x_label)
    ax.legend()


def plot_group(target_metric):
    fig, axes = plt.subplots(nrows=4, ncols=2, figsize=(10, 10))

    plt.suptitle(target_metric)
    plot_simple(min_itm_in_mas_data, 'min_itm_in', target_metric, axes[0][0], 'MAS')
    plot_simple(min_itm_in_map_data, 'min_itm_in', target_metric, axes[0][0], 'MAP')

    plot_simple(min_itm_out_mas_data, 'min_itm_out', target_metric, axes[0][1], 'MAS')
    plot_simple(min_itm_out_map_data, 'min_itm_out', target_metric, axes[0][1], 'MAP')

    plot_simple(min_fin_in_mas_data, 'min_fin_in', target_metric, axes[1][0], 'MAS')
    plot_simple(min_fin_in_map_data, 'min_fin_in', target_metric, axes[1][0], 'MAP')

    plot_simple(min_fin_out_mas_data, 'min_fin_out', target_metric, axes[1][1])

    plot_simple(min_fin_acc_mas_data, 'min_fin_acc', target_metric, axes[2][0], 'MAS')
    plot_simple(min_fin_acc_map_data, 'min_fin_acc', target_metric, axes[2][0], 'MAP')

    plot_simple(max_var_s0_mas_data, 'max_var_s0', target_metric, axes[2][1], 'MAS')
    plot_simple(max_var_s0_map_data, 'max_var_s0', target_metric, axes[2][1], 'MAP')

    plot_simple(max_var_s1_mas_data, 'max_var_s1', target_metric, axes[3][0], 'MAS')
    plot_simple(max_var_s1_map_data, 'max_var_s1', target_metric, axes[3][0], 'MAP')

    plt.tight_layout()
    plt.show()


mas_data = np.genfromtxt('./data/MAS-report.csv', delimiter=',', names=True)
min_itm_in_mas_data = mas_data[0:10]
min_itm_out_mas_data = mas_data[10:20]
min_fin_in_mas_data = mas_data[20:30]
min_fin_out_mas_data = mas_data[30:40]
min_fin_acc_mas_data = mas_data[40:48]
max_var_s0_mas_data = mas_data[48:52]
max_var_s1_mas_data = mas_data[52:56]

map_data = np.genfromtxt('./data/MAP-report.csv', delimiter=',', names=True)
min_itm_in_map_data = map_data[0:10]
min_itm_out_map_data = map_data[10:20]
min_fin_in_map_data = map_data[20:30]
min_fin_acc_map_data = map_data[30:38]
max_var_s0_map_data = map_data[38:40]
max_var_s1_map_data = map_data[40:42]

target_metrics = [
    "candstore_length",
    "queries_length",
    "no_of_redescriptions",
    "queries_support_min",
    "queries_support_max",
    "queries_support_mean",
    "queries_support_median",
    "queries_accuracy_min",
    "queries_accuracy_max",
    "queries_accuracy_mean",
    "queries_accuracy_median",
    "mining_duration",
    "filtering_duration",
]

for target_metric in target_metrics:
    plot_group(target_metric)
