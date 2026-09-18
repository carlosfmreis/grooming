<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Behaviour;
use App\Models\Owner;
use App\Models\Pet;
use App\Http\Requests\CreatePetRequest;
use Illuminate\Support\Facades\DB;
use App\Models\Health;
use Illuminate\Support\Facades\Storage;
use Intervention\Image\Laravel\Facades\Image;
use Intervention\Image\Encoders\WebpEncoder;

class AnimalsController extends Controller
{
    public function index()
    {
        return Pet::with(["health", "behaviour", "owner"])
                ->orderBy("updated_at", "desc")
                ->get();
    }

    public function create(CreatePetRequest $request)
    {
        $data = $request->validated();

        if ($request->hasFile("photoFile")) {
            $file = $request->file("photoFile");
            $image = Image::decode($file)->scale(height: 800);
            $encoded = $image->encode(new WebpEncoder(quality: 80));
            $path = "pets/" . uniqid() . ".webp";
            Storage::disk("public")->put($path, $encoded);
            $data["photo"] = $path;
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
