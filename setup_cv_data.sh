#!/bin/sh

NUMBER_OF_FOLDS=${1:-10}
ACL_ROOT=/home/dima/acl2019_nested_ner
FACT_RU_EVAL2STANFORD_ROOT=/home/dima/fact-ru-eval2stanford
BIO2BILOU_ROOT=/home/dima/bio2bilou

# cd BIO2BILOU_ROOT
# deactivate
# . ./python/bin/activate

# # Copy dataset to acl folder
# mkdir cv
# for i in $(seq -f "%02g" 1 $NUMBER_OF_FOLDS)
# do
# 	cp -r $FACT_RU_EVAL2STANFORD_ROOT/conll2003rucv/$i $ACL_ROOT/cv/
# done

# Delete unnecessary fields
cd $ACL_ROOT
# sed -i -E "s/(.+) (.+) (.+) (.+)/\1 \2 \4/" cv/*/*.txt
# sed -i '1,2d' cv/*/*.txt

cd $BIO2BILOU_ROOT
pwd
# Convert
mkdir rucv
for i in $(seq -f "%02g" 1 $NUMBER_OF_FOLDS)
do
	mkdir $ACL_ROOT/rucv/$i
	python convert.py --input $ACL_ROOT/cv/$i/train.txt --output $ACL_ROOT/rucv/$i/train.txt
	python convert.py --input $ACL_ROOT/cv/$i/test.txt --output $ACL_ROOT/rucv/$i/test.txt
done

deactivate