package com.bms.common.page;

public class Pagenation {
    public static PageInfo getPageInfo(int listCount, int currentPage, int pageLimit, int boardLimit) {
        // * Calculate the total number of pages
        int maxPage = (int)Math.ceil((double)listCount / boardLimit);

        // * Calculate the start page of the pagination bar
        int startPage = (currentPage - 1) / pageLimit * pageLimit + 1;

        // * Calculate the end page of the pagination bar
        int endPage = startPage + pageLimit - 1;
        if (endPage > maxPage) {
            endPage = maxPage;
        }

        System.out.println("maxPage: " + maxPage + ", startPage: " + startPage + ", endPage: " + endPage);

        // * Return a PageInfo object containing the pagination details
        return new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
    }
}
