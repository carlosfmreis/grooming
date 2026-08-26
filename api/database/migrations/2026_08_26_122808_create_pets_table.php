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
        Schema::create("pets", function (Blueprint $table) {
            $table->id();
            $table->timestamps();
            $table->string("name");
            $table->string("species");
            $table->string("breed");
            $table->string("gender");
            $table->boolean("isNeutered");
            $table->date("birthDate")->nullable();
            $table->string("color");
            $table->string("coatType");
            $table->string("eyeColor")->nullable();
            $table->string("currentWeight")->nullable();
            $table->string("previousWeight")->nullable();
            $table->string("microchip")->nullable();
            $table->string("photo")->nullable();
            $table->text("notes")->nullable();
            $table->unsignedBigInteger("ownerId");
            $table->foreign("ownerId")->references("id")->on("owners");
            $table->unsignedBigInteger("healthId");
            $table->foreign("healthId")->references("id")->on("healths");
            $table->unsignedBigInteger("behaviourId");
            $table->foreign("behaviourId")->references("id")->on("behaviours");
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists("pets");
    }
};
