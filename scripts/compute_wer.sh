#cd /root/SLAM-LLM

trans="/root/llama-2-hf-finetune-asr-ds5-proj2048-lr1e-4-whisper-prompt-paddingr-20240104-decode_log_test_clean_bs8_beam4_repetition_penalty1_gt"
preds="/root/llama-2-hf-finetune-asr-ds5-proj2048-lr1e-4-whisper-prompt-paddingr-20240104-decode_log_test_clean_bs8_beam4_repetition_penalty1_pred"

# python src/llama_recipes/utils/preprocess_text.py ${preds} ${preds}.proc
# python src/llama_recipes/utils/compute_wer.py ${trans} ${preds}.proc ${preds}.proc.wer

python src/llama_recipes/utils/whisper_tn.py ${trans} ${trans}.proc
python src/llama_recipes/utils/llm_tn.py ${preds} ${preds}.proc
python src/llama_recipes/utils/compute_wer.py ${trans}.proc ${preds}.proc ${preds}.proc.wer

tail -3 ${preds}.proc.wer

# echo "-------num2word------"
# python src/llama_recipes/utils/num2word.py ${preds}.proc ${preds}.proc.words
# python src/llama_recipes/utils/compute_wer.py ${trans} ${preds}.proc.words ${preds}.proc.wer.words

# tail -3 ${preds}.proc.wer.words