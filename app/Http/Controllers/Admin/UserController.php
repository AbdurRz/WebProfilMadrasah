<?php

namespace App\Http\Controllers\Admin;

use App\Models\User;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Http\Request;

class UserController extends CrudController
{
    protected string $model = User::class;
    protected string $route = 'users';
    protected string $title = 'Pengguna CMS';
    protected string $singular = 'Pengguna';
    protected array $searchable = ['name', 'email'];
    protected string $labelField = 'name';

    protected function fields(?Model $item = null): array
    {
        $unique = 'unique:users,email'.($item ? ','.$item->id : '');

        return [
            'name' => ['label' => 'Nama', 'type' => 'text', 'rules' => 'required|string|max:255'],
            'email' => ['label' => 'Email', 'type' => 'email', 'rules' => "required|email|max:255|{$unique}"],
            'role' => ['label' => 'Peran', 'type' => 'select', 'options' => ['admin' => 'Administrator', 'editor' => 'Editor'], 'rules' => 'required|in:admin,editor'],
            'password' => ['label' => 'Kata Sandi', 'type' => 'password', 'rules' => ($item ? 'nullable' : 'required').'|string|min:8', 'help' => $item ? 'Kosongkan jika tidak diubah.' : 'Minimal 8 karakter.'],
            'is_active' => ['label' => 'Akun aktif', 'type' => 'checkbox', 'default' => true],
        ];
    }

    protected function columns(): array
    {
        return ['name' => 'Nama', 'email' => 'Email', 'role' => 'Peran', 'is_active' => 'Aktif', 'last_login_at' => 'Login Terakhir'];
    }

    protected function validated(Request $request, ?Model $item = null): array
    {
        $data = parent::validated($request, $item);
        if (empty($data['password'])) {
            unset($data['password']);
        }
        if ($item && $item->is(auth()->user())) {
            $data['role'] = 'admin';
            $data['is_active'] = true;
        }

        return $data;
    }

    public function destroy(string $id)
    {
        abort_if((int) $id === auth()->id(), 422, 'Tidak dapat menghapus akun sendiri.');

        return parent::destroy($id);
    }
}
