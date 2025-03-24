<?php
class CartController
{
    //Thêm sản phẩm giỏ hàng
    public function addToCart()
    {
        $carts = $_SESSION['cart'] ?? [];


        //lấy id sản phẩm cần thêm vào giỏ hàng
        $id = $_GET['id'];
        //lấy sản phẩm theo id
        $product = (new Product)->find($id);
        //kiểm tra xem giỏ hàng có sản phẩm chưa
        if (isset($carts[$id])) {
            $carts[$id]['quantity'] += 1;
        } else {
            $carts[$id] = [
                'name' => $product['name'],
                'image' => $product['image'],
                'price' => $product['price'],
                'quantity' => 1,
            ];
        }

        //Gán lại giỏ hàng cho sesion
        $_SESSION['cart'] = $carts;

        //Tính tổng số lượng
        $_SESSION['totalQuantity'] = $this->totalQuantityInCart();

        //lấy lại URI trước đó
        $uri = $_SESSION['URI'];
        return header('location: ' . $uri);
    }

    // Tính tổng số lượng sản phẩm ở trong giỏ hàng
    public function totalQuantityInCart()
    {
        $carts = $_SESSION['cart'] ?? [];
        $total = 0;
        foreach ($carts as $cart) {
            $total += $cart['quantity'];
        }
        return $total;
    }

    //Tính tổng giá trong giỏ hàng
    public function totalPriceInCart()
    {
        $carts = $_SESSION['cart'] ?? [];
        $total = 0;
        foreach ($carts as $cart) {
            $total += $cart['price'] * $cart['quantity'];
        }
        return $total;
    }

    //Hàm hiển thị chi tiết giỏ hàng
    public function viewCart()
    {
        $carts = $_SESSION['cart'] ?? [];

        $categories = (new Category)->all();
        $totalPrice = $this->totalPriceInCart();
        return view('clients.carts.cart', compact('carts', 'categories', 'totalPrice'));
    }

    public function deleteproductInCart()
    {
        $id = $_GET['id'];
        unset($_SESSION['cart'][$id]);
        $_SESSION['totalQuantity'] = $this->totalQuantityInCart();

        return header("location: " . ROOT_URL . "?ctl=view-cart");
    }
}
