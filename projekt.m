figure;
gx = geoaxes; %tengelytipus foldrajzi koordinatakhoz
geobasemap(gx, 'satellite');

disp('Válaszd ki a kiinduló és a célállomást a térképen (kattintással)');
[hossz, szel] = ginput(2);  
hold on
geoplot(hossz, szel, 'r.', MarkerSize=30);
szelMargin = 0.1 * abs(szel(2) - szel(1)); %margok kiszamolasa
hosszMargin = 0.1 * abs(hossz(2) - hossz(1));
%kicsit nagyobb terkep mint amibe a 2 pont belefer
geolimits(gx, [min(hossz) - hosszMargin, max(hossz) + hosszMargin], [min(szel) - szelMargin, max(szel) + szelMargin]);

%ket pont kozotti egyenesen 100 pont generalasa
pontokSzama = 100;
szelGorbe = linspace(szel(1), szel(2), pontokSzama);
hosszGorbe = linspace(hossz(1), hossz(2), pontokSzama);

%ket pont kozotti tavolsag a föld sugarát hasznalva, és az alakjat
%figyelembe véve
tavolsagKm = distance(szel(1), hossz(1), szel(2), hossz(2), referenceSphere('Earth')) / 1000; 
sebessegKmOra = 800;
idoOra = tavolsagKm / sebessegKmOra;

% Kiindulási idő
elapsedTime = 0; %eltelt ido
teljesidoSec = idoOra * 3600;
deltaT = teljesidoSec / pontokSzama; %lepesek kozotti ido

szovegDoboz = annotation('textbox', [0.4, 0.71, 0.5, 0.2], 'String', '', ...
    'EdgeColor', 'none', 'FontSize', 10, 'Color', 'w', 'BackgroundColor', 'k');

repuloIkon = '♦';  
for i = 1:pontokSzama
    %pozíció frissítése
    plot(gx, hosszGorbe(i), szelGorbe(i), 'r--');
    %text objektumkent hozzuk letre a repcsi ikonjat
    text(gx, hosszGorbe(i), szelGorbe(i), repuloIkon, 'Color', 'r', 'FontSize', 12, 'HorizontalAlignment', 'center');
    % Mtávolság számítása
    maradekTavolsag = tavolsagKm * (1 - (i / pontokSzama));
    elapsedTime = elapsedTime + deltaT / 3600; %eltelt ido frissitese pontonkent
    % Info frissítése
    szoveg = sprintf(['Átlagos repülő sebessége: %.2f km/h\n' ...
        'Teljes távolság:%.2f km\n' ...
        'Hátralévő távolság: %.2f km\n' ...
        'Eltelt idő: %.2f óra'], ...
        sebessegKmOra, tavolsagKm, maradekTavolsag, elapsedTime);
    set(szovegDoboz, 'String', szoveg);
    pause(0.05);
    if i > 1 %elozo pozicio torlese, ha mar elindult(elsonel nincs elozo)
        plot(gx, hosszGorbe(i-1), szelGorbe(i-1), 'w*');% * rajzolas az elozo poziciora
        delete(findall(gcf, 'type', 'text')); %z aktuális ábrán (gcf) található összes text típusú objektum torlese
    end
end

hold off;
