# Item and User LLM are initialized by specific pretrain_dir.
exp=vision_28_28_200_old_old_prompt
#batch_size 16(image 28,56) ->8 (image 84)->4->2->1 #max_item_length 200 -> 135
cd code && python3 main.py \
--config_file overall/LLM_deepspeed.yaml IDNet/llama_id.yaml \
--loss nce \
--epochs 200 \
--dataset Pixel50K \
--train_batch_size 16 \
--MAX_TEXT_LENGTH 200 \
--MAX_ITEM_LIST_LENGTH 10 \
--checkpoint_dir experiments/$exp \
--optim_args.learning_rate 1e-4 \
--item_pretrain_dir ../models/Qwen/Qwen2-VL-2B-Instruct \
--user_pretrain_dir ../models/Qwen/Qwen2-VL-2B-Instruct \
--text_path /DATA/home/ljq/Projects/Molar/dataset/50k/item_info.csv \
--text_keys '[\"title\",\"tag\",\"description\"]'