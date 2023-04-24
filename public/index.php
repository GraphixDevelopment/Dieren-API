<?php

require __DIR__ . '/vendor/autoload.php'; // We gebruiken iets genaamd composer om de API te laten werken, deze regel zorgt er voor dat die composer packages geladen worden.

// In de 2 regels hieronder laten we aan onze code weten dat hij de package "Slim" moet gebruiken, dit hebben we nodig voor onze API.
use Slim\Factory\AppFactory; 
use Slim\Middleware\ErrorMiddleware;

ini_set('display_errors', false); // Deze regel zorgt er voor dat als er een error is dat je dit niet op de website / api te zien krijgt. Dit kan je naar 'true' zetten als je dat wel graag wil.

$app = AppFactory::create(); // Hier maken wij onze API aan.

// De regels hier onder zijn voor het goedzetten van wat standaard instellingen, hier hoef je over het algemeen niet aan te zitten.
$errorMiddleware = new ErrorMiddleware(
    $app->getCallableResolver(),
    $app->getResponseFactory(),
    true,
    false,
    false
);

$app->add($errorMiddleware);

$host = 'localhost'; // Dit is de naam van jouw host, vaak is dit: localhost.
$dbname = 'dierenDatabase'; // Dit is de naam van jouw database, in mijn geval is dat graphixapi, hier zet je de naam van jouw database neer.
$user = 'root'; // Dit is de user van jouw database, dit is bijna altijd root, dit kan je dus laten staan.
$password = ''; // Dit is het password van jouw database, als je op localhost zit heb je nooit een password.

$pdo = new PDO("mysql:host=$host;dbname=$dbname;charset=utf8", $user, $password); // Bij deze regel verbinden we met de database.

// Hieronder gaan we checken of je in je url een token hebt, dat ziet er zo uit: http://localhost:8000/api/dieren?token=testToken (Dit is een voorbeeld)
if (isset($_GET['token'])) {

    $token = $_GET['token']; // Als er een token in de url staat dan gaan wij die token uit die url filteren.

    //Bij deze 2 regels hier onder gaan we de token uit onze database pakken. Hij filtert of hij een token in de database kan vinden die we in de URL hebben staan.
    $query = $pdo->prepare('SELECT * FROM auth_tokens WHERE token = :token');
    $query->execute(array(':token' => $token));

    // Hier checkt onze code of er in de databas een token is gevonden met die URL
    if ($query->rowCount() > 0) {
        // Als die token gevonden is voert hij de code van onze API uit.

        $app->get('/dieren', function ($request, $response, $args) use ($pdo) {
            // Hier krijgen we alle data uit ons database schema genaamd 'dieren_data'.
            $stmt = $pdo->query('SELECT * FROM dieren_data');
            $data = $stmt->fetchAll(PDO::FETCH_ASSOC);

            // In de 2 regels hier onder verzenden wij de data uit onze database naar onze website, zo krijg je dit op de website te zien.
            $response->getBody()->write(json_encode($data));
            return $response->withHeader('Content-Type', 'application/json');
        });

    } else {
        // Mochten we een verkeerde token ingevuld hebben dan krijgen wij een bericht op ons scherm te zien dat er een onjuiste API token ingevoerd is.
        header('HTTP/1.1 401 Unauthorized');
        header("Content-Type: application/json");
        echo (json_encode(["message" => "Onjuiste API token."]));
        exit();
    }
} else {
    // Stel we hebben helemaal geen API token in onze url gezet krijgen we ook een error dat we de verkeerde / geen API token ingevoerd hebben.
    header('HTTP/1.1 401 Unauthorized');
    header("Content-Type: application/json");
    echo (json_encode(["message" => "Onjuiste API token."]));
    exit();
}

// Hier starten we onze applicatie
$app->run();