<?php

namespace App\Http\Controllers;

use App\Models\Tarea;
use App\Models\Categoria;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class TareaController extends Controller {
    // Método para mostrar la lista de tareas con filtrado avanzado y paginación
    public function index(Request $request) {
        $query = Tarea::query();

        if ($request->has('descripcion') && !empty($request->input('descripcion'))) {
            $query->where('descripcion', 'like', '%' . $request->input('descripcion') . '%');
        }

        if ($request->has('categoria_id') && !empty($request->input('categoria_id'))) {
            $query->where('categoria_id', $request->input('categoria_id'));
        }

        if ($request->has('completada') && !is_null($request->input('completada'))) {
            $query->where('completada', $request->input('completada'));
        }

        $tareas = $query->where('user_id', Auth::id())->paginate(5); // Aquí añadimos paginación
        $categorias = Categoria::all();

        return view('tareas.index', compact('tareas', 'categorias'));
    }

    // Método para almacenar una nueva tarea
    public function store(Request $request) {
        $request->validate([
            'descripcion' => 'required',
            'categoria_id' => 'nullable|exists:categorias,id',
        ]);
        Auth::user()->tareas()->create($request->all());
        return redirect()->route('tareas.index');
    }

    // Método para mostrar el formulario de edición de una tarea
    public function edit(Tarea $tarea) {
        $categorias = Categoria::all();
        return view('tareas.edit', compact('tarea', 'categorias'));
    }

    // Método para actualizar una tarea existente
    public function update(Request $request, Tarea $tarea) {
        $request->validate([
            'descripcion' => 'required',
            'categoria_id' => 'nullable|exists:categorias,id',
        ]);

        $tarea->update($request->all());
        return redirect()->route('tareas.index')->with('success', 'Tarea actualizada con éxito.');
    }

    // Método para cambiar el estado de completado de una tarea
    public function toggle(Tarea $tarea) {
        $tarea->update(['completada' => !$tarea->completada]);
        return redirect()->route('tareas.index');
    }

    // Método para eliminar una tarea existente
    public function destroy(Tarea $tarea) {
        $tarea->delete();
        return redirect()->route('tareas.index');
    }
}
