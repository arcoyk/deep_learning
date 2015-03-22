#! /usr/bin/python

from PIL import Image
from PIL import ImageOps
import ImageFilter
import os
import sys
import glob
import csv
import numpy

def main():
	input_path = '/Users/uenomichihiko/Desktop/ama/'
	gray_path = '/Users/uenomichihiko/Desktop/av_g/'
	csv_path = '/Users/uenomichihiko/Desktop/ama_csv/'
	img2csv(input_path, csv_path)


	#img2gray(input_path, gray_path)

def img2gray(input_path, output_path):
	imgList = glob.glob(input_path+'*.jpg')
	print len(imgList)
	for img in imgList:
		input_image = Image.open(img)
		pathName = img.split('/')
		imgFileName = pathName[-1]
		print imgFileName
		output_image = ImageOps.grayscale(input_image)
		output_image.save(output_path+imgFileName)

def gs(path):
	im = Image.open(path)
	im = ImageOps.grayscale(im)
	im.save("%s_gs.png" % path.split(".")[0])
	return im

def resize(im, x, y):
	return im.resize((x, y))

def edge(im):
	return im.filter(ImageFilter.FIND_EDGES)


def img2text(path):
	im = resize(gs(path), 48, 48)
#	im.save("gs.png")
	l = (numpy.asarray(im).flatten()).tolist()
	#l = [1 if e > 0.5 else 0 for e in l]
	l = [str(e) for e in l]
	return l

def img2csv(imgPath, csvPath):
	f = open(csvPath+'train.csv', "w")
	writer = csv.writer(f)
	#writer.writerow([1])
	counter = 0
	for e in glob.glob(imgPath+'*.jpg'):
		if(counter < 101):
			print 'true'
			c = '0'
		else:
			print 'false'
			c = '1'
		#print e
		l = img2text(e)
		l.append(c)
		writer.writerow(l)
		counter += 1
	f.close()

if __name__ == "__main__":
	main()