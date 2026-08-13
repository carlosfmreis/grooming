<?php
use Libsql\Laravel\LibsqlConnection;
use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;
use Slim\Factory\AppFactory;
use Illuminate\Database\Capsule\Manager as Capsule;

require __DIR__ . "/../vendor/autoload.php";

$app = AppFactory::create();

$capsule = new Capsule();

$capsule->getDatabaseManager()->extend("libsql", function ($config, $name) {
  $config["name"] = $name;
  return new LibsqlConnection($config);
});

$capsule->addConnection([
  "driver" => "libsql",
  "url" => $_ENV["TURSO_DATABASE_URL"],
  "token" => $_ENV["TURSO_AUTH_TOKEN"],
  "database" => ":memory:",
  "prefix" => "",
]);

$capsule->setAsGlobal();
$capsule->bootEloquent();

$app->get("/hello/{name}", function (
  Request $request,
  Response $response,
  array $args,
) {
  $name = $args["name"];
  $response->getBody()->write("Hello, $name");
  return $response;
});

$app->run();
