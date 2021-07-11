%El mágico mundo del ángel gris es habitado personajes extraños y diversos:

%Jorge, que es un poeta y vive en el barrio de Flores
%Manuel, que es un polígrafo, y vive en Flores también
%Bernardo, que es un tahur de apodo "ruso" y también vive en Flores
%El Diablo, que vive en Villa Crespo
%Confeccionar una base de conocimiento que permita responder la pregunta viveEn/2: nos permite saber si alguien vive en un cierto barrio. Ejemplo:

%? viveEn(jorge, flores).
%yes

%Además, esta base de conocimiento debe permitirnos saber a qué se dedica alguien. Ejemplo:

%? poeta(elDiablo).
%no

% Jorge
poeta(jorge).
viveEn(jorge, flores).

% Manuel
poligrafo(manuel).
viveEn(manuel, flores).

% Bernardo
tahur(bernardo, ruso).
viveEn(bernardo, flores).

% Diablo
viveEn(elDiablo, villaCrespo).
