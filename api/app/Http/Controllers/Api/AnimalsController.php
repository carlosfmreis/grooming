<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Behaviour;
use App\Models\Owner;
use App\Models\Pet;
use App\Http\Requests\CreatePetRequest;
use Illuminate\Support\Facades\DB;
use App\Models\Health;

class AnimalsController extends Controller
{
    public function index()
    {
        //
    }

    public function create(CreatePetRequest $request)
    {
        $data = $request->validated();

        if ($request->hasFile("photo")) {
            $data["photo"] = $request->file("photo")->store("pets", "public");
        }

        $pet = DB::transaction(function () use ($data) {
            $healthData = $data["health"] ?? null;
            unset($data["health"]);
            if (!empty($healthData)) {
                $health = Health::create($healthData);
                $data["healthId"] = $health->id;
            }

            $behaviourData = $data["behaviour"] ?? null;
            unset($data["behaviour"]);
            if (!empty($behaviourData)) {
                $behaviour = Behaviour::create($behaviourData);
                $data["behaviourId"] = $behaviour->id;
            }

            $ownerData = $data["owner"] ?? null;
            unset($data["owner"]);
            if (!isset($data["ownerId"]) && !empty($ownerData)) {
                $owner = Owner::create($ownerData);
                $data["ownerId"] = $owner->id;
            }

            return Pet::create($data)->load(["health", "behaviour", "owner"]);
        });
        return response()->json($pet, 201);
    }
}
