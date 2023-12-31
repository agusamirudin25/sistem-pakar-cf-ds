<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class AuthController extends Controller
{
    public function index()
    {
        if ($user = Auth::user()) {
            if ($user->level == 'admin') {
                return redirect()->intended('admin');
            } elseif ($user->level == 'editor') {
                return redirect()->intended('editor');
            }
        }
        return view('login');
    }

    public function proses_login(Request $request)
    {
        request()->validate([
            'email' => 'required',
            'password' => 'required'
        ]);

        $kredensil = $request->only('email', 'password');
        if (Auth::attempt($kredensil)) {
            $user = Auth::user();
            if ($user->role == 'admin') {
                return redirect()->intended('/');
            } elseif ($user->role == 'pakar') {
                return redirect()->intended('/');
            } elseif ($user->role == 'guest') {
                return redirect()->intended('/diagnosis');
            }

            return redirect('login')
                ->withInput()->withErrors(['login_gagal' => 'Role Tidak Valid']);
        }
        return redirect('login')
            ->withInput()
            ->withErrors(['login_gagal', 'Kredensial Ini Tidak Cocok Dengan Catatan Kami']);
    }
    public function logout(Request $request)
    {
        $request->session()->flush();
        Auth::logout();
        return redirect('login');
    }
}
