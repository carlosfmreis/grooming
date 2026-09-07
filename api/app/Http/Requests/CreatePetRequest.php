<?php

namespace App\Http\Requests;

use Illuminate\Contracts\Validation\ValidationRule;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;

class CreatePetRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, ValidationRule|array<mixed>|string>
     */
    public function rules(): array
    {
        $ownerRules = [
            "owner" => ["required", "array"],
            "owner.name" => ["required", "string", "max:255"],
            "owner.mainContact" => ["required", "string", "max:255"],
            "owner.secondaryContact" => ["nullable", "string", "max:255"],
            "owner.email" => [
                "nullable",
                "string",
                "max:255",
                Rule::email()->strict(),
                "unique:owners,email",
            ],
            "owner.address" => ["nullable", "string", "max:255"],
            "owner.authorizedPersons" => ["nullable", "string", "max:255"],
        ];

        $rules = [
            "name" => ["required", "string", "max:255"],
            "species" => ["required", "string", "max:255"],
            "breed" => ["required", "string", "max:255"],
            "isNeutered" => ["required", "boolean"],
            "gender" => ["required", "string", "max:255"],
            "color" => ["required", "string", "max:255"],
            "coatType" => ["required", "string", "max:255"],

            "birthDate" => ["nullable", "date", "before_or_equal:today"],
            "eyeColor" => ["nullable", "string", "max:255"],
            "currentWeight" => ["nullable", "numeric"],
            "previousWeight" => ["nullable", "numeric"],
            "microchip" => ["nullable", "string", "max:255"],
            "photo" => [
                "nullable",
                "file",
                "image",
                "mimetypes:image/jpeg,image/png,image/webp,image/heic,image/heif",
                "max:10240",
            ],
            "notes" => ["nullable", "string", "max:2000"],

            "ownerId" => ["nullable", "integer", "exists:owners,id"],

            "health" => ["nullable", "array"],
            "health.usualVet" => ["nullable", "string", "max:255"],
            "health.vetClinic" => ["nullable", "string", "max:255"],
            "health.knownDiseases" => ["nullable", "string", "max:255"],
            "health.allergies" => ["nullable", "string", "max:255"],
            "health.medicalRestrictions" => ["nullable", "string", "max:255"],
            "health.vaccinated" => ["required_with:health", "boolean"],
            "health.internalDeworming" => ["required_with:health", "boolean"],
            "health.externalDeworming" => ["required_with:health", "boolean"],
            "health.heartProblems" => ["required_with:health", "boolean"],
            "health.respiratoryProblems" => ["required_with:health", "boolean"],
            "health.jointProblems" => ["required_with:health", "boolean"],
            "health.skinProblems" => ["required_with:health", "boolean"],
            "health.earProblems" => ["required_with:health", "boolean"],
            "health.sightProblems" => ["required_with:health", "boolean"],
            "health.deaf" => ["required_with:health", "boolean"],
            "health.blind" => ["required_with:health", "boolean"],

            "behaviour" => ["nullable", "array"],
            "behaviour.sociable" => ["required_with:behaviour", "boolean"],
            "behaviour.scared" => ["required_with:behaviour", "boolean"],
            "behaviour.anxious" => ["required_with:behaviour", "boolean"],
            "behaviour.nervous" => ["required_with:behaviour", "boolean"],
            "behaviour.energetic" => ["required_with:behaviour", "boolean"],
            "behaviour.bites" => ["required_with:behaviour", "boolean"],
            "behaviour.growls" => ["required_with:behaviour", "boolean"],
            "behaviour.runs" => ["required_with:behaviour", "boolean"],
            "behaviour.noDryer" => ["required_with:behaviour", "boolean"],
            "behaviour.noMachine" => ["required_with:behaviour", "boolean"],
            "behaviour.noScissors" => ["required_with:behaviour", "boolean"],
            "behaviour.noNailClipper" => ["required_with:behaviour", "boolean"],
            "behaviour.noEarCleaner" => ["required_with:behaviour", "boolean"],
            "behaviour.noBrushing" => ["required_with:behaviour", "boolean"],
            "behaviour.needsMuzzle" => ["required_with:behaviour", "boolean"],
            "behaviour.needsTwoPersons" => [
                "required_with:behaviour",
                "boolean",
            ],
            "behaviour.hasServiceBiteHistory" => [
                "required_with:behaviour",
                "boolean",
            ],
            "behaviour.reactsToOtherAnimals" => [
                "required_with:behaviour",
                "boolean",
            ],
            "behaviour.reactsToMen" => ["required_with:behaviour", "boolean"],
            "behaviour.reactsToWomen" => ["required_with:behaviour", "boolean"],
        ];

        if (!$this->filled("ownerId")) {
            $rules = array_merge($rules, $ownerRules);
        }

        return $rules;
    }
}
