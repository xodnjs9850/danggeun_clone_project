package com.spring.joonggo.web.wishlist.repository;

import com.spring.joonggo.web.wishlist.domain.WishList;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface WishListMapper {

    // 찜 추가 기능
    void addWishList(WishList wishList);

    // 찜 목록 조회 기능
    List<WishList> findWish(String userId);

    // 찜 개별 삭제
    void deleteWish(int productNum);

}
