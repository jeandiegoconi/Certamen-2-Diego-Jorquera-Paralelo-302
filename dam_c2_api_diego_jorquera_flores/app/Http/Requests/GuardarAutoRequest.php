<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class GuardarAutoRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, mixed>
     */
    public function rules()
    {
        return [
            'vin' => 'required|numeric|unique:autos,vin|digits:5|gt:0',
            'marca' => 'required|string',
            'modelo' => 'required|string',
            'año' => 'required|numeric|between:1990,2022',
            'precio' => 'required|numeric|min:1',
            'deleted_at' => 'nullable|date'
        ];
    }
}
