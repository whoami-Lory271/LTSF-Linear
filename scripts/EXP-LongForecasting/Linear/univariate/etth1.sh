if [ ! -d "./logs" ]; then
    mkdir ./logs
fi

if [ ! -d "./logs/LongForecasting" ]; then
    mkdir ./logs/LongForecasting
fi

if [ ! -d "./logs/LongForecasting/univariate" ]; then
    mkdir ./logs/LongForecasting/univariate
fi
model_name=NLinear

# ETTh1, univariate results, pred_len= 24 48 96 192 336 720
for pred_len in 24 48 168 336 720
do
python -u run_longExp.py \
  --is_training 1 \
  --root_path ./dataset/ \
  --data_path ETTh1.csv \
  --model_id ETTh1_336_24 \
  --model $model_name \
  --data ETTh1 \
  --seq_len 336 \
  --pred_len $pred_len \
  --enc_in 1 \
  --des 'Exp' \
  --itr 1 --batch_size 32 --feature S --learning_rate 0.005 >logs/LongForecasting/$model_name'_'fS_ETTh1_336_$pred_len.log
done

