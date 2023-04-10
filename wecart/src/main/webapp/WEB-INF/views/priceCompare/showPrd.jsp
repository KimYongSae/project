<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>WeCart</title>

<link rel="shortcut icon" href="ico/favicon.ico" type="image/x-icon">
<link rel="icon" href="ico/favicon.ico" type="image/x-icon">
<link rel="stylesheet" href="/resources/css/mypageCart/showPrd.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.4.1/jquery-migrate.min.js"></script>
<script src="https://kit.fontawesome.com/3a5b85a601.js"
	crossorigin="anonymous"></script>

<!-- star from fontawsome -->
<script src="https://kit.fontawesome.com/f55d6db1b8.js"
	crossorigin="anonymous"></script>



<script>
        function addProducts() {
            var input = prompt("몇 개를 장바구니에 추가하시겠습니까?");
            var values = input.split(',');

            console.log(input);
            console.log(values);

            var num = Number(values[0]);
            var yesNo = values[1].trim().toLowerCase() === 'yes';

            if (yesNo) {
                alert("You entered the number " + num + " and clicked OK.");
            } else {
                alert("You entered the number " + num + " and clicked Cancel.");
            }
        }

        function changedHeart(btn) {

            var className = btn.className;
            var iTag = btn.childNodes;


            console.log(iTag);
            console.log(iTag[0]);
            console.log(iTag[1]);
            if(btn.childNodes[1] === "i.fa-solid.fa-heart.fa-2xl"){
                console.log("hello");
                btn.childNodes[1] = "fa-regular fa-heart fa-2x";
            }else{

            }
        }
    </script>

</head>

<body>
	<div id="wrap">
		<div class="widthfix header_color">
			<div id="header">
				<span>우리동네<br>장바구니
				</span>
				<div id="gnb">
					<ul class="nav gnb">
						<li class="nav_item gnb_li"><span class="nav_text">가격비교</span></li>
						<li class="nav_item gnb_li"><span class="nav_text">커뮤니티</span>
						</li>
						<li class="nav_item gnb_li"><span class="nav_text">QNA</span></li>
					</ul>
				</div>

				<div id="info">
					<ul class="nav">
						<li class="nav_item"><span class="nav_text">개포동</span></li>
						<li class="nav_item"><button onclick=window.location.href=
								'#' id="login_bt">로그인</button></li>
					</ul>
				</div>
			</div>
		</div>

		<div class="widthfix">
			<div id="search">
				<div class="cate">
					<i class="fa-solid fa-bars fa-2x"></i> <span>카테고리</span>
				</div>
				<div class="search_bar">
					<form action="/priceCompare/search" method="get">
						<div class="search_form">
							<input type="text" name="search_item" placeholder="검색어를 입력해주세요"
								class="search_input">
							<button type="submit" class="submit_bt">
								<i class="fa-solid fa-magnifying-glass fa-lg"></i>
							</button>
						</div>
					</form>
				</div>
				<div>
					<button type="button" class="mypick_bt">
						<i class="fa-regular fa-heart fa-2x"></i>
					</button>
					<button type="button" class="mypick_bt">
						<i class="fa-solid fa-cart-shopping fa-2x"></i>
					</button>
				</div>
			</div>
		</div>


		<article class="article">

			<div id="middleContainer">
				<div class="leftFromUser">
					<h3>과일류 > 수박</h3>
					<h3>1통</h3>
					<img src="/resources/imgs/mypageCart/waterMelon.PNG" alt="waterMelon.PNG" />
				</div>

				<div class="rightFromUser">
					<p></p>
					<div>
						<button type="button" class="mypick_btHeart"
							onclick="return confirm('찜 목록에 추가하시겠습니까?')">
							<i class="fa-regular fa-heart fa-2x"></i>
						</button>

						<!-- <button type="button" class="mypick_btHeart" onclick="changedHeart(this)">
                            <i class="fa-solid fa-heart fa-2xl"></i></button> -->
						<button type="button" onclick=addProducts()>
							장바구니
						</button>
					</div>
					<p style="color: red">최저가격: &emsp;&emsp;&emsp;&emsp; 13000</p>
					<table class="tableToShowPrice">
						<tr>
							<td>마트 1&emsp;
								<button type="button">
									<i class="fa-solid fa-location-dot"></i>
								</button> &emsp;
							</td>
							<td>13.000</td>
						</tr>
						<tr>
							<td>마트 2&emsp;
								<button type="button">
									<i class="fa-solid fa-location-dot"></i>
								</button> &emsp;
							<td>15.000</td>
						</tr>
						<tr>
							<td>마트 3&emsp;
								<button type="button">
									<i class="fa-solid fa-location-dot"></i>
								</button> &emsp;
							<td>15.000</td>
						</tr>
						<tr>
							<td>마트 4&emsp;
								<button type="button">
									<i class="fa-solid fa-location-dot"></i>
								</button> &emsp;
							<td>15.000</td>
						</tr>
						<tr>
							<td>마트 5&emsp;
								<button type="button">
									<i class="fa-solid fa-location-dot"></i>
								</button> &emsp;
							<td>15.000</td>
						</tr>
						<tr>
							<td>마트 6&emsp;
								<button type="button">
									<i class="fa-solid fa-location-dot"></i>
								</button> &emsp;
							<td>15.000</td>
						</tr>
					</table>

				</div>
			</div>
			<p>상품설명: Lorem ipsum dolor, sit amet consectetur adipisicing
				elit. At rem earum exercitationem iste doloribus culpa minima
				suscipit .</p>
		</article>

		<div class="widthfix">
			<div id="footer"></div>
		</div>
	</div>

</body>

</html>