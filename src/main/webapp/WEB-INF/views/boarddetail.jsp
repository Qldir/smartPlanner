<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="icon" href="./resources/img/icon/favicon.ico">
<title>日程掲示板</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
<link rel="stylesheet" href="./resources/css/wireframe.css">
</head>
</head>
<body style="overflow-x:hidden;">
	<nav
		class="navbar fixed-top navbar-expand-md navbar-dark navbar-shadow">
		<div class="container">
			<a class="navbar-brand" href="/smartplanner"> <img
				src="./resources/img/icon/planstation.png" style="height:25px; width:35px;" class="mr-1"> <b> Plan Station</b>
			</a>
			<button class="navbar-toggler navbar-toggler-right" type="button"
				data-toggle="collapse">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse text-center justify-content-end"
				id="navbar2">
				<ul class="navbar-nav mr-auto">
					<li class="nav-item"><a class="nav-link font-weight-bold"
						href="/smartplanner/placesearch">旅行地</a></li>
					<li class="nav-item"><a class="nav-link font-weight-bold"
						href="/smartplanner/planning">日程作り</a></li>
					<li class="nav-item"><a class="nav-link font-weight-bold"
						href="/smartplanner/hotel">ホテル</a></li>
					<li class="nav-item"><a class="nav-link font-weight-bold"
						href="/smartplanner/planboard">日程掲示板</a></li>
					<li class="nav-item"><a class="nav-link font-weight-bold"
						href="/smartplanner/howtouse">使用方法</a></li>
				</ul>

				<ul class="navbar-nav">
					<li class="nav-item">
						<div class="input-group">
							<input class="form-control" type="search"
								placeholder="旅行地を探してみてください" aria-label="Search"
								id="searchInputNavbar">
							<div class="input-group-append">
								<button class="btn navbar-btn mr-2 text-white btn-secondary"
									id="searchButtonNavbar">検索</button>
							</div>
						</div>
					</li>
					<c:if test="${sessionScope.member_email==null }">
						<li class="nav-item"><a
							class="btn navbar-btn ml-2 text-white btn-secondary" id="login">
								<i class="fas d-inline fa-lg fa-user-circle"></i> ログイン
						</a></li>
					</c:if>
					<c:if test="${sessionScope.member_email!=null }">
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle font-weight-bold btn bg-secondary text-white border-0"
							href="#" id="navbarDropdownMenuLink" role="button"
							data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
								<i class="fas d-inline fa-lg fa-user-circle"></i>
								${sessionScope.member_name}
						</a>
							<div class="dropdown-menu dropdown-menu-right"
								aria-labelledby="navbarDropdown">
								<a class="dropdown-item" href="/smartplanner/mypage">マイページ</a>
								<a class="dropdown-item" href="/smartplanner/myplan">旅行日程</a>
								<a class="dropdown-item" href="/smartplanner/myfavorite">お気に入り</a>
								<div class="dropdown-divider"></div>
								<a class="dropdown-item" href="/smartplanner/GotoLogout">ログアウト</a>
								<c:if test="${sessionScope.member_type==1 }">
									<div class="dropdown-divider"></div>
									<a class="dropdown-item" href="/smartplanner/adminpage">管理者ページ</a>
								</c:if>
							</div></li>
					</c:if>
				</ul>
			</div>
		</div>
	</nav>
	<!-- Modal -->
	<div class="modal fade" id="loginModal" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="card border-secondary" id="signinContainer">
					<div class="card-header">
						<h3 class="mb-0 my-2">ログイン</h3>
					</div>
					<div class="card-body">

						<form id="formLogin" action="loginNavbar" method="post">
							<div class="form-group">
								<label for="inputEmail3">メールアドレス</label> <input type="email"
									class="form-control" id="loginEmail"
									placeholder="email@gmail.com" name="member_email">
								<div class="invalid-feedback">a@a.a形式で入力してください</div>
							</div>
							<div class="form-group">
								<label for="inputPassword3">暗証番号</label> <input type="password"
									class="form-control" id="loginPassword" placeholder="password"
									name="member_pw" autocomplete="off">
								<div class="invalid-feedback">暗証番号は8-16字で入力してください</div>
							</div>
						</form>

						<div class="form-group">
							<button type="button"
								class="btn btn-info btn-lg float-right w-100 mt-2" id="signin">ログイン</button>
							<a href="join"><button type="button"
									class="btn btn-light btn-lg float-right w-100 mt-2"
									id="googleSignin">
									<img width="20px" alt="Google &quot;G&quot; Logo"
										src="./resources/img/icon/icon-google.png" /> &nbsp; Google
									アカウントでログイン
								</button></a> <label class="mt-2">まだPLAN STATIONの会員ではございませんか？ <a href="#"
								id="signup">会員登録</a></label>
						</div>
					</div>
				</div>
				<div class="card border-secondary" id="signupContainer"
					style="display: none;">
					<div class="card-header">
						<h3 class="mb-0 my-2">会員登録</h3>
					</div>
					<form>
						<div class="card-body">
							<div class="form-group">
								<label for="inputName">お名前</label> <input type="text"
									class="form-control" id="inputUpName" placeholder="full name"
									required="true">
								<div class="invalid-feedback">お名前は2文字以上で入力してください</div>
							</div>
							<div class="form-group">
								<label for="inputEmail3">メールアドレス</label> <input type="email"
									class="form-control" id="inputUpEmail"
									placeholder="email@gmail.com" required="true">
								<div class="valid-feedback">有効なメールアドレスです</div>
								<div class="invalid-feedback">すでに登録済みのメールアドレス、もしくはメールアドレスの形式ではございません</div>
							</div>
							<div class="form-group">
								<label for="inputPassword3">暗証番号</label> <input type="password"
									class="form-control" id="inputUpPassword"
									placeholder="password" required="true" autocomplete="off">
								<div class="invalid-feedback">数字、英語、特殊文字の組み合わせて8-16字で入力してください</div>
							</div>
							<div class="form-group">
								<label for="inputVerify3">暗証番号確認</label> <input type="password"
									class="form-control" id="inputUpVerify"
									placeholder="password (again)" required="true"
									autocomplete="off">
								<div class="invalid-feedback">入力した暗証番号と一致しておりません</div>
							</div>
							<div class="form-group">
								<button type="button"
									class="btn btn-info btn-lg float-right w-100 mt-2 mb-3"
									id="register">会員登録</button>
								<br />
							</div>
						</div>
					</form>
				</div>
				<div class="card border-secondary" id="successContainer"
					style="display: none;">
					<div class="card-header">
						<h3 class="mb-0 my-2 centered text-center">会員登録完了</h3>
					</div>
					<div class="card-body text-center">
						<button type="button" class="btn btn-info btn-lg" id="toSignin">ログイン画面に</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="row pt-3 mt-4 h-100 w-100 mx-0">
		<div class="col-sm-12 text-center h-25" id="planTitleContainer">
			<div class="h-100" id="planTitleView"></div>
		</div>
		<div class="col-sm-5 p-1 pt-2 h-100 bg-light">
			<div class="row w-100 m-0">
				<div class="col-12 pr-0 pl-0">
					<div class="input-group mb-2">
						<div class="input-group-prepend">
							<label class="input-group-text">日付</label>
						</div>
						<select class="custom-select" id="daySelect">
						</select>
					</div>
				</div>
				<div class="col-12 pr-0" style="overflow-y: scroll; height: 520px;">
					<div class="row w-100 mr-1" id="resultView"></div>
				</div>
			</div>
		</div>
		<div class="col-sm-7 p-0 h-100">
			<div class="row h-100 m-0">
				<div class="col-12 h-50 m-0 mt" id="map"></div>
				<div class="col-6 p-2 bg-secondary" style="height:110px;">
					<div class="col-12 h-100 bg-light p-2 px-3" id="moneyView">
					</div>
				</div>
				<div class="col-6 p-2 bg-secondary pl-3" style="height:110px;">
					<div class="row h-100">
						<div class="col-5 h-100 bg-light p-2 px-2 ml-1 mr-2">
							<div class="col-12">
								<i class="far fa-thumbs-up mr-1"></i>
								<span id="thumbs"></span>
							</div>
							<div class="col-12 mt-1">
								<i class="far fa-eye mr-1"></i>
								<span id="eyes"></span>
							</div>
						</div>
						<div class="col-6 h-100 pl-0 pr-3 ml-2">
							<div class="col-12 bg-light h-50 p-2 px-3">
								<i class="far fa-user mr-1"></i>
								<span id="users"></span>
							</div>
							<button class="btn btn-info w-100 mt-1" id="printButton">日程をプリント</button>
						</div>
					</div>
				</div>
				<div class="col-12 p-0 bg-light" style="height:200px;">
					<div class="container p-3 bg-secondary"> 
						<div class="container w-100 px-3 py-2 bg-light" style="height:185px; overflow-y:scroll;">
							<h6 class="px-2 font-weight-bold">詳細説明</h6>
							<p class="mt-1" id="boardContent"></p>
						</div>
					</div>
				</div>
			</div>
		</div>
			<div class="col-12 bg-secondary">
				<div class="row px-5">
					<div class="col-10">
						<div class="input-group mb-3 mt-3" id="commnetInputGroup">
							<textarea class="form-control" id="commentTextArea" rows="2" style="resize: none;"></textarea>
							<div class="input-group-append">
								<button type="button" class="btn btn-info w-100 ml-1 rounded" id="commentButton">コメントを残す</button>
							</div>
						</div>
					</div>
					<div class="col-2 py-2">
						<div class="col-12 bg-secondary h-100 pt-1 mt-1">
							<a class="btn navbar-btn text-white btn-primary btn-lg p-2 mt-1" id="favorite">
		          			<i class="far d-inline fa-lg fa-thumbs-up"></i>好き</a>
						</div>
					</div>
				</div>
			</div>
			<div class="col-12 pt-4 px-5 bg-light" id="comment"></div>
			<div class="col-md-12 pt-2 bg-light">
				<ul class="pagination justify-content-center" id="pagination">
				</ul>
			</div>
	</div>
	
				
	<!-- RouteViewModal-->
	<div class="modal fade" id="detailRouteModal" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="row">
					<div class="col-12 p-0" id="routeMap" style="height: 200px"></div>
					<div class="col-12 py-2 bg-white">
						<div class="btn-group btn-group-toggle" data-toggle="buttons" id="transitBtnGroup">
							<label class="btn btn-secondary active"> 
								<input type="radio" name="transitMode" autocomplete="off" value="0" checked>車
							</label>
							<label class="btn btn-secondary">
								<input type="radio" name="transitMode" autocomplete="off" value="1">公共交通
							</label>
							<label class="btn btn-secondary">
								<input type="radio" name="transitMode" autocomplete="off" value="2">徒歩
							</label>
						</div>
					</div>
					<div class="col-12 p-0 bg-white" id="routeResultView" style="overflow-y: scroll; height: 370px;"></div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 게시글 등록 Modal -->
	<div class="modal fade" id="insertBoardModal" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="card border-secondary">
					<div class="card-header">
						<h4 class="mb-0 my-2">内容修正</h4>
					</div>
					<div class="card-body">
						<form id="insertBoardForm" action="updateboard" method="post">
							<div class="form-group">
								<label>詳細説明</label> 
								<textarea class="form-control" id="insertBoardContent" rows="4" placeholder="내용을 입력해주세요" style="resize: none;"></textarea>
								<input type="hidden" name="board_content" id="board_content">
								<div class="invalid-feedback">内容を入力してください</div>
							</div>
							<input type="hidden" name="board_seq" id="board_seq">
						</form>
						<button type="button" class="btn btn-info w-100 rounded" id="insertBoardButton">内容を修正する</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 로딩화면 -->
	<div id="load">
		<img src="./resources/img/loading.gif" alt="loading">
	</div>
	

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
		integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
		integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
		crossorigin="anonymous"></script>
	<script src="./resources/js/navbar.js"></script>
	<script>
		var routeMap;
		var dayIndex;
		var placeList;
		var legIndex;
		var currentDate;
		
		$(function() {
			
			// 플랜 날짜 계산
			var planFrom=${result}.planDTO.plan.plan_from;
			var planTo=${result}.planDTO.plan.plan_to;
		
			var fromDate = new Date(planFrom.replace('.','/'));
			var toDate = new Date(planTo.replace('.','/'));
			
			if(dateToTime(fromDate)==dateToTime(toDate)){
				var days = Math.ceil( (toDate.getTime()-fromDate.getTime())/(1000*60*60*24) ) + 1;
			}
			else{
				var days = Math.ceil( (toDate.getTime()-fromDate.getTime())/(1000*60*60*24) );
			}
			
			// 플랜 제목 달기
			var titleComponent='';
			titleComponent+='<div class="row h-100">';
			titleComponent+='<div class="col-12 h-50" id="boardContainer">';
			titleComponent+='</div>';
			titleComponent+='<div class="col-12 h-50" style="background: linear-gradient( to bottom, rgba(0,0,0,0), rgba(0,0,0,1));">';
			titleComponent+='<div class="row h-100">';
			titleComponent+='<div class="col-12 h-25">';
			titleComponent+='</div>';
			titleComponent+='<div class="col-7 h-75 mx-0 px-5 text-left">';
			titleComponent+='<h5 class="text-white font-weight-bold mt-1">'+${result}.planDTO.plan.plan_title+'</h5>';
			titleComponent+='</div>';
			titleComponent+='<div class="col-5 h-50 text-white font-weight-bold mx-0 mt-2">';
			titleComponent+=planFrom
			titleComponent+=' ~ ';
			titleComponent+=planTo
			titleComponent+="   ("+days+"Days)";
			titleComponent+='</div>';
			titleComponent+='</div>';
			titleComponent+='</div>';

			$("#planTitleView").append(titleComponent);
			
			var imgsrc=${result}.planDTO.plan.plan_img;
			
			var backgroundCss='url("./resources/img/banner/plan/'+imgsrc+'t.jpg")';
			
			$("#planTitleContainer").css({
				'background-image':backgroundCss,
				'background-repeat':'no-repeat',
				'background-size':'cover'
			});
			
			// 예상 금액, 여행지 수 넣기
			var costSum=0;
			var placeSum=0;
			for(var i=0;i<${result}.planDTO.dayPlanList.length;i++){
				var placeList=${result}.planDTO.dayPlanList[i].placeList;
				for(var j=0;j<placeList.length;j++){
					costSum+=parseInt(placeList[j].place_cost);
					placeSum++;
				}
			}
			
			var costComponent='';
			costComponent+='<div class="col-12">'
			costComponent+='<i class="fas fa-coins mr-1"></i>';
			costComponent+=" 1人ごとに費用 : 最低 " +costSum+" ";
			costComponent+='<i class="fas fa-yen-sign mr-1"></i>';
			costComponent+='</div>';
			costComponent+='<div class="col-12 mt-1">';
			costComponent+='<i class="fas fa-map-marker-alt mr-2"></i>';
			costComponent+=" 総旅行地数 : " +placeSum+"個所";
			costComponent+='</div>';
			
			$("#moneyView").append(costComponent);
			
			// 조회수, 페이버릿 수, 유저 이름, 게시글내용 넣기
			$("#thumbs").text(${result}.board.favorite_sum);
			$("#eyes").text(${result}.board.board_hitcount);
			$("#users").text(${result}.board.member_name);
			$("#boardContent").html(${result}.board.board_content);
			
			// 로그인 안했을시 덧글 작성 불가
			if(${sessionScope.member_name==null}){
				$("#commnetInputGroup").on('click',function(){
					alert("コメント残し機能はログインユーザーだけ使用可能です。");
				});
				$("#commentTextArea").attr("readonly","readonly");
				$("#commentButton").attr("disabled", true);
			}
			
			// 글쓴이일 경우 글삭제, 수정 추가
			if("${sessionScope.member_seq}"==${result}.board.member_seq){
				var boardComponent='';
				boardComponent+='<div class="row justify-content-end pr-5 pt-2">';
				boardComponent+='<div class="col-2">';
				boardComponent+='<button type="button" class="btn btn-info w-100 ml-1 rounded" id="updateBoard">内容修正</button>';
				boardComponent+='</div>';
				boardComponent+='<div class="col-2">';
				boardComponent+='<button type="button" class="btn btn-info w-100 ml-1 rounded" id="deleteBoard">削除</button>';
				boardComponent+='</div>';
				boardComponent+='</div>';
				
				$("#boardContainer").append(boardComponent);
				
				$("#updateBoard").on('click',function(){
					$("#insertBoardModal").modal();
					var boardContent = $("#boardContent").html();
					boardContent = boardContent.split('<br>').join("\r\n");
					$("#insertBoardContent").val(boardContent);
				});
				
				// 게시글 수정 이벤트
				$("#insertBoardButton").on('click',function(){
					var content=$('#insertBoardContent').val();
					content=content.replace(/(?:\r\n|\r|\n)/g, '<br/>');
					$('#board_content').val(content);
					if(content==""){
						$("#insertBoardContent").removeClass("is-valid");
						$("#insertBoardContent").addClass("is-invalid");
					}else{
						$("#insertBoardContent").removeClass("is-invalid");
						$("#insertBoardContent").addClass("is-valid");
						$("#board_seq").val(${result}.board.board_seq);
						$("#insertBoardForm").submit();
					}
				});
				
				$("#deleteBoard").on('click',function(){
					if (confirm("本当に削除しますか？") == true){
						$.ajax({
							url:"deleteboard",
							type:"post",
							data:{
								board_seq:${result}.board.board_seq,
							},
							success:function(result){
								if(result==1){
									$(location).attr("href","./planboard");
								}else{
									alert("通信エラー");
								}
							},
							error:function(){
								alert("通信エラー");
							}
						});
					}
				});
			}
			
			// 인쇄하기 버튼
			$("#printButton").on('click',function(){
				window.open("./planprint?num="+${result}.planDTO.plan.plan_seq,"planprint","width=1000px, height=500px, toolbar=no, menubar=no, scrollbars=no, resizable=yes");
			});
			
			// 페이브릿 여부 넣기
			if(${result}.favorite>0){
				$("#favorite").removeClass("btn-primary");
				$("#favorite").addClass("btn-info");
			}
			
			// 플랜 리스트 넣기
			for(var i=0;i<${result}.planDTO.dayPlanList.length;i++){
				var dayOption ="";
				dayOption+='<option value="'+i+'">';
				dayOption+=(parseInt(i)+1)+"日目 ("+${result}.planDTO.dayPlanList[i].date+")";
				dayOption+='</option>';
			    
				$("#daySelect").append(dayOption);
				
				if(i==0){
					$("#daySelect option").attr("selected","selected");
				}
			}	
			
			// 온체인지 이벤트 추가
			$("#daySelect").on('change', selectDay);
			
			$('#load').hide();
			
			// 교통수단 체인지 이벤트
			$("input[name=transitMode]").on('change',function(){
				var transit=$(this).val();
				calculateAndDisplayRoute(directionResponse[legIndex].start_location, directionResponse[legIndex].end_location, transit);
			});

			// 모달 초기화 이벤트
			$("#detailRouteModal").on('hidden.bs.modal', function() {
				$("input[name=transitMode][value='0']").prop("checked",true);
				$("#transitBtnGroup label").removeClass("active");
				$("#transitBtnGroup label:first-child").addClass("active");
			});
			
			$("#insertBoardModal").on('hidden.bs.modal', function() {
				$("#insertBoardContent").val("");
			});
			
			// 덧글 달기 ajax 이벤트
	 		$("#commentButton").on("click",function(){
				var content=$("#commentTextArea").val();
				content=content.replace(/(?:\r\n|\r|\n)/g, '<br/>');
				$.ajax({
					url:"detailboard/insertcomment",
					type:"post",
					data:{
						board_comment_content:content,
						board_seq:${result}.board.board_seq
					},
					success:function(result){
						if(result==1){
							$("#commentTextArea").val("");
							refreshPage();
						}else{
							alert("通信エラー");
						}
					},
					error:function(){
						alert("通信エラー");
					}
				});
			});
			
			// 비 로그인시 페이보릿 비활성화
			if(${sessionScope.member_email==null}){
				$("#favorite").click(function(){
					alert("好き機能はログインユーザーだけ使用可能です。");
				});
			}else{
			// 페이보릿 ajax
		 		$("#favorite").on('click',function(){
		 			if($("#favorite").hasClass("btn-primary")){
		 				$.ajax({
			 				url:"detailboard/insertfavorite",
							type:"post",
							data:{
								board_seq:${result}.board.board_seq
							},
							success:function(result){
								if(result==1){
									$("#favorite").removeClass("btn-primary");
									$("#favorite").addClass("btn-info");
									refreshFavorite();
								}else{
									alert("通信エラー");
								}
							},
							error:function(){
								alert("通信エラー");
							}
			 			});
		 			}else if($("#favorite").hasClass("btn-info")){
		 				$.ajax({
			 				url:"detailboard/deletefavorite",
							type:"post",
							data:{
								board_seq:${result}.board.board_seq
							},
							success:function(result){
								if(result==1){
									$("#favorite").removeClass("btn-info");
									$("#favorite").addClass("btn-primary");
									refreshFavorite();
								}else{
									alert("通信エラー");
								}
							},
							error:function(){
								alert("通信エラー");
							}
			 			});
		 			}
		 		});
			}
	 		
	 		refreshPage();
		});
		
		// 일자 선택시 함수
		function selectDay(){
			dayIndex=$(this).children("option:selected").val();
			
			placeList = ${result}.planDTO.dayPlanList[dayIndex].placeList;
			
			setWayPointsDirectionsByPlaces(placeList, ${result}.planDTO.plan.plan_startlocation, 0);
		}
		
		// 위치 찍어주기 콜백 함수
		function callbackDirections(){
			$("#resultView").html("");
			
			var dayComponent = '';
			dayComponent+='<div class="col-3 p-0 text-light text-center" style="background-color:teal;">';
			dayComponent+="<h4 class='pt-1'>Day"+(parseInt(dayIndex)+1);+"</h4";
			dayComponent+='</div>';
			dayComponent+='<div class="col-9" style="background-color:white;">';
			dayComponent+="<h5 class='pt-2'>"+${result}.planDTO.dayPlanList[dayIndex].date+"</h4>";
			dayComponent+='</div>';
			dayComponent+='</div>';
			
			$("#resultView").append(dayComponent);
			
			if(dayIndex==0){
				currentDate=new Date(${result}.planDTO.plan.plan_from);
			}else{
				currentDate.setTime(1*60*60*1000);
			}
			addhotelInList(${result}.planDTO.plan.plan_startlocation);
			
			for(var i=0;i<placeList.length;i++){
				addLegInList(i);	
				addPlaceInList(placeList[i], i);
			}
				
			if(placeList.length>0){
				addLegInList(placeList.length);
				addhotelInListTo(${result}.planDTO.plan.plan_startlocation);
			}
			
			// 플레이스 디테일 팝업추가
			$(".place-detail").on('click',popupDetail);
			// 플레이스 주소로 구글맵 이동
			$(".place-address").on('click',setLocation);
			// 루트 뷰 온클릭 이벤트
			$(".route-view").on('click',routeModal);
		}
		
		// 중간 루트 추가
		function addLegInList(index){
 			var legComponent = '';
			legComponent+='<div class="col-1 py-1 px-0 text-center">';
			legComponent+='<img src="./resources/img/icon/distance_line.gif">';
			legComponent+='</div>';
			legComponent+='<div class="col-11 py-1 px-0 ">';
			legComponent+='<a class="route-view font-weight-bold" href="javascript:;">';
			legComponent+='<input type="hidden" value="'+index+'">';
			legComponent+="距離 : "+directionResponse[index].distance.text+", 消耗時間 : "+directionResponse[index].duration.text;
			legComponent+='</a>';
			legComponent+='</div>';
			$("#resultView").append(legComponent);
			
			currentDate.setTime(currentDate.getTime() + parseInt(directionResponse[index].duration.value)*1000);
		}
		
		// 호텔 리스트에 추가
		function addhotelInList(address){
			var resultComponent = '';
			resultComponent+='<div class="col-1 py-1 px-0  text-center bg-primary">';
			resultComponent+='<div class="rounded-circle text-light font-weight-bold ml-1" style="width:30px; height:30px; background-color:teal;">H</div>';
			resultComponent+='</div>';
			resultComponent+='<div class="col-9 py-1 px-0 bg-primary">';
			resultComponent+='<h6 class="mb-1">'+address+'</h6>';
			if(placeList.length>0){
				resultComponent+='<p class="mb-0 text-center" style="font-size:14px;">予想出発時間 : '+dateToTime(currentDate)+'</p>';
			}
			resultComponent+='</div>';
			resultComponent+='<div class="col-2 py-1 px-0  bg-primary">';
			resultComponent+='<a class="place-address ml-1" href="javascript:;" title="'+address+'">';
			resultComponent+='<img src="./resources/img/icon/map.png">';
			resultComponent+='</a>';
			resultComponent+='</div>';
			
			$("#resultView").append(resultComponent);
		}
		
		function addhotelInListTo(address){
			var resultComponent = '';
			resultComponent+='<div class="col-1 py-1 px-0  text-center bg-primary">';
			resultComponent+='<div class="rounded-circle text-light font-weight-bold ml-1" style="width:30px; height:30px; background-color:teal;">H</div>';
			resultComponent+='</div>';
			resultComponent+='<div class="col-9 py-1 px-0 bg-primary">';
			resultComponent+='<h6 class="mb-1">'+address+'</h6>';
			resultComponent+='<p class="mb-0 text-center" style="font-size:14px;">予想到着時間 : '+dateToTime(currentDate)+'</p>';
			resultComponent+='</div>';
			resultComponent+='<div class="col-2 py-1 px-0  bg-primary">';
			resultComponent+='<a class="place-address ml-1" href="javascript:;" title="'+address+'">';
			resultComponent+='<img src="./resources/img/icon/map.png">';
			resultComponent+='</a>';
			resultComponent+='</div>';
			
			$("#resultView").append(resultComponent);
		}
		
		// 플레이스 리스트에 추가
		function addPlaceInList(place, index){
			var resultComponent = '';
			resultComponent+='<div class="col-1 py-1 px-0  text-center bg-primary">';
			resultComponent+='<div class="rounded-circle text-light font-weight-bold ml-1" style="width:30px; height:30px; background-color:teal;">'+(index+1)+'</div>';
			resultComponent+='</div>';
			resultComponent+='<div class="col-3 py-1 px-0 bg-primary">';
			resultComponent+='<img src="./resources/img/place/'+place.place_image+'" style="height:90px; width:120px; ">';
			resultComponent+='</div>';
			resultComponent+='<div class="col-6 py-1 px-0 bg-primary">';
			resultComponent+='<h6 class="mb-1">'+place.place_name+'</h6>';
			resultComponent+='<p class="mb-0" style="font-size:14px;">予想到着時間 : '+dateToTime(currentDate)+'</p>';
			resultComponent+='<p class="mb-0" style="font-size:14px;">予定使用時間 : '+place.place_spendtime+'</p>';
			// 시간 더하기
			currentDate.setTime(currentDate.getTime() + parseInt(place.place_spendtime.split(':')[0])*60*60*1000 + parseInt(place.place_spendtime.split(':')[1])*60*1000);
			resultComponent+='<p class="mb-0" style="font-size:14px;">予想出発時間 : '+dateToTime(currentDate)+'</p>';
			resultComponent+='</div>';
			resultComponent+='<div class="col-2 py-1 px-0 bg-primary">';
			resultComponent+='<a class="place-address ml-1" href="javascript:;" title="'+place.place_location+place.place_name+'">';
			resultComponent+='<img src="./resources/img/icon/map.png">';
			resultComponent+='</a>';
			resultComponent+='<a class="place-detail ml-1" href="/smartplanner/detailplaceinfo?num='+place.place_seq+'">';
			resultComponent+='<img src="./resources/img/icon/info.png">';
			resultComponent+='</a>';
			resultComponent+='</div>';
			
			$("#resultView").append(resultComponent);
		}
		
		// 루트 상세정보 모달 표시
		function routeModal(){
			$("#routeResultView").html("");
			var indexRoute = $(this).children("input").val();
			legIndex=indexRoute;
			calculateAndDisplayRoute(directionResponse[indexRoute].start_location, directionResponse[indexRoute].end_location, 0);
			$("#detailRouteModal").modal();
		}

		// 구글맵 콜백함수
		function initMap() {
			var myOption = {
				zoom : 10,
				center : {
					lat : 35.6894875,
					lng : 139.6917639999993
				},
				gestureHandling : 'greedy'
			};

			map = new google.maps.Map(document.getElementById('map'), myOption);
			
			// 첫째날 일정 세팅
			dayIndex=0;
			placeList=${result}.planDTO.dayPlanList[0].placeList;
			setWayPointsDirectionsByPlaces(placeList, ${result}.planDTO.plan.plan_startlocation, 0);
		}
		
		// 플레이스 상세 정보 눌렀을때 팝업 표시
		function popupDetail(){
			window.open($(this).attr("href"), "detailPopup","width=1000px, height=500px, toolbar=no, menubar=no, scrollbars=no, resizable=yes");
			return false;
		}
		
		// 데이트 시간으로 변환
		function dateToTime(date){
		    return ("0" + date.getHours()).slice(-2) + ":" +("0" + date.getMinutes()).slice(-2);
		}
		
		// 플레이스 위치 눌렀을때 지도에 위치 이동
		function setLocation(){
			var address=$(this).attr("title");
			geocodeAddressSetMap(address);
			return false;
		}
		
		// 리프레쉬 ajax
		function refreshPage(){
			$.ajax({
				url:"detailboard/getcomment",
				type:"post",
				data:{
					board_seq:${result}.board.board_seq
				},
				success:function(result){
					if(result!=null){
						refreshComment(result);
						refreshPagination(result);
					}else{
						alert("通信エラー");
					}
				},
				error:function(){
					alert("通信エラー");
				}
			});
		}
		
		function refreshComment(result){
			$("#comment").html("");
			
			var commentCount="";
			commentCount+='<div class="col-12">';
			commentCount+='<h6 class="mb-0 mx-4">コメント ('+result.totalRecordsCount+')</h6>';
			commentCount+='</div>';
			$("#comment").append(commentCount);
			// 덧글 추가
			for(var i=0;i<result.commentList.length;i++){
				var commentComponent="";
				commentComponent+='<div class="row px-5 pt-0">';
				commentComponent+='<div class="col-sm-2 p-2">';
				commentComponent+='<div class="card w-100 mt-2">';
				commentComponent+='<img class="card-img-top" src="./resources/img/profile/'+result.commentList[i].member_img+'" alt="profile image" style="height:140px;width:142px;">';
				commentComponent+='</div>';
				commentComponent+='</div>';
				commentComponent+='<div class="col-sm-10 p-2 pr-5">';
				commentComponent+='<div class="card w-100 mt-2">';
				commentComponent+='<div class="card-body">';
				commentComponent+='<h4 class="card-title my-0">'+result.commentList[i].member_name+'</h4>';
				commentComponent+='<p class="card-text mt-1 mb-0" style="min-height:40px !important;">'+result.commentList[i].board_comment_content+'</p>';
				commentComponent+='<div class="row align-bottom">';
				commentComponent+='<div class="col-sm-10">';
				commentComponent+='<p class="card-text my-0"><small class="text-muted">'+result.commentList[i].board_comment_regdate+'</small></p>';
				commentComponent+='</div>';
				if(result.commentList[i].member_seq=="${sessionScope.member_seq}"){
					commentComponent+='<div class="col-sm-2">';
					commentComponent+='<a href="javascript:;" class="card-link review-update">修正</a>';
					commentComponent+='<a href="javascript:;" class="card-link review-delete">削除</a>';
					commentComponent+='<input type="hidden" value="'+result.commentList[i].board_comment_seq+'">';
					commentComponent+='</div>';
				}
				commentComponent+='</div>';
				commentComponent+='</div>';
				commentComponent+='</div>';
				commentComponent+='</div>';
				
				$("#comment").append(commentComponent);
			}
			
			// 덧글 수정 삭제 이벤트 추가
			$(".review-delete").on('click', deleteReview);
			$(".review-update").on('click', updateReview);
		}
		// 리뷰 삭제
		function deleteReview(){
			var comment_seq=$(this).parent().children('input').val();
			$.ajax({
				url:"detailboard/deletecomment",
				type:"post",
				data:{
					board_comment_seq:comment_seq
				},
				success:function(result){
					if(result==1){
						refreshPage();
					}else{
						alert("通信エラー");
					}
				},
				error:function(){
					alert("通信エラー");
				}
			});
		}
		
		// 리뷰 수정
		function updateReview(){
			var content=$(this).parent().parent().parent().children("p").html();
			content = content.split('<br>').join("\r\n");
			var reviewUpdateForm='';
			reviewUpdateForm+='<h4 class="card-title my-0">'+$(this).parent().parent().parent().children("h4").text()+'</h4>';
			reviewUpdateForm+='<div class="col-12 px-0">';
			reviewUpdateForm+='<div class="input-group mt-2 w-100">';
			reviewUpdateForm+='<textarea class="form-control" rows="3" style="resize: none;">'+content+'</textarea>';
			reviewUpdateForm+='<div class="input-group-append">';
			reviewUpdateForm+='<button type="button" class="btn btn-info w-100 ml-1 rounded update-comment">コメント修正</button>';
			reviewUpdateForm+='<input type="hidden" value="'+$(this).parent().children('input').val()+'">';
			reviewUpdateForm+='</div>';
			reviewUpdateForm+='</div>';
			reviewUpdateForm+='</div>';
			$(this).parent().parent().parent().html(reviewUpdateForm);
			
			$(".update-comment").on('click', updateReviewEvent);
		}
		
		// 리뷰 수정 AJAX
		function updateReviewEvent(){
			var comment_seq=$(this).next().val();
			var comment_content=$(this).parent().parent().children("textarea").val();
			comment_content=comment_content.replace(/(?:\r\n|\r|\n)/g, '<br/>');
			$.ajax({
				url:"detailboard/updatecomment",
				type:"post",
				data:{
					board_comment_seq:comment_seq,
					board_comment_content:comment_content
				},
				success:function(result){
					if(result==1){
						refreshPage();
					}else{
						alert("通信エラー");
					}
				},
				error:function(){
					alert("通信エラー");
				}
			});
		}
		
		// 페이지 네이션 리프레쉬
		function refreshPagination(result){
			$("#pagination").html("");
			
			// 페이지 네이션
		
			// 이전 그룹으로
			var previousGroup="";
			previousGroup+='<li class="page-item" value="'+((result.currentGroup-1)*5+1)+'">';
			previousGroup+='<a class="page-link" href="javascript:;">';
			previousGroup+='<span>«</span>';
			previousGroup+='</a>';
			previousGroup+='</li>';
			
			$("#pagination").append(previousGroup);
			
			// 첫그룹 일시에 비활성화
			if(result.currentGroup==0){
				$("#pagination li:last-child").addClass("disabled");
			}
			
			// 번호별 페이지네이션 추가
			if(result.endPageGroup==0){
				var toPage="";
				toPage+='<li class="page-item" value="'+1+'">';
				toPage+='<a class="page-link" href="javascript:;">'+1+'</a>';
				toPage+='</li>';
				
				$("#pagination").append(toPage);
				
				// 현재 페이지 선택 표시
				$("#pagination li:last-child").addClass("active");
			}else{
				for(var i=result.startPageGroup;i<=result.endPageGroup;i++){
					var toPage="";
					toPage+='<li class="page-item" value="'+i+'">';
					toPage+='<a class="page-link" href="javascript:;">'+i+'</a>';
					toPage+='</li>';
					
					$("#pagination").append(toPage);
					
					// 현재 페이지 선택 표시
					if(i==result.currentPage){
						$("#pagination li:last-child").addClass("active");
					}
				}
			}
			
			// 다음 그룹으로
			var nextGroup="";
			nextGroup+='<li class="page-item" value="'+(result.currentGroup*5+6)+'">';
			nextGroup+='<a class="page-link" href="javascript:;">';
			nextGroup+='<span>»</span>';
			nextGroup+='</a>';
			nextGroup+='</li>';
				
			$("#pagination").append(nextGroup);
			
			// 마지막 그룹 일시에 비활성화
			if(result.currentGroup==parseInt(result.totalPageCount/5)){
				$("#pagination li:last-child").addClass("disabled");
			}
			
			// 페이지네이션 이벤트 추가
			$(".page-item").on('click', toPagenation);
		}
		
 		// 페이지 네이션 이동함수
		function toPagenation(){
			var pageNum=$(this).val();
			$.ajax({
				url:"detailboard/getcomment",
				type:"post",
				data:{
					board_seq:${result}.board.board_seq,
					currentPage:pageNum
				},
				success:function(result){
					if(result!=null){
						refreshComment(result);
						refreshPagination(result);
					}else{
						alert("通信エラー");
					}
				},
				error:function(){
					alert("通信エラー");
				}
			});
		} 
		
 		// 페이브릿 리프레쉬 함수
 		function refreshFavorite(){
 			$.ajax({
				url:"detailboard/getfavorite",
				type:"post",
				data:{
					board_seq:${result}.board.board_seq
				},
				success:function(result){
					if(result!=null){
						$("#thumbs").text(result);
					}else{
						alert("通信エラー");
					}
				},
				error:function(){
					alert("通信エラー");
				}
			});
 		}
 		
 		// 데이트 시간으로 변환
 		function dateToTime(date){
 		    return ("0" + date.getHours()).slice(-2) + ":" +("0" + date.getMinutes()).slice(-2);
 		}
	</script>
	<script src="./resources/js/googleMap.js"></script>
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDBsibtVFd7RMFL3pevLFwrAEut_2hPwmw&libraries=places&language=ja&callback=initMap"
		async defer></script>
</body>
</html>