import numpy as np
import pickle
import theano

# function for classifying a input vector
def classify(inp,model,input_size):
    inp = np.asarray(inp)
    inp.shape = (1, input_size)
    print np.argmax(model.fprop(theano.shared(inp, name='inputs')).eval())
    return np.argmax(model.fprop(theano.shared(inp, name='inputs')).eval())

# function for calculating and printing the models accuracy on a given dataset
def score(dataset, model, input_size):
    nr_correct = 0
    for features, label in zip(dataset.X,dataset.y):
        if classify(features,model, input_size) == np.argmax(label):
            nr_correct += 1
    print '{}/{} correct'.format(nr_correct, len(dataset.X))
    return nr_correct, len(dataset.X)

model = pickle.load(open('mlp.pkl'))
test_data = pickle.load(open('test.pkl'))
score(test_data, model, 16)