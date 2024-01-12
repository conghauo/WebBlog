<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Image;
use Symfony\Component\HttpFoundation\Response;

class ImageController extends Controller
{
    public function updateCredit(Request $request)
    {
       $this->validate($request, [
            'json' => 'required'
        ]);
       $pathStore = $request->get('pathStore');
       $save_path = public_path("files")."/Credits.json";      
       if (!str_contains(realpath($save_path),'/public/'))
       {
            return response("You are not permitted to access this resource",Response::HTTP_FORBIDDEN );
       }
       $data =json_encode($request->get('json'));    
       $obj = json_decode($data);
       $obj =  json_decode($obj);
       if (!(json_last_error() === JSON_ERROR_NONE))
       { 
	 return response("json must be json text",403);
       }
      
       if(!(is_array($obj->credits)))
	      return response("json must be json text",403);
      $myfile = fopen($save_path, "w+") or die("Unable to open file!");
       fwrite($myfile , json_encode($obj));
       fclose($myfile);
       return response()->json(['path'=>"/files/Credits.json"] , Response::HTTP_CREATED);
    }
    //
    public function imageStore(Request $request)
    {
        $this->validate($request, [
            'image' => 'required|image|mimes:jpg,png,jpeg,gif,svg|max:5120',
	    'pathStore' => 'required'
	]);
	$pathStore = $request->get('pathStore');
	$file = $request->file('image');
	$name = time().rand(1,100).'.'.$file->extension();
	$image_path = public_path($pathStore);
	if (!str_contains(realpath($image_path),'/public/'))
	{
	    return response("You are not permitted to access this resource",Response::HTTP_FORBIDDEN );
	}
	$request->file('image')->move(public_path($pathStore), $name);  
	$json= json_decode('{"files":[]}');
	
	foreach(glob($image_path.'/*.*') as $fileName) {
		$extension = pathinfo($fileName, PATHINFO_EXTENSION);
		$imgExtArr = ['jpg', 'jpeg', 'png'];
		if (!(in_array($extension, $imgExtArr)))
		{
		   continue;
		}	
		array_push($json->files,basename($fileName)); 
	}
	$myfile = fopen($image_path."/listFiles.json", "w+") or die("Unable to open file!");
	fwrite($myfile , json_encode($json));
	fclose($myfile);
	$pathSave = $pathStore.$name;
        $data = Image::create([
            'image' => $pathSave,
        ]);

        return response($data, Response::HTTP_CREATED);
 }
 public function removeImage(Request $request)
 {
        $this->validate($request, [
            'pathImage' => 'required',
	]);
	$pathImage = $request->get('pathImage');
	$extension = pathinfo($pathImage, PATHINFO_EXTENSION);
	$imgExtArr = ['jpg', 'jpeg', 'png'];
	$fullPath =  public_path('/').$pathImage ;
	if (!str_contains(realpath($fullPath),'/public/'))
	{
	return response("You are not permitted to access this resource",Response::HTTP_FORBIDDEN );
	}
	if (!file_exists($fullPath) || !(in_array($extension, $imgExtArr)) )
	{
	   return response("You are not permitted to access this resource",Response::HTTP_FORBIDDEN );
	}
	if (!unlink($fullPath))
	   return response("File cannot be deleted due to an error", 500);
	$json= json_decode('{"files":[]}');
	$image_path = pathinfo($fullPath,  PATHINFO_DIRNAME);
        foreach(glob($image_path.'/*.*') as $fileName) {
                $extension = pathinfo($fileName, PATHINFO_EXTENSION);
                $imgExtArr = ['jpg', 'jpeg', 'png'];
                if (!(in_array($extension, $imgExtArr)))
                {
                   continue;
                }
                array_push($json->files,basename($fileName));
        }
        $myfile = fopen($image_path."/listFiles.json", "w+") or die("Unable to open file!");
        fwrite($myfile , json_encode($json));
        fclose($myfile);

	
	
	return response("File has been deleted", Response::HTTP_OK);
 }	
}
