<?php

class moviesController {

    public function __construct()
    {
        include('models/moviesModel.php');
    }
    public function create()
    {
        header('Access-Control-Allow-Origin:*');
        header('Content-Type: application/json');
        header('Access-Control-Allow-Method: POST');
        header('Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorisation');
        $requestMethod = $_SERVER["REQUEST_METHOD"];
        if($requestMethod == "POST"){
            $title = $_POST['title'];
            $image = $_POST['image'];
            $date = $_POST['date'];
            $description = $_POST['description'];
            $movies = new movies;
            $movies->Creatmovies($title,$image,$date,$description);
        }else{
            $data = [
            'status' => 405,
            'message' => $requestMethod. 'Method Not Allowed',
            ];
            header("HTTP/1.0 405 Method Not Allowed");
            echo json_encode($data);
        }
    }
    public function getAll()
    {
        header('Access-Control-Allow-Origin:*');
        header('Content-Type: application/json');
        header('Access-Control-Allow-Method: GET');
        header('Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorisation');
        $requestMethod = $_SERVER["REQUEST_METHOD"];
        if($requestMethod == "GET"){
            $movies = new movies;
            $moviessList = $movies->getmovies();
            echo $moviessList;
        }else{
            $data = [
            'status' => 405,
            'message' => $requestMethod. 'Method Not Allowed',
            ];
            header("HTTP/1.0 405 Method Not Allowed");
            echo json_encode($data);
        }
    }
    public function getSingle()
    {
        header('Access-Control-Allow-Origin:*');
        header('Content-Type: application/json');
        header('Access-Control-Allow-Method: POST');
        header('Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorisation');
        $requestMethod = $_SERVER["REQUEST_METHOD"];
        if($requestMethod == "POST"){
            $id = $_POST['id'];
            $movies = new movies;
            $moviessList = $movies->getSingle($id);
            echo $moviessList;
        }else{
            $data = [
            'status' => 405,
            'message' => $requestMethod. 'Method Not Allowed',
            ];
            header("HTTP/1.0 405 Method Not Allowed");
            echo json_encode($data);
        }
    }
    public function update()
    {
        header('Access-Control-Allow-Origin:*');
        header('Content-Type: application/json');
        header('Access-Control-Allow-Method: POST');
        header('Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorisation');
        $requestMethod = $_SERVER["REQUEST_METHOD"];
        if($requestMethod == "POST"){
            $id = $_POST['id'];
            $date = isset($_POST["date"]) ? $_POST["date"] : null;
            $movies = new movies;
            $movies->updatemovies($id,$date);
            echo " movies updated";
        }else{
            $data = [
            'status' => 405,
            'message' => $requestMethod. 'Method Not Allowed',
            ];
            header("HTTP/1.0 405 Method Not Allowed");
            echo json_encode($data);
        }
    }
    public function delete()
    {
        header('Access-Control-Allow-Origin:*');
        header('Content-Type: application/json');
        header('Access-Control-Allow-Method: POST');
        header('Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorisation');
        $requestMethod = $_SERVER["REQUEST_METHOD"];
        if($requestMethod == "POST"){
            $id = $_POST['id'];
            $movies = new movies;
            $movies->deletemovies($id);
            echo " movies deleted in id= ".$id;
        }else{
            $data = [
            'status' => 405,
            'message' => $requestMethod. 'Method Not Allowed',
            ];
            header("HTTP/1.0 405 Method Not Allowed");
            echo json_encode($data);
        }
    }
}        