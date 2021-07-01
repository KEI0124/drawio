#!/bin/bash
if [ "`echo $line | grep 'resource "aws_route_table_association"'`" ] ; then
    # {}で継続判断する
    brackets=1
    route_table_associate_boolean="true"
elif [ "$route_table_associate_boolean" = "true" ] ; then
    # route_table内継続処理
    if [ "`echo $line | grep '{'`" ] ; then
    brackets=$((brackets+1))
    elif [ "`echo $line | grep '}'`" ] ; then
    brackets=$((brackets-1))
    fi

    route_table_associate[route_table_associate_count]=${line}
    route_table_associate_count=$((route_table_associate_count+1))

    # route_table内終了処理
    if [ $brackets = 0 ] ; then
    route_table_associate_boolean=false
    fi
fi