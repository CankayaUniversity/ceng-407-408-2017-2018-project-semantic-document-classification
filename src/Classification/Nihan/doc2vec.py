import os
import os.path
import sys
import copy
import string
import numpy
import sklearn.ensemble
import sklearn.model_selection 
import sklearn.pipeline 

from gensim.models.word2vec import Word2Vec

from multiprocessing import cpu_count

from gensim.models import Doc2Vec
from gensim.models.doc2vec import TaggedDocument

from collections import namedtuple

input_folder_name = "C:\\bbc_insight" 
categories = ["business", "entertainment", "politics", "sport", "tech"] 


# Word2Vec number of features
num_features = 300
# Newsline folder and format
data_folder = 'C:\\semdoc\\data\\bbc\\'


start_alpha=0.01

infer_epoch=511

vector_size = num_features

window_size = 15

min_count = 1

sampling_threshold = 1e-5

negative_size = 5

train_epoch = 100

dm = 0 #0 = dbow; 1 = dmpv

worker_count = 1 #number of parallel processes

documents = []
labels = []
# For doc2vec.
tagged_documents = []
for i in range(len(categories)):
    category_name = categories[i]#categories[i].upper()
    folder_name = os.path.join(input_folder_name, category_name)
    base_filenames = os.listdir(folder_name)
    for j in range(len(base_filenames)):
        base_filename = base_filenames[j]
        filename = os.path.join(folder_name, base_filename)
        
        with open(filename, "r") as ifstr:
            text = ifstr.read()
        words = text.split()
        documents.append(words)
        tagged_document = TaggedDocument(words, [i])
        tagged_documents.append(tagged_document)
        labels.append(i)        
    

#doc2vec kısmı 
#d2v_model = Doc2Vec(alpha=0.025, min_alpha=0.025)  # use fixed learning rate
#d2v_model.build_vocab(sentences)
#for epoch in range(10):
#    d2v_model.train(sentences)
#    d2v_model.alpha -= 0.002  # decrease the learning rate
#    d2v_model.min_alpha = d2v_model.alpha  # fix the learning rate, no decay
d2v_model = Doc2Vec(tagged_documents, size=vector_size, window=window_size, min_count=min_count, sample=sampling_threshold, workers=worker_count, hs=0, dm=dm, negative=negative_size, dbow_words=1, dm_concat=1,  iter=train_epoch)
d2v_model.save(data_folder + 'bbc_insight.doc2vec')

#d2v_model = Doc2Vec(size = num_features, alpha=0.025, min_alpha=0.025)  # use fixed learning rate
#d2v_model.build_vocab(tagged_documents)

# Vectorize each document
num_categories = len(categories)
number_of_documents = len(documents)
X = numpy.zeros(shape=(number_of_documents, num_features)).astype(numpy.float32)
Y = numpy.zeros(shape=(number_of_documents, 1)).astype(numpy.float32)

empty_word = numpy.zeros(num_features).astype(numpy.float32)
for i in range(number_of_documents):
    doc = documents[i]
    vec = d2v_model.infer_vector(doc, alpha=start_alpha, steps=infer_epoch) 
    X[i, :] = numpy.array(vec)
    Y[i, :] = labels[i]

# Gradient Boosting
#model.fit(X, Y)
ctg = sklearn.ensemble.GradientBoostingClassifier()
model_selection_mdl = sklearn.model_selection
pipeline_mdl = sklearn.pipeline
pipeline_list = [("categorizer", ctg)]
pipeline = pipeline_mdl.Pipeline(pipeline_list)
param_grid = [
    {

        'categorizer__n_estimators': [63, 127, 255, 511],
        'categorizer__learning_rate':[0.1, 0.01, 0.001],
    }
]

grid_searcher = model_selection_mdl.GridSearchCV(pipeline, cv=3, n_jobs=1, param_grid=param_grid, verbose =3)
grid_searcher.fit(X, Y)
#scores = model_selection_mdl.cross_val_score(model, X, Y, cv=5)
#accuracy = scores.mean()

accuracy = grid_searcher.best_score_
print("Accuracy: %.3f" % (accuracy))    
