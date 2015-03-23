import sys
from pylearn2.datasets.csv_dataset import CSVDataset
import pickle

path = "./"
filename = sys.argv[1]
print 'converting ' + filename
pickle.dump(CSVDataset(path + filename, delimiter = ',', one_hot = True), open(path + filename.split('.')[0] + '.pkl', 'w'))
print 'done'