<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class CheckApiPassword
{
    /**
     * Handle an incoming request.
     *
     * @param  Closure(Request): (Response)  $next
     */
    public function handle(Request $request, Closure $next): Response
    {
        $providedPassword = $request->header("X-API-Password");

        $correctPassword = config("app.api_secret_password");

        if (!$providedPassword || $providedPassword !== $correctPassword) {
            return response()->json(
                [
                    "success" => false,
                    "message" => "Palavra-passe inválida.",
                ],
                401,
            );
        }

        return $next($request);
    }
}
