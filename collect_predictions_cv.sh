#!/bin/sh

NUMBER_OF_FOLDS=${1:-10}
ACL_ROOT=/home/nami/acl2019_nested_ner
NER_COMPARISON_ROOT=/home/nami/ner-comparison

mkdir $NER_COMPARISON_ROOT/cv/seq2seq_w2v_lstm
for i in $(seq -f "%02g" 1 $NUMBER_OF_FOLDS)
do
	cp $ACL_ROOT/logs/$i/test_system_bio.conll $NER_COMPARISON_ROOT/cv/seq2seq_w2v_lstm/$i.txt
done

sed -i -E "s/(.+)\t(.+)\t(.+)\t(.+)/\1 \4/" $NER_COMPARISON_ROOT/cv/seq2seq_w2v_lstm/*.txt

deactivate