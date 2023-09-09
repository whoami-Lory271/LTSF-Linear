if [ ! -d "./logs" ]; then
    mkdir ./logs
fi

if [ ! -d "./logs/LongForecasting" ]; then
    mkdir ./logs/LongForecasting
fi

if [ ! -d "./logs/LongForecasting/univariate" ]; then
    mkdir ./logs/LongForecasting/univariate
fi
model_name=Linear

# ETTm1, univariate results, pred_len= 96 192 336 720
for seed in 1 2 3
do
  for pred_len in 24 48 168 336 720
  do
  python -u run_longExp.py \
    --is_training 1 \
    --root_path ./dataset/ \
    --data_path electricity.csv \
    --model_id Electricity_336_96 \
    --model $model_name \
    --data custom \
    --seq_len 336 \
    --seed $seed \
    --pred_len $pred_len \
    --enc_in 1 \
    --des 'Exp' \
    --itr 1 --batch_size 16 --learning_rate 0.0001 --feature S >logs/LongForecasting/$model_name'_'fS_Electricity_336_96_$pred_len.log
  done
done