#!/bin/bash

style=""

# lambda
if [ $1 = "aws_lambda_function" ] ; then
    style="outlineConnect=0;fontColor=#232F3E;gradientColor=none;fillColor=#D05C17;strokeColor=none;dashed=0;verticalLabelPosition=bottom;verticalAlign=top;align=center;html=1;fontSize=12;fontStyle=0;aspect=fixed;pointerEvents=1;shape=mxgraph.aws4.lambda_function;"
fi

# IAM_Role
if [ $1 = "aws_iam_role" ] ; then
    style="outlineConnect=0;fontColor=#232F3E;gradientColor=none;fillColor=#C7131F;strokeColor=none;dashed=0;verticalLabelPosition=bottom;verticalAlign=top;align=center;html=1;fontSize=12;fontStyle=0;aspect=fixed;pointerEvents=1;shape=mxgraph.aws4.role;"
fi

# Cloudwatch_Logs
if [ $1 = "aws_cloudwatch_log_group" ] ; then
    style="outlineConnect=0;fontColor=#232F3E;gradientColor=none;fillColor=#BC1356;strokeColor=none;dashed=0;verticalLabelPosition=bottom;verticalAlign=top;align=center;html=1;fontSize=12;fontStyle=0;aspect=fixed;pointerEvents=1;shape=mxgraph.aws4.logs;"
fi

# Cloudwatch_Rule
if [ $1 = "aws_cloudwatch_event_rule" ] ; then
    style="outlineConnect=0;fontColor=#232F3E;gradientColor=none;fillColor=#BC1356;strokeColor=none;dashed=0;verticalLabelPosition=bottom;verticalAlign=top;align=center;html=1;fontSize=12;fontStyle=0;aspect=fixed;pointerEvents=1;shape=mxgraph.aws4.event_event_based;"
fi

# SNS_Topic
if [ $1 = "aws_sns_topic" ] ; then
    style="outlineConnect=0;fontColor=#232F3E;gradientColor=none;fillColor=#BC1356;strokeColor=none;dashed=0;verticalLabelPosition=bottom;verticalAlign=top;align=center;html=1;fontSize=12;fontStyle=0;aspect=fixed;pointerEvents=1;shape=mxgraph.aws4.topic;"
fi

# ECR
if [ $1 = "aws_ecr_repository" ] ; then
    style="points=[[0,0,0],[0.25,0,0],[0.5,0,0],[0.75,0,0],[1,0,0],[0,1,0],[0.25,1,0],[0.5,1,0],[0.75,1,0],[1,1,0],[0,0.25,0],[0,0.5,0],[0,0.75,0],[1,0.25,0],[1,0.5,0],[1,0.75,0]];outlineConnect=0;fontColor=#232F3E;gradientColor=#F78E04;gradientDirection=north;fillColor=#D05C17;strokeColor=#ffffff;dashed=0;verticalLabelPosition=bottom;verticalAlign=top;align=center;html=1;fontSize=12;fontStyle=0;aspect=fixed;shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.ecr;"
fi

# VPC
if [ $1 = "aws_vpc" ] ; then
    style="points=[[0,0],[0.25,0],[0.5,0],[0.75,0],[1,0],[1,0.25],[1,0.5],[1,0.75],[1,1],[0.75,1],[0.5,1],[0.25,1],[0,1],[0,0.75],[0,0.5],[0,0.25]];outlineConnect=0;gradientColor=none;html=1;whiteSpace=wrap;fontSize=12;fontStyle=0;shape=mxgraph.aws4.group;grIcon=mxgraph.aws4.group_vpc;strokeColor=#248814;fillColor=none;verticalAlign=top;align=left;spacingLeft=30;fontColor=#AAB7B8;dashed=0;"
fi

# VPC_Endpoints
if [ $1 = "aws_vpc_endpoint" ] ; then
    style="outlineConnect=0;fontColor=#232F3E;gradientColor=none;fillColor=#5A30B5;strokeColor=none;dashed=0;verticalLabelPosition=bottom;verticalAlign=top;align=center;html=1;fontSize=12;fontStyle=0;aspect=fixed;pointerEvents=1;shape=mxgraph.aws4.endpoints;"
fi

# vpc_peering_connection
if [ $1 = "aws_vpc_peering_connection" ] ; then
    style="outlineConnect=0;fontColor=#232F3E;gradientColor=none;fillColor=#5A30B5;strokeColor=none;dashed=0;verticalLabelPosition=bottom;verticalAlign=top;align=center;html=1;fontSize=12;fontStyle=0;aspect=fixed;pointerEvents=1;shape=mxgraph.aws4.peering;"
fi

# internet_gateway
if [ $1 = "aws_internet_gateway" ] ; then
    style="outlineConnect=0;fontColor=#232F3E;gradientColor=none;fillColor=#5A30B5;strokeColor=none;dashed=0;verticalLabelPosition=bottom;verticalAlign=top;align=center;html=1;fontSize=12;fontStyle=0;aspect=fixed;pointerEvents=1;shape=mxgraph.aws4.internet_gateway;"
fi

# subnet
if [ $1 = "aws_subnet" ] ; then
    # public
    style="points=[[0,0],[0.25,0],[0.5,0],[0.75,0],[1,0],[1,0.25],[1,0.5],[1,0.75],[1,1],[0.75,1],[0.5,1],[0.25,1],[0,1],[0,0.75],[0,0.5],[0,0.25]];outlineConnect=0;gradientColor=none;html=1;whiteSpace=wrap;fontSize=12;fontStyle=0;shape=mxgraph.aws4.group;grIcon=mxgraph.aws4.group_security_group;grStroke=0;strokeColor=#147EBA;fillColor=#E9F3E6;verticalAlign=top;align=left;spacingLeft=30;fontColor=#248814;dashed=0;"
fi