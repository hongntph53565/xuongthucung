<?php
//Controller điều khiển phần product trong admin
class AdminProductController
{
    //Hàm hiển thị danh sách sản phẩm
    public function index()
    {
        $products = (new Product)->all();

        //Lấy thông báo từ session
        $message = $_SESSION['message'] ?? '';
        //Hủy session
        unset($_SESSION['message']);
        return view('admin.products.list', compact('products', 'message'));
    }

    //Hàm hiển thị form thêm
    public function create()
    {
        $categories = (new Category)->all();
        return view('admin.products.add', compact('categories'));
    }

    //Hàm thêm dữ liệu vào database
    public function store()
    {
        $data = $_POST;

        //Nếu người dùng không nhập ảnh
        $image = "";
        //Nếu người dùng nhập ảnh
        $file = $_FILES['image'];
        if ($file['size'] > 0) {
            $image = "images/" . $file['name'];
            //upload ảnh
            move_uploaded_file($file['tmp_name'], ROOT_DIR . $image);
        }
        $data['image'] = $image;

        $product = new Product;
        $product->create($data);
        header("location: " . ADMIN_URL . "?ctl=listsp");
        die;
    }

    //Hiển thị form cập nhật
    public function edit()
    {
        $id = $_GET['id'];
        $product = (new Product)->find($id);
        $categories = (new Category)->all();
        return view(
            'admin.products.edit',
            compact('product', 'categories')
        );
    }

    //Cập nhật dữ liệu vào database
    public function update()
    {
        $data = $_POST;

        //Lấy thông tin sản phẩm cũ
        $product = new Product;
        $item = $product->find($data['id']);
        //Nếu người dùng không nhập ảnh thì lấy lại ảnh cũ
        $image = $item['image'];
        //Nếu người dùng nhập ảnh
        $file = $_FILES['image'];
        if ($file['size'] > 0) {
            $image = "images/" . $file['name'];
            //upload ảnh
            move_uploaded_file($file['tmp_name'], ROOT_DIR . $image);
        }
        $data['image'] = $image;

        //Update
        $product->update($data['id'], $data);
        //di chuyển về lại trang edit
        header("location: " . ADMIN_URL . "?ctl=editsp&id=" . $data['id']);
        die;
    }

    //Xóa sản phẩm
    public function delete()
    {
        $id = $_GET['id'];
        (new Product)->delete($id);

        $_SESSION['message'] = "Xóa dữ liệu thành công";
        //chuyển trang về list
        header("location: " . ADMIN_URL . "?ctl=listsp");
        die;
    }
}
