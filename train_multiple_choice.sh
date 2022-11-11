#! /bin/bash
# ./bert/multiple-choice ./roberta-wwm-ext/multiple_choice roberta-base bert-base-cased hfl/chinese-roberta-wwm-ext
python3.9 multiple-choice/run_multiple_choice.py \
  --do_train \
  --do_eval \
  --model_name_or_path hfl/chinese-roberta-wwm-ext \
  --output_dir ./multiple-choice \
  --overwrite_output_dir \
  --train_file ./data/train.json \
  --validation_file ./data/train.json \
  --context_file ./data/context.json \
  --cache_dir ./cache/ \
  --pad_to_max_length \
  --max_seq_length 512 \
  --learning_rate 3e-5 \
  --num_train_epochs 3 \
  --warmup_ratio 0.1 \
