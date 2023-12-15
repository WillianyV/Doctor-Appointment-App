<?php

namespace App\Livewire;

use App\Models\Doctor;
use Illuminate\Support\Facades\Auth;
use Laravel\Jetstream\Http\Livewire\UpdateProfileInformationForm as BaseForm;

class UpdateProfileInformationFormCustomization extends BaseForm
{

    public function mount()
    {
        $user = Auth::user();

        $this->state = array_merge([
            'email' => $user->email,
            'experience' => Doctor::where('doc_id', Auth::user()->id)->first ()->experience,
            'bio_data' => Doctor::where('doc_id', Auth::user()->id)->first ()->bio_data,
            'category' => Doctor::where('doc_id', Auth::user()->id)->first ()->category,
        ], $user->withoutRelations()->toArray());

        // $user = Auth::user()->withoutRelations()->toArray();
        // $user->state['experience'] = Doctor::where('doc_id', Auth::user()->id)->first ()->experience;
        // $user->state['bio_data'] = Doctor::where('doc_id', Auth::user()->id)->first ()->bio_data;
        // $user->state['category'] = Doctor::where('doc_id', Auth::user()->id)->first ()->category;
    }
}
