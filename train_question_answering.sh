#! /bin/bash
# ./bert/multiple-choice ./roberta-wwm-ext/multiple_choice ./roberta-base ./bert-base-cased hfl/chinese-roberta-wwm-ext ./bert-base-chinese 
# python multiple-choice/run_multiple_choice.py \
#   --do_train \
#   --do_eval \
#   --model_name_or_path bert-base-chinese \
#   --output_dir ./multiple-choice \
#   --overwrite_output_dir \
#   --train_file ./data/train.json \
#   --validation_file ./data/valid.json \
#   --context_file ./data/context.json \
#   --cache_dir ./cache/ \
#   --pad_to_max_length \
#   --max_seq_length 512 \
#   --learning_rate 3e-5 \
#   --num_train_epochs 3 \
#   --warmup_ratio 0.1 \

python question-answering/run_qa.py \
  --do_train \
  --do_eval \
  --model_name_or_path bert-base-chinese  \
  --output_dir ./question-answering \
  --overwrite_output_dir \
  --train_file ./data/train.json \
  --validation_file ./data/valid.json \
  --context_file ./data/context.json \
  --cache_dir ./cache/ \
  --per_device_train_batch_size 8 \
  --gradient_accumulation_steps 8 \
  --per_device_eval_batch_size 8 \
  --eval_accumulation_steps 8 \
  --learning_rate 3e-5 \
  --num_train_epochs 3 \
  --max_seq_length 512 \
  --doc_stride 128 \
  --warmup_ratio 0.1 
