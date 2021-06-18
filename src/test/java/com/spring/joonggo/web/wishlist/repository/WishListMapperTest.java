package com.spring.joonggo.web.wishlist.repository;

import com.spring.joonggo.web.common.paging.Criteria;
import com.spring.joonggo.web.sellboard.domain.SellBoard;
import com.spring.joonggo.web.wishlist.domain.WishList;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.ArrayList;
import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class WishListMapperTest {

    @Autowired
    private WishListMapper wishListMapper;

    @Test
    void addWishList() {
        WishList wishList = WishList.builder()
                .productNum(6)
                .productName("aaaaa")
                .userId("sada")
                .userNick("asddd")
                .build();

        wishListMapper.addWishList(wishList);
    }

    @Test
    void findWish() {

        List<WishList> wishLists = new ArrayList<>();
        wishLists = wishListMapper.findWish("sada");
        System.out.println("=====================================================");
        for (WishList wishList : wishLists) {
            System.out.println(wishList);
        }
        System.out.println("========================================================");

    }

    @Test
    void deleteWish() {
        wishListMapper.deleteWish(6);
    }
}