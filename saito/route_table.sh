#!/bin/bash
if [ "`echo $line | grep 'resource "aws_route_table"'`" ] ; then
    # {}で継続判断する
    brackets=1
    route_table_boolean="true"
    # ダブルクォーテーションを判定する
    hoge="`echo $line="" | grep -oP '(?<=")[^",]+(?=")'`"
    # リソース名と固有名を保存する
    array=(`echo $hoge`)
elif [ "$route_table_boolean" = "true" ] ; then
    # route_table内継続処理
    if [ "`echo $line | grep '{'`" ] ; then
    brackets=$((brackets+1))
    elif [ "`echo $line | grep '}'`" ] ; then
    brackets=$((brackets-1))
    fi

    if [ "`echo $line | grep '0.0.0.0/0'`" ] ; then
        cidr_block="`echo $line="" | grep -oP '(?<=")[^",]+(?=")'`"
    fi

    # route_table内終了処理
    if [ $brackets = 0 ] ; then
    route_table_boolean=false
        if [ "$cidr_block" = '0.0.0.0/0' ] ; then
            public_route_table[public_route_table_count]=${array[1]}
            # echo ${public_route_table[@]}
            public_route_table_count=$((public_route_table_count+1))
        fi
    cidr_block=""
    fi
fi