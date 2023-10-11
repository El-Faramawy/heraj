<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('product_replies', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('comment_id')->nullable();
            $table->foreign('comment_id')->on('product_comments')->references('id')->onDelete('cascade');
            $table->string('reply')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('product_replies');
    }
};
