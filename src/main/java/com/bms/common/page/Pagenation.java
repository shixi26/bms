package com.bms.common.page;

import com.bms.common.page.PageInfo;

public class Pagenation {
   
   public static PageInfo getPageInfo(int listCount, int currentPage, int pageLimit, int boardLimit) {
      // * 마지막 페이지 수 (총 페이지 수)
      int maxPage = (int)Math.ceil((double)listCount / boardLimit);
      // * 페이징바의 시작수
      int startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
      
      // * 페이징바의 끝수
      int endPage;
      if((endPage = startPage + pageLimit - 1) < maxPage){
         endPage = maxPage;
      }
      System.out.println("maxPage: " + maxPage + ", startPage: " + startPage + ", endPage: " + endPage);
      return new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
   }
}