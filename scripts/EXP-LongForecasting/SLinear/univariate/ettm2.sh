if [ ! -d "./logs" ]; then
    mkdir ./logs
fi

if [ ! -d "./logs/LongForecasting" ]; then
    mkdir ./logs/LongForecasting
fi

if [ ! -d "./logs/LongForecasting/univariate" ]; then
    mkdir ./logs/LongForecasting/univariate
fi
model_name=SLinear

# ETTm1, univariate results, pred_len= 96 192 336 720
for seed in 1 2 3
do
  for pred_len in 24 48 96 288 672
  do
  python -u run_longExp.py \
    --is_training 1 \
    --root_path ./dataset/ \
    --data_path ETTm2.csv \
    --model_id ETTm2_336_96 \
    --model $model_name \
    --data ETTm2 \
    --seq_len 336 \
    --pred_len $pred_len \
    --enc_in 1 \
    --des 'Exp' \
    --itr 1 --batch_size 32 --learning_rate 0.001 --feature S >logs/LongForecasting/$model_name'_'fS_ETTm2_336_96.log
  done
done