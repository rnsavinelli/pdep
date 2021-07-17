%Entremos en calor: queremos saber si un individuo es padre de otro.

%Para eso vamos a confeccionar una base de conocimientos que contenga la siguiente información:

%Homero es el padre de Bart, Lisa y Maggie
%Abraham es padre de Homero y Herbert
%Escribí la base de conocimiento anterior, de forma que pueda consultarse de la siguiente forma:

%? padre(homero, lisa).
%yes

padre(homero, bart).
padre(homero, lisa).
padre(homero, maggie).

padre(abraham, homero).
padre(abraham, hebert).
