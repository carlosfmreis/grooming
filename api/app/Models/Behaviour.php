<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Behaviour extends Model
{
    protected $fillable = [
        "sociable",
        "scared",
        "anxious",
        "nervous",
        "energetic",
        "bites",
        "growls",
        "runs",
        "noDryer",
        "noMachine",
        "noScissors",
        "noNailClipper",
        "noEarCleaner",
        "noBrushing",
        "needsMuzzle",
        "needsTwoPersons",
        "hasServiceBiteHistory",
        "reactsToOtherAnimals",
        "reactsToMen",
        "reactsToWomen",
    ];

    protected $casts = [
        "sociable" => "boolean",
        "scared" => "boolean",
        "anxious" => "boolean",
        "nervous" => "boolean",
        "energetic" => "boolean",
        "bites" => "boolean",
        "growls" => "boolean",
        "runs" => "boolean",
        "noDryer" => "boolean",
        "noMachine" => "boolean",
        "noScissors" => "boolean",
        "noNailClipper" => "boolean",
        "noEarCleaner" => "boolean",
        "noBrushing" => "boolean",
        "needsMuzzle" => "boolean",
        "needsTwoPersons" => "boolean",
        "hasServiceBiteHistory" => "boolean",
        "reactsToOtherAnimals" => "boolean",
        "reactsToMen" => "boolean",
        "reactsToWomen" => "boolean",
    ];
}
