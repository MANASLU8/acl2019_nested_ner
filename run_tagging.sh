#!/bin/sh

NUMBER_OF_FOLDS=${1:-10}
ACL_ROOT=/home/nami/acl2019_nested_ner
MODELS_ROOT=/home/nami/models

cd $ACL_ROOT
deactivate
export LD_LIBRARY_PATH=/usr/local/cuda/lib64
. ./python/bin/activate

for i in $(seq -f "%02g" 1 $NUMBER_OF_FOLDS)
do
	./tagger.py --train_data=$ACL_ROOT/rucv/$i/train.txt --test_data=$ACL_ROOT/rucv/$i/test.txt --decoding=seq2seq --form_wes_model=$MODELS_ROOT/ArModel100w2v.txt --name=seq2seq+w2v
done

deactivate
