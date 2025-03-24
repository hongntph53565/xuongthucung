<?php
//BaseModel dùng để kết nối đến Cơ sở dữ liệu
class BaseModel
{
    //Thuộc tính lưu trữ đối tượng kết nối
    public $conn = null;

    public function __construct()
    {
        try {
            $this->conn = new PDO("mysql:host=localhost; dbname=da1wd19314; charset=utf8; port=3306", "root", "");
        } catch (PDOException $e) {
            echo "Lỗi kết nối CSDL: " . $e->getMessage();
        }
    }
}
