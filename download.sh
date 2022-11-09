python download_pretrain_model.py \
    --model_name_or_path hfl/chinese-roberta-wwm-ext \
    --cache_dir ./cache/ \

wget https://www.dropbox.com/s/9l0uch31rqv4v2k/multiple-choice-v1.bin?dl=1 -O ./roberta-wwm-ext/multiple-choice/pytorch_model.bin
wget https://www.dropbox.com/s/l4yd93u31uugq7w/qa-v1.bin?dl=1 -O ./roberta-wwm-ext/qa/pytorch_model.bin
