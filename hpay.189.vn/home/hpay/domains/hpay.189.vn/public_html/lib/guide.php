<?php
if (!defined("qaz_wsxedc_qazxc0FD_123K")){		
		die("<a href='../index.php'>Home pages</a>");
}
$intro_detail 	= array();
$sql = new db_sql();
$sql->db_connect();
$sql->db_select();
if(isset($_GET["id"]) && $HTTP_GET_VARS["Webdesign"] == "guide"){
	$id = isset($_GET["id"]) && is_numeric($_GET["id"]) ? $_GET["id"] : 0;
	$select_query = "SELECT title, content FROM ".DB_PREFIX."intro WHERE id_intro = $id";
	$sql->query($select_query);							
	if($row = $sql->fetch_array()){
		$title 				= $row["title"];
		$intro_detail["title"] 		= $row["title"];
		$intro_detail["content"] 	= $row["content"];
	}
	$title = array(	"intro" => "Giới thiệu về chúng tôi",
 	);
	$sql->close();
}

function publish(){
	global $intro_detail;	
                            if(count($intro_detail) > 0){
                               echo '<div class="title"><h1>'.$intro_detail["title"] .'</h1></div>
                                       <div class="content">
                                           <div class="tin_view">
                                                           '.  $intro_detail["content"] .'
                                             </div>
                                           <div class="clear"></div>';
                                            echo '
                                      </div>';

                         }else{
                                echo '<div class="content">
                                           Đang cập nhật dữ liệu
                                   </div>';
                           }   
        }

?>