<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Health extends Model
{
    protected $fillable = [
        "usualVet",
        "vetClinic",
        "vaccinated",
        "internalDeworming",
        "externalDeworming",
        "knownDiseases",
        "allergies",
        "heartProblems",
        "respiratoryProblems",
        "jointProblems",
        "skinProblems",
        "earProblems",
        "sightProblems",
        "deaf",
        "blind",
        "medicalRestrictions",
    ];

    protected $casts = [
        "vaccinated" => "boolean",
        "internalDeworming" => "boolean",
        "externalDeworming" => "boolean",
        "heartProblems" => "boolean",
        "respiratoryProblems" => "boolean",
        "jointProblems" => "boolean",
        "skinProblems" => "boolean",
        "earProblems" => "boolean",
        "sightProblems" => "boolean",
        "deaf" => "boolean",
        "blind" => "boolean",
    ];
}
