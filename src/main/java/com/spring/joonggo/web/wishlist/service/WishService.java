package com.spring.joonggo.web.wishlist.service;

import com.spring.joonggo.web.wishlist.domain.WishList;
import com.spring.joonggo.web.wishlist.repository.WishListMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class WishService {

    @Autowired
    private final WishListMapper wishListMapper;

    // 찜 목록 조회
    public List<WishList> findWish(String userId) {
        return wishListMapper.findWish(userId);
    }

    // 찜 목록 추가
    public void addWishList(WishList wishList) {
        wishListMapper.addWishList(wishList);
    }

    // 찜 목록 삭제
    public void deleteWish(int productNum) {
        wishListMapper.deleteWish(productNum);
    }

}
