# Item and User LLM are initialized by specific pretrain_dir.
exp=1108
#batch_size 16->8->4->2->1
cd code && python3 main.py \
--config_file overall/ID.yaml IDNet/hstu.yaml \
--loss nce \
--epochs 200 \
--dataset Pixel50K \
--train_batch_size 16 \
--MAX_TEXT_LENGTH 200 \
--MAX_ITEM_LIST_LENGTH 10 \
--checkpoint_dir ../experiments/$exp \
--optim_args.learning_rate 1e-4 \
--is_text yes \
--item_pretrain_dir Qwen/Qwen2-VL-2B-Instruct \
--user_pretrain_dir Qwen/Qwen2-VL-2B-Instruct \
# --text_path /home/yanruiran/workspace/lyc/HLLM/information \
# --text_keys '[\"title\",\"tag\",\"description\"]'\