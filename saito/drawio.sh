#!/bin/bash

# 平方根の計算をする場合、bcコマンドが必要
apt install bc

# ファイルが無い場合、作成
touch aws_service.drawio
# ファイルをリセット
: > aws_service.drawio

# 構成図にしたいtfファイルが格納されているフォルダ指定(深さ指定無し)
search_directory="./terraform"
# SATT-CDC-ALL-ALL-AWS_infra_network

# 配列のリセット
unset resource[@]
unset resource_name[@]
unset public_route_table[@]
unset route_table_associate[@]
unset public_subnet[@]

# drawioに必要な前段部分の書き出し
echo "<mxfile>" >> aws_service.drawio
echo "    <diagram id='"EN0f9omP_L5gO3yjNY8r"' name='"ページ1"'>" >> aws_service.drawio
echo "        <mxGraphModel dx='"777"' dy='"634"' grid='"1"' gridSize='"10"' guides='"1"' tooltips='"1"' connect='"1"' arrows='"1"' fold='"1"' page='"1"' pageScale='"1"' pageWidth='"827"' pageHeight='"1169"' background='"\#FFFFFF"' math='"0"' shadow='"0"'>" >> aws_service.drawio
echo "            <root>" >> aws_service.drawio
echo "                <mxCell id='"0"'/>" >> aws_service.drawio
echo "                <mxCell id='"1"' parent='"0"'/>" >> aws_service.drawio

# ファイル読み込みを行い、構成図に記述するリソースを保存する
count=2
route_table_boolean=false
public_route_table_count=0
route_table_associate_boolean=false
route_table_associate_count=0
# ディレクトリ検索
while read -d $'\0' file; do
  # tfファイルのみ読み込み
  if [ "`echo $file | grep '.tf'`" ] ; then
    # tfファイルを一行ずつ読み込む
    while read line; do
      # リソースがコメントアウトされていた場合、処理を行わない
      if [ "${line:0:1}" != "#" ] ; then
        # route_tableの処理
        if [ "`echo $line | grep 'resource "aws_route_table"'`" -o "$route_table_boolean" = "true" ] ; then
          source route_table.sh "$line"
        elif [ "`echo $line | grep 'resource "aws_route_table_association"'`" -o "$route_table_associate_boolean" = "true" ] ; then
          source route_table_associate.sh "$line"
        # awsのリソースのみ保存する
        elif [ "`echo $line | grep 'resource "aws_'`" ] ; then
          # ダブルクォーテーションを判定する
          hoge="`echo $line="" | grep -oP '(?<=")[^",]+(?=")'`"
          # リソース名と固有名を保存する
          array=(`echo $hoge`)

          # リソースからdrawio形式に変換するスクリプトを起動
          source trans.sh "${array[0]}"
          if [ $style ]; then
            # リソース名(drawio)
            resource[$count]=$style
            # 固有名
            resource_name[$count]=${array[1]}
            count=$((count+1))
          fi
        fi
      fi
    done < $file
  fi
done < <(find $search_directory -print0)

count=0
# パブリックサブネットの検知
for i in "${!public_route_table[@]}" ; do
  for j in "${!route_table_associate[@]}" ; do
    if [ "`echo ${route_table_associate[$j]} | grep 'subnet_id'`" ] ; then
     temp_public_subnet=${route_table_associate[$j]}
    fi
    
    if [ "`echo ${route_table_associate[$j]} | grep ${public_route_table[$i]}`" ] ; then
     public_subnet[$count]=$temp_public_subnet
     count=$((count+1))
    fi
  done
done

# パブリックサブネットの置換
count=2
for i in "${!resource[@]}" ; do
  if [ "`echo ${resource[$i]} | grep 'mxgraph.aws4.group_security_group'`" ] ; then
    for j in "${!public_subnet[@]}" ; do
      if [ "`echo ${public_subnet[$j]} | grep ${resource_name[$i]}`" ] ; then
        unset resource[$count]
        resource[$count]="points=[[0,0],[0.25,0],[0.5,0],[0.75,0],[1,0],[1,0.25],[1,0.5],[1,0.75],[1,1],[0.75,1],[0.5,1],[0.25,1],[0,1],[0,0.75],[0,0.5],[0,0.25]];outlineConnect=0;gradientColor=none;html=1;whiteSpace=wrap;fontSize=12;fontStyle=0;shape=mxgraph.aws4.group;grIcon=mxgraph.aws4.group_security_group;grStroke=0;strokeColor=#248814;fillColor=#E9F3E6;verticalAlign=top;align=left;spacingLeft=30;fontColor=#248814;dashed=0;"
      fi
    done
  fi
  count=$((count+1))
done

# リソースを配置する際の平方根取得
sqrt=`echo "sqrt("$((count-2))")"|bc`
# 平方根の余剰
remainder=$(((count-2)-$sqrt*$sqrt))

# 余剰が横一列より多い場合、追加する
num=0
if [ $remainder -gt $sqrt ] ; then
  num=1
  remainder=$(($remainder-$sqrt))
fi

# drawioに記述する(平方根)
count=2
for ((i=0; i<$sqrt+$num; i++)); do
  for ((j=0; j<$sqrt; j++)); do
  x=$((i*120+40))
  y=$((j*120+40))
  source place.sh
  count=$((count+1))
  done
done

# drawioに記述する(余剰)
y=$((j*120+40))
for ((i=0; i<$remainder; i++)); do
  x=$((i*120+40))
  source place.sh
  count=$((count+1))
done

# drawioに必要な残りの部分の書き出し
echo "            </root>" >> aws_service.drawio
echo "        </mxGraphModel>" >> aws_service.drawio
echo "    </diagram>" >> aws_service.drawio
echo "</mxfile>" >> aws_service.drawio