% function G = gauss1(M)
%
% Pas Gauss-eliminatie toe op een uitgebreide matrix M = [A | b].
%
% Input:
%   M               de uitgebreide matrix van het stelsel, matrix [n x (n+1)]
%
% Output:
%   G               de matrix M na Gauss-eliminatie, de laatste extra kolom
%                   geeft de rij-permutaties weer, G = [A | b | p], 
%                   matrix [n x (n+2)]
%
% Voorbeeld:
%   [M, x] = genstelsel(6)
%   G1 = gauss1(M)
%   y1 = asubst(G1)

function G = gauss1(M)

n = size(M, 1);
G = [M, [1:n]'];    % extra kolom met rij nummers om permutaties bij te houden

% [Cursus] Algoritme 3.2: Terugbrengen tot boventrapeziumvorm (met
%                         rijverwisselingen)
for i=1:n

    % zoek de spilindex
    j = indexspilrij(G,i);

    % wissel rij i met rij j
    G = wisselrij(G, i, j);

    % spilelement is nu G(i, i)
    G(i, i); % haal de ; weg als je het wil printen

    % we gaan nu zogezegd de elementen onder G(i, i) gelijk aan 0 maken
    % door elementaire rij operaties van de vorm:
    %   trek alpha keer rij i af van rij j met alpha = G(j, i) / G(i, i)
    % we hebben echter alleen nog de bovendriehoek nodig en passen dus
    % enkel het niet 0 gedeelte van de rij j aan
    for j=i+1:n
        G(j, i) = G(j, i) / G(i, i);
        for l=i+1:n+1
            G(j, l) = G(j, l) - G(j, i) * G(i, l);
        end;
    end;
end;

return;


%%%%%
% function G = wisselrij(G, i, j)
%
% Wissel rij i met rij j in de matrix G.
function G = wisselrij(G, i, j)
  hulp = G(i, :);
  G(i, :) = G(j, :);
  G(j, :) = hulp;


%%%%%
% function j = indexspilrij(G, i)
%
% Zoek de index van de spilrij
function j = indexspilrij(G, i)
  % zoek een goede spil: het eerste niet 0 element in kolom i
  % de rij van de spil is j, de absolute waarde van de spil is absspil
  [j, dummy, absspil] = find(abs(G(i:end, i))); j = j+i-1;
  if isempty(absspil)
     error('A is rang deficient, stelsel moet volle rang hebben');
  end;
  j = j(1); % find geeft de niet 0 indices, we hebben enkel de eerste nodig
