<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>WeCart</title>

    <link rel="shortcut icon" href="../resources/ico/favicon.ico" type="image/x-icon">
    <link rel="icon" href="../resources/ico/favicon.ico" type="image/x-icon">
    <link rel="stylesheet" href="../resources/css/priceCompare/cart_frame.css">
    <link rel="stylesheet" href="../resources/css/priceCompare/mypage_cart.css">
    <link rel="stylesheet" href="../resources/css/priceCompare/today_cart.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.4.1/jquery-migrate.min.js"></script>
    <script src="https://kit.fontawesome.com/3a5b85a601.js" crossorigin="anonymous"></script>
    <script src="../resources/js/priceCompare/today_cart.js" async></script>
</head>
<body>
    <div id="wrap">
        <div class="widthfix header_color">    
            <div id="header">
                <span>우리동네<br>장바구니</span>
                <div id="gnb">
                    <ul class="nav gnb">
                        <li class="nav_item gnb_li"><a href="/priceCompare/list" class="nav_text">가격비교</a></li>
                        <li class="nav_item gnb_li"><a href="#" class="nav_text">커뮤니티</a> </li>
                        <li class="nav_item gnb_li"><a href="#" class="nav_text">QNA</a></li>
                    </ul>
                </div>

                <div id="info">
                    <ul class="nav">
                        <li class="nav_item"><span class="nav_text">개포동</span></li>
                        <li class="nav_item"><button onclick=window.location.href='#' id="login_bt">로그인</button></li>
                    </ul>
                </div>
            </div>
        </div>

        <div class="widthfix">    
            <div id="search">
                <div class="cate">
                    <i class="fa-solid fa-bars fa-2x"></i>
                    <span>카테고리</span>    
                </div>
                <div class="search_bar">
                    <form action="/priceCompare/search" method="get">
                        <div class="search_form">
                            <input type="text" name="search_item" placeholder="검색어를 입력해주세요" class="search_input">
                            <button type="submit"class="submit_bt"><i class="fa-solid fa-magnifying-glass fa-lg"></i></button>
                        </div>                    
                    </form>                          
                </div> 
                <div>
                    <button type="button" class="mypick_bt mypick_goods"><i class="fa-regular fa-heart fa-2x"></i></button>
                    <button type="button" class="mypick_bt mypick_cart"><i class="fa-solid fa-cart-shopping fa-2x"></i></button>
                </div>             
            </div>
        </div>
        
        <div class="widthfix"> 
            <div id="container">
                <div id="section">
                    <div class="article">
                        <div class="mypage_article_content">
                            <div>
                                <h2>오늘의 장바구니</h2>
                            </div>
                            <div class="mycart_table_div">
                                <form action="/todayCart/register" method="post">
                                    <table id="mycart_tbl">
                                        <thead>
                                            <tr>
                                                <th scope="col" colspan="2">
                                                    <div class="goods_select">
                                                        <label class="checkBox">
                                                            <input type="checkbox" name="todayCartList" id="allSelect" value="allSelect" checked>   
                                                            <span class="allSelectText">전체선택</span>
                                                            <button type="button" id="allDeletebt">선택삭제</button>
                                                        </label>
                                                        <span>상품 정보</span>
                                                    </div>
                                                </th>
                                                <th scope="col"><span>GS더프레시아산탕정점</span></th>
                                                <th scope="col"><span>GS더프레시대전도마점</span></th>
                                                <th scope="col"><span>GS더프레시안양메가트리아점</span></th>
                                                <th scope="col"><span>(주)농협하나로유통 광주점</span></th>
                                            </tr>
                                        </thead>
                                        <tbody>     <!--동적-->
                                            <tr class="goods_price_tr">
                                                <td colspan="2" class="td_cart_goods_list">
                                                    <div class="cart_goods_list">
                                                        <div class="checkBox_img">
                                                            <label>
                                                                <input type="checkbox" name="todayCartList" class="cart_select" value="">
                                                            </label>                                                            
                                                            <div>
                                                                <a href="#"><img src="https://picsum.photos/id/684/100/100" class="cart_goods_image"></a>
                                                            </div>
                                                        </div>                                                        
                                                        <div class="cart_title_count">
                                                            <a href="#" class="a_black_text"><span>오리온 포카칩 오리지널 어니언맛 치즈맛 불고기맛(66g)</span></a>
                                                            <div class="count_bt_delete">
                                                                <div class="count_bt">
                                                                    <button type="button" aria-label="수량내리기" class="count_minus_plus_bt count_minus_bt"></button>
                                                                    <div class="amount_div">1</div>
                                                                    <button type="button" aria-label="수량올리기" class="count_minus_plus_bt count_plus_bt"></button>
                                                                </div>
                                                                <div class="delete_bt_div">
                                                                    <button type="button" aria-label="장바구니삭제" class="delete_bt"></button>
                                                                </div>
                                                            </div>                                                            
                                                        </div>                                                    
                                                    </div>
                                                </td>
                                                <td>
                                                    <span class="goods_price" data-price="12600">12,600</span>
                                                    <span>원</span>                                                
                                                </td>   
                                                <td>
                                                    <span class="goods_price" data-price="2600">2,600</span>
                                                    <span>원</span>   
                                                </td>
                                                <td>
                                                    <span class="goods_price" data-price="2600">2,600</span>
                                                    <span>원</span>   
                                                </td>
                                                <td>
                                                    <span class="goods_price" data-price="2600">2,600</span>
                                                    <span>원</span>  
                                                </td>                                         
                                            </tr>
                                            <tr class="goods_price_tr">
                                                <td colspan="2" class="td_cart_goods_list">
                                                    <div class="cart_goods_list">
                                                        <div class="checkBox_img">
                                                            <label>
                                                                <input type="checkbox" name="todayCartList" class="cart_select" value="">
                                                            </label>
                                                            <div>
                                                                <a href="#"><img src="https://picsum.photos/id/684/100/100" class="cart_goods_image"></a>
                                                            </div>
                                                        </div>   
                                                        <div class="cart_title_count">
                                                            <a href="#" class="a_black_text" ><span>오리온 포카칩 오리지널 어니언맛 치즈맛 불고기맛(66g)</span></a>
                                                            <div class="count_bt_delete">
                                                                <div class="count_bt">
                                                                    <button type="button" aria-label="수량내리기" class="count_minus_plus_bt count_minus_bt"></button>
                                                                    <div class="amount_div">1</div>
                                                                    <button type="button" aria-label="수량올리기" class="count_minus_plus_bt count_plus_bt"></button>
                                                                </div>
                                                                <div class="delete_bt_div">
                                                                    <button type="button" aria-label="장바구니삭제" class="delete_bt"></button>
                                                                </div>
                                                            </div>                                                            
                                                        </div>                                                    
                                                    </div>
                                                </td>
                                                <td>
                                                    <span class="goods_price" data-price="2600">5,600</span>
                                                    <span>원</span>                                                
                                                </td>   
                                                <td>
                                                    <span class="goods_price" data-price="2600">2,600</span>
                                                    <span>원</span>   
                                                </td>
                                                <td>
                                                    <span class="goods_price" data-price="2600">2,600</span>
                                                    <span>원</span>   
                                                </td>
                                                <td>
                                                    <span class="goods_price" data-price="2600">2,600</span>
                                                    <span>원</span>  
                                                </td>                                         
                                            </tr>
                                            <tr class="goods_price_tr">
                                                <td colspan="2" class="td_cart_goods_list">
                                                    <div class="cart_goods_list">
                                                        <div class="checkBox_img">
                                                            <label>
                                                                <input type="checkbox" name="todayCartList" class="cart_select" value="">
                                                            </label>
                                                            <div>
                                                                <a href="#"><img src="https://picsum.photos/id/684/100/100" class="cart_goods_image"></a>
                                                            </div>
                                                        </div>   
                                                        <div class="cart_title_count">
                                                            <a href="#" class="a_black_text" ><span>오리온 포카칩 오리지널 어니언맛 치즈맛 불고기맛(66g)</span></a>
                                                            <div class="count_bt_delete">
                                                                <div class="count_bt">
                                                                    <button type="button" aria-label="수량내리기" class="count_minus_plus_bt count_minus_bt"></button>
                                                                    <div class="amount_div">1</div>
                                                                    <button type="button" aria-label="수량올리기" class="count_minus_plus_bt count_plus_bt"></button>
                                                                </div>
                                                                <div class="delete_bt_div">
                                                                    <button type="button" aria-label="장바구니삭제" class="delete_bt"></button>
                                                                </div>
                                                            </div>                                                            
                                                        </div>                                                    
                                                    </div>
                                                </td>
                                                <td>
                                                    <span class="goods_price" data-price="2600">2,600</span>
                                                    <span>원</span>                                                
                                                </td>   
                                                <td>
                                                    <span class="goods_price" data-price="2600">2,600</span>
                                                    <span>원</span>   
                                                </td>
                                                <td>
                                                    <span class="goods_price" data-price="2600">2,600</span>
                                                    <span>원</span>   
                                                </td>
                                                <td>
                                                    <span class="goods_price" data-price="2600">2,600</span>
                                                    <span>원</span>  
                                                </td>                                         
                                            </tr>
                                            <tr class="goods_price_tr">
                                                <td colspan="2" class="td_cart_goods_list">
                                                    <div class="cart_goods_list">
                                                        <div class="checkBox_img">
                                                            <label>
                                                                <input type="checkbox" name="todayCartList" class="cart_select" value="">
                                                            </label>
                                                            <div>
                                                                <a href="#"><img src="https://picsum.photos/id/684/100/100" class="cart_goods_image"></a>
                                                            </div>
                                                        </div>   
                                                        <div class="cart_title_count">
                                                            <a href="#" class="a_black_text" ><span>오리온 포카칩 오리지널 어니언맛 치즈맛 불고기맛(66g)</span></a>
                                                            <div class="count_bt_delete">
                                                                <div class="count_bt">
                                                                    <button type="button" aria-label="수량내리기" class="count_minus_plus_bt count_minus_bt"></button>
                                                                    <div class="amount_div">1</div>
                                                                    <button type="button" aria-label="수량올리기" class="count_minus_plus_bt count_plus_bt"></button>
                                                                </div>
                                                                <div class="delete_bt_div">
                                                                    <button type="button" aria-label="장바구니삭제" class="delete_bt"></button>
                                                                </div>
                                                            </div>                                                            
                                                        </div>                                                    
                                                    </div>
                                                </td>
                                                <td>
                                                    <span class="goods_price" data-price="2600">2,600</span>
                                                    <span>원</span>                                                
                                                </td>   
                                                <td>
                                                    <span class="goods_price" data-price="2600">2,600</span>
                                                    <span>원</span>   
                                                </td>
                                                <td>
                                                    <span class="goods_price" data-price="2600">2,600</span>
                                                    <span>원</span>   
                                                </td>
                                                <td>
                                                    <span class="goods_price" data-price="2600">2,600</span>
                                                    <span>원</span>  
                                                </td>                                         
                                            </tr>
                                            <tr class="goods_price_tr">
                                                <td colspan="2" class="td_cart_goods_list">
                                                    <div class="cart_goods_list">
                                                        <div class="checkBox_img">
                                                            <label>
                                                                <input type="checkbox" name="todayCartList" class="cart_select" value="">
                                                            </label>
                                                            <div>
                                                                <a href="#"><img src="https://picsum.photos/id/684/100/100" class="cart_goods_image"></a>
                                                            </div>
                                                        </div>   
                                                        <div class="cart_title_count">
                                                            <a href="#" class="a_black_text" ><span>오리온 포카칩 오리지널 어니언맛 치즈맛 불고기맛(66g)</span></a>
                                                            <div class="count_bt_delete">
                                                                <div class="count_bt">
                                                                    <button type="button" aria-label="수량내리기" class="count_minus_plus_bt count_minus_bt"></button>
                                                                    <div class="amount_div">1</div>
                                                                    <button type="button" aria-label="수량올리기" class="count_minus_plus_bt count_plus_bt"></button>
                                                                </div>
                                                                <div class="delete_bt_div">
                                                                    <button type="button" aria-label="장바구니삭제" class="delete_bt"></button>
                                                                </div>
                                                            </div>                                                            
                                                        </div>                                                    
                                                    </div>
                                                </td>
                                                <td>
                                                    <span class="goods_price" data-price="2600">2,600</span>
                                                    <span>원</span>                                                
                                                </td>   
                                                <td>
                                                    <span class="goods_price" data-price="2600">2,600</span>
                                                    <span>원</span>   
                                                </td>
                                                <td>
                                                    <span class="goods_price" data-price="2600">2,600</span>
                                                    <span>원</span>   
                                                </td>
                                                <td>
                                                    <span class="goods_price" data-price="2600">2,600</span>
                                                    <span>원</span>  
                                                </td>                                         
                                            </tr>
                                        </tbody>
                                        <tfoot>
                                            <tr>
                                                <td colspan="2">
                                                    <span>합계</span>
                                                </td>
                                                <td>
                                                    <span class="total_price"></span>
                                                    <span>원</span>  
                                                </td>
                                                <td>
                                                    <span class="total_price"></span>
                                                    <span>원</span>  
                                                </td>
                                                <td>
                                                    <span class="total_price"></span>
                                                    <span>원</span>  
                                                </td>
                                                <td>
                                                    <span class="total_price"></span>
                                                    <span>원</span>  
                                                </td>
                                            </tr>
                                        </tfoot>
                                    </table>

                                    <div class="mycart_tbl_button_flex">
                                        <input type="submit" value="장바구니 저장" class="mycart_tbl_bt todayCartSave">
                                    </div>
                                </form>                        
                            </div>                            
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <a href="#TOP" id="top_bt">
            <i class="fa-solid fa-arrow-up fa-lg"></i>
        </a>

        <div class="widthfix"> 
            <div id="footer">
            
            </div>
        </div>
    </div>
</body>
</html>
