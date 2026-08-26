<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('behaviours', function (Blueprint $table) {
            $table->id();
            $table->timestamps();
            $table->boolean('sociable');
            $table->boolean('scared');
            $table->boolean('anxious');
            $table->boolean('nervous');
            $table->boolean('energetic');
            $table->boolean('bites');
            $table->boolean('growls');
            $table->boolean('runs');
            $table->boolean('noDryer');
            $table->boolean('noMachine');
            $table->boolean('noScissors');
            $table->boolean('noNailClipper');
            $table->boolean('noEarCleaner');
            $table->boolean('noBrushing');
            $table->boolean('needsMuzzle');
            $table->boolean('needsTwoPersons');
            $table->boolean('hasServiceBiteHistory');
            $table->boolean('reactsToOtherAnimals');
            $table->boolean('reactsToMen');
            $table->boolean('reactsToWomen');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('behaviours');
    }
};
