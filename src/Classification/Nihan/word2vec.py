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



input_folder_name ="C:\\bbc_insight" 
categories = ["business", "entertainment", "politics", "sport", "tech"] 
# Word2Vec number of features
num_features = 511
# Newsline folder and format
data_folder = 'C:\\semdoc\\data\\bbc_word2vec\\'

documents = []
labels = []
for i in range(len(categories)):
    category_name = categories[i] #.upper()
    folder_name = os.path.join(input_folder_name, category_name)
    base_filenames = os.listdir(folder_name)
    for j in range(len(base_filenames)):
        base_filename = base_filenames[j]
        filename = os.path.join(folder_name, base_filename)
        
        with open(filename, "r") as ifstr:
            text = ifstr.read()
        words = text.split()
        documents.append(words)
        
        labels.append(i)        
    
# Create new Gensim Word2Vec model
w2v_model = Word2Vec(documents, size=num_features, min_count=1, iter = 45, window=20, workers=cpu_count())
w2v_model.init_sims(replace=True)
w2v_model.save(data_folder + 'news.word2vec')

# Vectorize each document
num_categories = len(categories)
number_of_documents = len(documents)
X = numpy.zeros(shape=(number_of_documents, num_features)).astype(numpy.float32)
Y = numpy.zeros(shape=(number_of_documents, 1)).astype(numpy.float32)

empty_word = numpy.zeros(num_features).astype(numpy.float32)
#burdan itibaren comment yap ve doc2vec dene
n_components = 5
zero_vec = numpy.zeros(shape = (1, num_features) )
for idx, document in enumerate(documents):
    vec = copy.deepcopy(zero_vec)
    n_words = 0
    for jdx, word in enumerate(document):
        #if jdx == document_max_num_words:
        #    break
            
        #else:
        if word in w2v_model:
            u = w2v_model[word]
            #u_arr = numpy.array(u_arr)
            vec += u  
            if jdx == 0:
                "."
                #print(vec.shape, vec[0, :n_components])
                kind_0 = type(w2v_model[word])
                kind_1 = type(vec)
                #print(kind_0, kind_1)
                #print(u)
            #X[idx, jdx, :] = w2v_model[word]
        else:
            "."
            vec += empty_word
            #X[idx, jdx, :] = empty_word
        n_words += 1
    vec /= n_words
    #print( vec[0, :])
    X[idx, :] = vec[0, :]#copy.deepcopy(vec) 
    Y[idx, :] = labels[idx]
            
#for idx, key in enumerate(document_Y.keys()):
#    Y[idx, :] = document_Y[key]

# Gradient Boosting
# [[GradientBoostingClassifier]] is an ensemble method. This is selected for categorizer in the grid search. One may obtain the best model by  */
#model = sklearn.ensemble.GradientBoostingClassifier(n_estimators = 1023, learning_rate = 0.001)
ctg = sklearn.ensemble.GradientBoostingClassifier()

# Gradient Boosting
#model.fit(X, Y)
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