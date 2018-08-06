#! /usr/bin/python3

import sys
import os

import pandas as pd
import numpy as np
import matplotlib.pyplot as plt

from mpl_toolkits.mplot3d import Axes3D
from sklearn.decomposition import PCA as sklearnPCA
from sklearn import tree
from sklearn.model_selection import train_test_split
from sklearn.model_selection import KFold
from sklearn.model_selection import RepeatedKFold
from sklearn.metrics import accuracy_score

import ppar

def create_folder(directory):
    try:
        if not os.path.exists(directory):
            os.makedirs(directory)
    except OSError:
        print ("error: could not create directory: " + directory)

if __name__ == "__main__":

    print("=== Decision Tree statistical learning ===")
    raw_data_filename = sys.argv[1]
    report_folder = sys.argv[2]
    std_num = int(sys.argv[3]) # outliers screening parameter
    norm = sys.argv[4]

    if not os.path.exists(raw_data_filename):
        sys.exit("error: " + raw_data_filename + " data file does not exist!")

    if not os.path.exists(report_folder):
        sys.exit("error: " + report_folder + " report folder does not exist!")

    print("Raw data input: " + raw_data_filename)
    print("Report folder: " + report_folder)
    print("Screen outliers outside " + str(std_num) + "-sigma standard deviations")

    normalized_folder = report_folder + "/normalized-values/"
    absolute_folder = report_folder + "/absolute-values/"

    create_folder(normalized_folder)
    create_folder(absolute_folder)

    # load raw data file
    data = pd.read_csv(raw_data_filename)
    # loop locations in benchmark source code
    loop_locations = data['loop-location']
    # prepare statistical learning labels 
    loop_icc_classifications = data['icc-parallel']
    # prepare statistical learning features 
    features = data.drop(['loop-location','icc-parallel'], axis=1)

    # remove outliers from the data
    if std_num != 0:
        filtered_idxs = {}
        for metric in ppar.metric_list:  
            d = features[metric]
            filtered_idxs[metric] = features[abs(d-d.mean()) < std_num*d.std()].index
    
        filtered_idx = features.index
        for metric in ppar.metric_list:  
            filtered_idx &= filtered_idxs[metric]

        loop_icc_classifications = loop_icc_classifications[filtered_idx]
        idxs_to_drop = features.index.drop(filtered_idx)
        features = features.drop(idxs_to_drop)

        loop_icc_classifications = loop_icc_classifications.reset_index(drop=True)
        features = features.reset_index(drop=True)

    # normalize the data
    if norm == "norm":
        for feature in ppar.metric_list:
            features[feature] = (features[feature] - features[feature].min())/(features[feature].max() - features[feature].min())

    # prepare data for different metric groups
    metrics_data = {}
    for metric_group in ppar.metric_groups:
        metrics_data[metric_group] = features[ppar.metric_groups[metric_group]]

    # prepare data for single metrics
    metric_data = {}
    for metric in ppar.metric_list:
        metric_data[metric] = features[metric]

    # prepare data for different metric groups
    metric_set_data = {}
    for metric_set in ppar.metric_sets:
        metric_set_data[metric_set] = features[ppar.metric_sets[metric_set]]

    report_filename = report_folder + "decision-tree.report"
    report_file = open(report_filename,'w')

    # print the header into the report file
    print('DecisionTree.report', file=report_file)
    
    # SVM for sets of metrics
    for metric_set in ppar.metric_sets:
        dataset = metric_set_data[metric_set]
        print("DT with features from " + metric_set + " metric set")

        report_file.write("[") 
        for metric in ppar.metric_sets[metric_set]: 
            report_file.write(" " + str(metric))
        report_file.write(" ]\n") 

        random_state = 12883823
        for splits_num in [5,10,15]:
            report_file.write("splits num:" + str(splits_num)+ "\n")

            rkf = RepeatedKFold(n_splits=splits_num, n_repeats=3, random_state=random_state)

            for train, test in rkf.split(dataset):
                training_data = dataset.iloc[train]
                testing_data = dataset.iloc[test]
                training_labels = loop_icc_classifications.iloc[train]
                testing_labels = loop_icc_classifications.iloc[test]

                # fit SVM model to the training dataset
                clf = tree.DecisionTreeClassifier()
                clf.fit(training_data, training_labels)
                # calculate prediction accuracy 
                accuracy = accuracy_score(testing_labels, clf.predict(testing_data))
                report_file.write("dt-accuracy:" + "{0:.2f}".format(accuracy*100) + "\n")
    
    report_file.close()

    # SVM for sets of metrics
    for metric_set in ppar.metric_sets:
        dataset = metric_set_data[metric_set]
        print("DT with features from " + metric_set + " metric set")

        training_data = dataset
        training_labels = loop_icc_classifications

        # fit SVM model to the training dataset
        clf = tree.DecisionTreeClassifier()
        clf.fit(training_data, training_labels)

        tree.export_graphviz(clf, feature_names=ppar.metric_sets[metric_set], class_names=['non-parallelizible','parallelizible'], filled=True, out_file=report_folder + 'decision-tree.' + metric_set + '.dot')
