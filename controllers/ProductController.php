<?php
class ProductController
{
    public function index()
    {
        //Lấy id
        $id = $_GET['id'];
        //Lấy sản phẩm theo danh mục id
        $products = (new Product)->listProductInCategory($id);
        //Lấy tên danh mục
        $title = $products[0]['cate_name'] ?? '';
        $category = (new Category)->all();
        $_SESSION['URI'] = $_SERVER['REQUEST_URI'];

        return view(
            'clients.category.category',
            compact('products', 'category', 'title')
        );
    }
    public function show()
    {
        $id = $_GET['id'];
        $product = (new Product)->find($id);
        $categories = (new Category)->all();

        $title = $product['name'] ?? '';

        //lưu thông tin URI
        $_SESSION['URI'] = $_SERVER['REQUEST_URI'];

        return view('clients.product.detail', compact('product', 'product', 'title'));
    }
}
