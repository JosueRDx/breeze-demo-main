<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class RenameCompletedToCompletadaInTareasTable extends Migration {
    public function up() {
        Schema::table('tareas', function (Blueprint $table) {
            $table->renameColumn('completed', 'completada');
        });
    }

    public function down() {
        Schema::table('tareas', function (Blueprint $table) {
            $table->renameColumn('completada', 'completed');
        });
    }
}
