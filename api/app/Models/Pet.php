<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class Pet extends Model
{
    protected $fillable = [
        "name",
        "species",
        "breed",
        "gender",
        "isNeutered",
        "birthDate",
        "color",
        "coatType",
        "eyeColor",
        "currentWeight",
        "previousWeight",
        "microchip",
        "photo",
        "notes",
        "ownerId",
        "healthId",
        "behaviourId",
    ];

    protected $casts = [
        "isNeutered" => "boolean",
        "birthDate" => "date",
    ];

    /**
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo<\App\Models\Owner, \App\Models\Pet>
     */
    public function owner(): BelongsTo
    {
        return $this->belongsTo(Owner::class, "ownerId");
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo<\App\Models\Owner, \App\Models\Pet>
     */
    public function health(): BelongsTo
    {
        return $this->belongsTo(Health::class, "healthId");
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo<\App\Models\Owner, \App\Models\Pet>
     */
    public function behaviour(): BelongsTo
    {
        return $this->belongsTo(Behaviour::class, "behaviourId");
    }
}
