import matplotlib.pyplot as plt
import numpy as np


def plot_simple(data, x_label, y_label, ax=None, line_label=None, line_style='solid'):
    x = data[x_label]
    y = data[y_label]

    if ax is None:
        fig, ax = plt.subplots()
        ax.plot(x, y, label='mas', linestyle=line_style)
        plt.xlabel(x_label)
        plt.ylabel(y_label)
        plt.axis([np.min(x), np.max(x), np.min(y), np.max(y)])
        plt.show()
        return

    ax.plot(x, y, label=line_label, linestyle=line_style)
    # ax.set_ylim(bottom=0)
    ax.set_title(x_label)
    ax.legend()


def plot_group(target_metric):
    fig, axes = plt.subplots(nrows=3, ncols=2, figsize=(10, 10))

    plt.suptitle(target_metric)
    plot_simple(min_itm_in_mas_data, 'min_itm_in', target_metric, axes[0][0], 'MAS')
    # plot_simple(min_itm_in_mas_old_data, 'min_itm_in', target_metric, axes[0][0], 'MAS Old')
    plot_simple(min_itm_in_map_data, 'min_itm_in', target_metric, axes[0][0], 'MAP')
    plot_simple(min_itm_in_fp_growth_data, 'min_itm_in', target_metric, axes[0][0], 'FP Growth')
    axes[0][0].set_ylim(bottom=0, top=None, emit=True, auto=True)

    plot_simple(min_itm_out_mas_data, 'min_itm_out', target_metric, axes[0][1], 'MAS')
    # plot_simple(min_itm_out_mas_old_data, 'min_itm_out', target_metric, axes[0][1], 'MAS Old')
    plot_simple(min_itm_out_map_data, 'min_itm_out', target_metric, axes[0][1], 'MAP')
    plot_simple(min_itm_out_fp_growth_data, 'min_itm_out', target_metric, axes[0][1], 'FP Growth')
    axes[0][1].set_ylim(bottom=0, top=None, emit=True, auto=True)

    plot_simple(min_fin_in_mas_data, 'min_fin_in', target_metric, axes[1][0], 'MAS')
    # plot_simple(min_fin_in_mas_old_data, 'min_fin_in', target_metric, axes[1][0], 'MAS Old')
    plot_simple(min_fin_in_map_data, 'min_fin_in', target_metric, axes[1][0], 'MAP')
    plot_simple(min_fin_in_fp_growth_data, 'min_fin_in', target_metric, axes[1][0], 'FP Growth')
    axes[1][0].set_ylim(bottom=0, top=None, emit=True, auto=True)

    # plot_simple(min_fin_out_mas_data, 'min_fin_out', target_metric, axes[1][1], 'MAS')

    plot_simple(min_fin_acc_mas_data, 'min_fin_acc', target_metric, axes[1][1], 'MAS')
    # plot_simple(min_fin_acc_mas_old_data, 'min_fin_acc', target_metric, axes[1][1], 'MAS Old')
    plot_simple(min_fin_acc_map_data, 'min_fin_acc', target_metric, axes[1][1], 'MAP')
    plot_simple(min_fin_acc_fp_growth_data, 'min_fin_acc', target_metric, axes[1][1], 'FP Growth')
    axes[1][1].set_ylim(bottom=0, top=None, emit=True, auto=True)

    plot_simple(max_var_s0_mas_data, 'max_var_s0', target_metric, axes[2][0], 'MAS')
    # plot_simple(max_var_s0_mas_old_data, 'max_var_s0', target_metric, axes[2][0], 'MAS Old')
    plot_simple(max_var_s0_map_data, 'max_var_s0', target_metric, axes[2][0], 'MAP')
    plot_simple(max_var_s0_fp_growth_data, 'max_var_s0', target_metric, axes[2][0], 'FP Growth')
    axes[2][0].set_ylim(bottom=0, top=None, emit=True, auto=True)
    axes[2][0].autoscale(enable=True)


    plot_simple(max_var_s1_mas_data, 'max_var_s1', target_metric, axes[2][1], 'MAS')
    # plot_simple(max_var_s1_mas_old_data, 'max_var_s1', target_metric, axes[2][1], 'MAS Old')
    plot_simple(max_var_s1_map_data, 'max_var_s1', target_metric, axes[2][1], 'MAP')
    plot_simple(max_var_s1_fp_growth_data, 'max_var_s1', target_metric, axes[2][1], 'FP Growth')
    axes[2][1].set_ylim(bottom=0, top=None, emit=True, auto=True)

    if target_metric == 'mining_and_filtering_duration':
        plot_simple(min_itm_in_map_data, 'min_itm_in', 'mining_duration', axes[0][0], 'MAP Mining', 'dashed')
        plot_simple(min_itm_out_map_data, 'min_itm_out', 'mining_duration', axes[0][1], 'MAP Mining', 'dashed')
        plot_simple(min_fin_in_map_data, 'min_fin_in', 'mining_duration', axes[1][0], 'MAP Mining', 'dashed')
        plot_simple(min_fin_acc_map_data, 'min_fin_acc', 'mining_duration', axes[1][1], 'MAP', 'dashed')
        plot_simple(max_var_s1_map_data, 'max_var_s1', 'mining_duration', axes[2][1], 'MAP', 'dashed')
        plot_simple(max_var_s0_map_data, 'max_var_s0', 'mining_duration', axes[2][0], 'MAP', 'dashed')

    plt.tight_layout()
    # plt.ylim(bottom=0)
    plt.savefig('./plots-output/' + target_metric + '.png')
    plt.show()


mas_data = np.genfromtxt('./data/MAS-report.csv', delimiter=',', names=True)
min_itm_in_mas_data = mas_data[0:10]
min_itm_out_mas_data = mas_data[10:20]
min_fin_in_mas_data = mas_data[20:30]
min_fin_acc_mas_data = mas_data[30:38]
max_var_s0_mas_data = mas_data[38:42]
max_var_s1_mas_data = mas_data[42:46]

mas_old_data = np.genfromtxt('data/MAS-old-report.csv', delimiter=',', names=True)
min_itm_in_mas_old_data = mas_old_data[0:10]
min_itm_out_mas_old_data = mas_old_data[10:20]
min_fin_in_mas_old_data = mas_old_data[20:30]
min_fin_out_mas_old_data = mas_old_data[30:40]
min_fin_acc_mas_old_data = mas_old_data[40:48]
max_var_s0_mas_old_data = mas_old_data[48:52]
max_var_s1_mas_old_data = mas_old_data[52:56]

map_data = np.genfromtxt('data/MAP-report.csv', delimiter=',', names=True)
min_itm_in_map_data = map_data[0:10]
min_itm_out_map_data = map_data[10:20]
min_fin_in_map_data = map_data[20:30]
min_fin_acc_map_data = map_data[30:38]
max_var_s0_map_data = map_data[38:40]
max_var_s1_map_data = map_data[40:42]

fp_growth_data = np.genfromtxt('./data/FP-Growth-report.csv', delimiter=',', names=True)
min_itm_in_fp_growth_data = fp_growth_data[0:10]
min_itm_out_fp_growth_data = fp_growth_data[10:20]
min_fin_in_fp_growth_data = fp_growth_data[20:30]
min_fin_acc_fp_growth_data = fp_growth_data[30:38]
max_var_s0_fp_growth_data = fp_growth_data[38:42]
max_var_s1_fp_growth_data = fp_growth_data[42:46]

target_metrics = [
    "candstore_length",
    "no_of_queries",
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
    "mining_and_filtering_duration",
]

for target_metric in target_metrics:
    plot_group(target_metric)
