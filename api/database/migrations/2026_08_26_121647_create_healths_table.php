<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create("healths", function (Blueprint $table) {
            $table->id();
            $table->timestamps();
            $table->string("usualVet")->nullable();
            $table->string("vetClinic")->nullable();
            $table->boolean("vaccinated");
            $table->boolean("internalDeworming");
            $table->boolean("externalDeworming");
            $table->string("knownDiseases")->nullable();
            $table->string("allergies")->nullable();
            $table->boolean("heartProblems");
            $table->boolean("respiratoryProblems");
            $table->boolean("jointProblems");
            $table->boolean("skinProblems");
            $table->boolean("earProblems");
            $table->boolean("sightProblems");
            $table->boolean("deaf");
            $table->boolean("blind");
            $table->string("medicalRestrictions")->nullable();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists("healths");
    }
};
