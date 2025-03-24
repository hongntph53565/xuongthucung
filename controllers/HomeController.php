<?php

class HomeController
{
    public function index()
    {
        //Lấy các sản phẩm thú cưng
        $pets = (new Product)->listProductInPet();
        //Lấy sản phẩm không phải thú cưng
        $products = (new Product)->listProductOtherPet();
        $category = (new Category)->all();
        return view("clients.home",compact('pets', 'products', 'category'));
    }
}
