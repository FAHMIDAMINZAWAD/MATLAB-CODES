clc 
close all
clear all

g=input('Enter your function: ','s');
f=str2func(g);
h=input('Step size: ');
x=input('Enter point of approx: ');

fd=(f(x+h)-f(x))/h
bd=(f(x)-f(x-h))/h
cd=(f(x+h)-f(x-h))/2*h
