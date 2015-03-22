from pylearn2.config import yaml_parse
import os
import pickle

def train_step(config_file):
	assert(os.path.exists(config_file))
	_yaml = open(config_file).read()
	_train = yaml_parse.load(_yaml)
	_train.main_loop()
	return _train

l1_train = train_step('dae_l1.yaml')
l2_train = train_step('dae_l2.yaml')
_train = train_step('dae_mlp.yaml')