<?php

/**
 * lớp Product dùng để thao tác dữ liệu của bảng products
 * 
 */
class Product extends BaseModel
{
    /**
     * hàm all để lấy ra tất cả sản phẩm
     */
    public function all()
    {
        $sql = "SELECT p.*, cate_name FROM products p JOIN categories c ON p.category_id=c.id";
        $stmt = $this->conn->prepare($sql);
        $stmt->execute();
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    /**
     * Hàm lấy ra các sản phẩm là thú cưng
     * được xác định bởi thuộc tính type=1
     */

    public function listProductInPet()
    {
        $sql = "SELECT p.*, cate_name FROM products p 
        JOIN categories c 
        ON p.category_id=c.id WHERE type=1 LIMIT 4";
        $stmt = $this->conn->prepare($sql);
        $stmt->execute();
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    /**
     * Hàm lấy ra các sản phẩm không phải là thú cưng
     * được xác định bởi type=0
     */
    public function listProductOtherPet(){
        $sql = "SELECT p.*, cate_name FROM products p 
        JOIN categories c 
        ON p.category_id=c.id WHERE type=0 LIMIT 8";
        $stmt = $this->conn->prepare($sql);
        $stmt->execute();
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    /**
     * Hàm lấy sản phẩm theo danh mục
     * $id: mã danh mục
     */

    public function listProductInCategory($id)
    {
        $sql = "SELECT p.*, cate_name FROM products p 
        JOIN categories c 
        ON p.category_id=c.id WHERE c.id=:id";
        $stmt = $this->conn->prepare($sql);
        $stmt->execute(['id' => $id]);
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    /**
     * function create: thêm dữ liệu sản phẩm
     * @data: mảng dữ liệu cần thêm
     */
    public function create($data)
    {
        $sql = "INSERT INTO products(name, image, price, quantity, description, status, category_id) VALUES(:name, :image, :price, :quantity, :description, :status, :category_id)";

        $stmt = $this->conn->prepare($sql);
        $stmt->execute($data);
    }
    /**
     * function update: cập nhật dữ liệu
     * @id: mã sản phẩm cần cập nhật
     * @data: mảng dữ liệu cần cập nhật
     */
    public function update($id, $data)
    {
        $sql = "UPDATE products SET name=:name, image=:image, price=:price, quantity=:quantity, description=:description, status=:status, category_id=:category_id WHERE id=:id";

        $stmt = $this->conn->prepare($sql);
        //Thêm id và mảngr data
        $data['id'] = $id;
        $stmt->execute($data);
    }
    /**
     * function delete: xóa bản ghi
     * @id: mã sản phẩm cần xóa
     */
    public function delete($id)
    {
        try {
            $sql = "DELETE FROM products WHERE id=:id";
            $stmt = $this->conn->prepare($sql);
            $stmt->execute(['id' => $id]);
            return true;
        } catch (PDOException $e) {
            return false;
        }
    }
    /**
     * function find: lấy ra 1 bản ghi theo id
     * @id: mã sản phẩm cần tìm
     */
    public function find($id)
    {
        $sql = "SELECT * FROM products WHERE id=:id";
        $stmt = $this->conn->prepare($sql);
        $stmt->execute(['id' => $id]);
        return $stmt->fetch(PDO::FETCH_ASSOC);
    }
}
