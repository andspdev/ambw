<?php

include 'connect.php';

header('Content-Type: application/json');

$act = isset($_GET['act']) ? $_GET['act'] : '';

switch($act)
{
    case 'load_workouts':
        $workouts = "SELECT 
            wk.*,
            (
                SELECT COUNT(workout_id) FROM `workout_excercies`
                WHERE workout_id = wk.id
            ) `total_excerices`,
            (
                SELECT SUM(menit) FROM `workout_excercies`
                WHERE workout_id = wk.id
            ) `minutes`
        FROM workouts wk ORDER BY nama_workout";
        $workouts = $pdo->prepare($workouts);
        $workouts->execute();

        $arr = [];
        while($data = $workouts->fetch(PDO::FETCH_OBJ))
        {
            $arr[] = [
                'id' => $data->id,
                'nama' => $data->nama_workout,
                'total_excercies' => $data->total_excerices,
                'total_menit' => $data->minutes,
                'images' => './assets/images/workouts/'.str_replace(' ',  '-', strtolower($data->nama_workout)).'/'.$data->thumbnail
            ];
        }

        echo json_encode($arr);
        break;

    case 'view_workout':
        $id = $_GET['id'];

        $workouts = "SELECT 
            wk.nama_workout,
            (
                SELECT SUM(menit) FROM `workout_excercies`
                WHERE workout_id = wk.id
            ) `minutes`,
            (
                SELECT COUNT(workout_id) FROM `workout_excercies`
                WHERE workout_id = wk.id
            ) `total_excerices`
        FROM 
            workouts wk 
        WHERE wk.id = ?";
        $workouts = $pdo->prepare($workouts);
        $workouts->execute([ $id ]);
        $workouts = $workouts->fetch(PDO::FETCH_OBJ);

        $query = "SELECT we.id, wk.nama_workout, we.nama_workout workout, we.thumbnail, we.menit, we.deskripsi FROM `workout_excercies` we INNER JOIN workouts wk ON workout_id = wk.id WHERE workout_id = ?";
        $query = $pdo->prepare($query);
        $query->execute([ $id ]);

        $arr = [];
        while($data = $query->fetch((PDO::FETCH_OBJ)))
            $arr[] = [
                'id' =>  $data->id,
                'nama' => $data->workout,
                'thumbnail' =>  './assets/images/workouts/'.str_replace(' ', '-', strtolower($data->nama_workout)).'/'.$data->thumbnail,
                'menit' => $data->menit,
                'deskripsi' => $data->deskripsi
            ];

        echo json_encode([
            'title' => $workouts->nama_workout,
            'minutes' => $workouts->minutes,
            'total_exercises' => $workouts->total_excerices,
            'workout_id' => $id,
            'exercises' => $arr,
        ]);
        break;
}
