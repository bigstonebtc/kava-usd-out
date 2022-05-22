#!/bin/bash

#Ununtuで動きます。他で動かす場合は適当にコマンドのパスを変えてください
#bnbcliのバイナリを適当なディレクトリにインストールして動くようにしておいてください
#jasonパースツールのjqをインストールしておいてください

#適当な監視時間を設定してください。デフォルトは2分ｘ720で、1440分（1日）です。
a=0
while [ $a -lt 720 ]
do

# BNBチェーンからBNBブリッジの残高を取得します
JSONDATA=`bnbcli account bnb10zq89008gmedc6rrwzdfukjk94swynd7dl97w8 --chain-id Binance-Chain-Tigris --node https://dataseed5.defibit.io:443`

echo $JSONDATA

bnbamount=$(echo $JSONDATA | jq -r '.value.base.coins[1].amount';)

# この残高以上があればアラートしてほしいという残高を設定してください。単位は1億分の1 BNBです。つまり、1BNB=100000000です。
holdings="100000000"

echo "amount" $bnbamount
echo $(( $bnbamount / 100000000)) "BNB"


if [ "$bnbamount" -gt "$holdings" ]

then 
#アラート

echo "Your BNB Found ! Your BNB Found ! Your BNB Found !"


#以下BNBが見つかった場合の処理を書いてください。サンプルではサウンドファイルを鳴らしています。適当なサウンドファイルのパスを記入ください

paplay /usr/share/sounds/ubuntu/ringtones/Soul.ogg

 break
fi

#監視のインターバルを設定ください。デフォルトは２分です。あんまり短くするとスパムでアクセスできなくなりますのでこのくらいが妥当です

sleep 2m
a=`expr $a + 1`

done
